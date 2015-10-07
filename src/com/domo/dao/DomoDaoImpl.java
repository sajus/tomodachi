package com.domo.dao;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;
import javax.persistence.Query;
import com.domo.interfaces.DomoDao;
import com.domo.pojo.Question;
import com.domo.pojo.SetExam;
import com.domo.pojo.Template;
import com.domo.pojo.TemplateQuestion;
import com.domo.pojo.User;
public class DomoDaoImpl implements DomoDao{
	private static final String PERSISTENCE_UNIT_NAME = "domoJPA";
	private static EntityManagerFactory factory;
	private EntityManager entityManager;
	ArrayList<String> authenticUserList= new ArrayList<String>();
	ArrayList<User> allCandidatesList= new ArrayList<User>();
	public DomoDaoImpl() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
		entityManager = factory.createEntityManager();
		entityManager.getTransaction().begin();
		entityManager.persist(user);
		entityManager.getTransaction().commit();
		System.out.println("data added");
	}
	@Override
	public List<String> signinUser(int userid, String password)
	{
		// TODO Auto-generated method stub
		factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
		entityManager = factory.createEntityManager();
		entityManager.getTransaction().begin();
		if(!authenticUserList.isEmpty())
			authenticUserList.remove(0);
		Query userid1 = entityManager.createQuery("select u.userid from User u where u.userid='"+userid+"'");
		List<Integer> useridList = userid1.getResultList();
		int newElement=useridList.get(0);
			if(newElement==userid)
			{
				Query role = entityManager.createQuery("select u.role from User u where u.userid='"+ userid +"' AND u.password='"+ password +"'");
				List<String> roleList = role.getResultList();
				System.out.println(roleList.get(0));
				if(roleList.get(0).equals("admin"))
				{
					authenticUserList.add(0,"admin");
				}
				else
				{
					authenticUserList.add(0,"candidate");
				}
		    }
		    else
		    {
		        authenticUserList.add(0,"invalid");
		    }
			return authenticUserList;
	}
	@Override
	public List<User> getAllCandidatesFromDatabase() {
		// TODO Auto-generated method stub
		factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
		entityManager = factory.createEntityManager();
		entityManager.getTransaction().begin();
		Query getAllCandidate = entityManager.createQuery("select u from User u where u.role='candidate'");
		List<User> getAllCandidatesList=getAllCandidate.getResultList();
		return getAllCandidatesList;
	}
	@Override
	public List<SetExam> getCandidateByIdFromDatabase(int id) {
		// TODO Auto-generated method stub
		factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
		entityManager = factory.createEntityManager();
		entityManager.getTransaction().begin();
		Query getCandidate = entityManager.createQuery("select s from SetExam s where s.user.userid='"+id+"' and s.is_conducted=1");
		List<SetExam> examList = getCandidate.getResultList();
		Iterator<SetExam> itr = examList.iterator();
		while (itr.hasNext()) {
			System.out.println(itr.next());
		}
		return examList;
	}
	@Override
	public List<SetExam> getCandidateByIdNotConductedFromDatabase(String userid){
		factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
		entityManager = factory.createEntityManager();
		entityManager.getTransaction().begin();
		Query getCandidate = entityManager.createQuery("select s from SetExam s where s.user.userid='"+userid+"' and s.is_conducted=0");
		List<SetExam> examList = getCandidate.getResultList();
		Iterator<SetExam> itr = examList.iterator();
		while (itr.hasNext()) {
			System.out.println(itr.next());
		}
		return examList;
	}
	//exam module
	@Override
	public List<SetExam> getAllExams() {
		// TODO Auto-generated method stub
		factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
		entityManager = factory.createEntityManager();
		entityManager.getTransaction().begin();
		Query query = entityManager.createQuery("select s from SetExam s, User u, Template t where s.user.userid=u.userid and s.templatesetexam.template_id=t.template_id");
		List<SetExam> examList = query.getResultList();
		Iterator<SetExam> itr = examList.iterator();
		while (itr.hasNext()) {
			System.out.println(itr.next());
		}
		return examList;
	}
	@Override
	public List<SetExam> getAllExamsStudent(int exam_id) {
		// TODO Auto-generated method stub
		factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
		entityManager = factory.createEntityManager();
		entityManager.getTransaction().begin();
		Query query = entityManager.createQuery("from SetExam where set_exam_id="+exam_id);
		List<SetExam> examList = query.getResultList();
		Iterator<SetExam> itr = examList.iterator();
		while (itr.hasNext()) {
			System.out.println(itr.next());
		}
		return examList;
	}
	@Override
	public SetExam showExam(int id) {
		// TODO Auto-generated method stub
		factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
		entityManager = factory.createEntityManager();
		entityManager.getTransaction().begin();
		Query query=entityManager.createQuery("select  u.username, s.start_time, s.is_conducted from SetExam s, User u where s.user.userid=u.userid and u.userid="+id);
		SetExam queryResult=(SetExam) query.getResultList();
		return queryResult;
	}
	@Override
	public void editExam(SetExam setexam) {
		// TODO Auto-generated method stub
		factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
		entityManager = factory.createEntityManager();
		entityManager.getTransaction().begin();
		Query query=entityManager.createQuery("update SetExam s set start_date=:new_start_date, start_time=:new_start_time, duration=:new_duration, user.userid=:new_userid, templatesetexam.template_id=:new_template_id where s.set_exam_id="+setexam.getSet_exam_id());
		query.setParameter("new_start_date", setexam.getStart_date());
		query.setParameter("new_start_time", setexam.getStart_time());
		query.setParameter("new_duration", setexam.getDuration());
		query.setParameter("new_userid", setexam.getUser().getUserid());
		query.setParameter("new_template_id", setexam.getTemplatesetexam().getTemplate_id());
		List list = updateRandomQuestions(setexam.getTemplatesetexam().getTemplate_id(), setexam.getSet_exam_id());
		Query query1=entityManager.createQuery("update TemplateQuestion tq set tq.templatequestionsetexam.set_exam_id= :set_exam_id where tq.templatequestionsetexam.set_exam_id=null");
		query1.setParameter("set_exam_id", setexam.getSet_exam_id());
		int updateCount1 = query.executeUpdate();
		int updateCount2 = query1.executeUpdate();
		if((updateCount1 & updateCount2) > 0){
			System.out.println("records updated");
		}
		entityManager.getTransaction().commit();
	}
	@Override
	public List<User> getAllStudents() {
		// TODO Auto-generated method stub
		factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
		entityManager = factory.createEntityManager();
		entityManager.getTransaction().begin();
		Query query = entityManager.createQuery("select u from User u where role='candidate'");
		List<User> studentList = query.getResultList();
		Iterator<User> itr = studentList.iterator();
		while (itr.hasNext()) {
			System.out.println(itr.next());
		}
		return studentList;
	}
	@Override
	public List<Template> getAllTemplates() {
		// TODO Auto-generated method stub
		factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
		entityManager = factory.createEntityManager();
		entityManager.getTransaction().begin();
		Query query = entityManager.createQuery("select t from Template t");
		List<Template> templateList = query.getResultList();
		Iterator<Template> itr = templateList.iterator();
		while (itr.hasNext()) {
			System.out.println(itr.next());
		}
		return templateList;
	}
	//calling stored procedure
	public List<TemplateQuestion> randomQuestions(int template_id) throws PersistenceException {
		  Query query=entityManager.createNativeQuery("{CALL random_question(:template_id)}").setParameter("template_id", template_id); 
		  return query.getResultList(); 
	}
	public List<TemplateQuestion> updateRandomQuestions(int template_id, int set_exam_id) throws PersistenceException {
		Query query=entityManager.createNativeQuery("{CALL update_random_question(:template_id, :set_exam_id)}");
		query.setParameter("template_id", template_id);
		query.setParameter("set_exam_id", set_exam_id);
		return query.getResultList();
	}
	@Override
	public void setExam(SetExam setexam) {
		// TODO Auto-generated method stub
		factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
		entityManager = factory.createEntityManager();
		entityManager.getTransaction().begin();
		setexam = entityManager.merge(setexam);
		List list = randomQuestions(setexam.getTemplatesetexam().getTemplate_id());
		Query query=entityManager.createQuery("update TemplateQuestion tq set tq.templatequestionsetexam.set_exam_id="+setexam.getSet_exam_id()+"where tq.templatequestionsetexam.set_exam_id=null");
		int updateCount = query.executeUpdate();
		if(updateCount > 0){
			System.out.println("record updated");
		}
		entityManager.getTransaction().commit();
		System.out.println("data added");
	}
	//question module
	@Override
	public List<Question> getQuestions(int examid){
		factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
		entityManager = factory.createEntityManager();
		entityManager.getTransaction().begin();
		List<Question> resultList= new ArrayList<Question>();
		Query query = entityManager.createQuery("select question_number from TemplateQuestion tq where templatequestionsetexam.set_exam_id="+examid);
		List<Integer> questionList = query.getResultList();
		System.out.println(questionList);
		Iterator<Integer> itr = questionList.iterator();
		while (itr.hasNext()) {
			Query query1 = entityManager.createQuery("select q from Question q where question_id="+itr.next());
			resultList.add((Question) query1.getResultList().get(0));
		}
		System.out.println(resultList);
		return resultList;
	}
	@Override
	public List<SetExam> getDurations(int examid) {
		// TODO Auto-generated method stub
		factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
		entityManager = factory.createEntityManager();
		entityManager.getTransaction().begin();
		Query query = entityManager.createQuery("select s from SetExam s where s.set_exam_id="+examid);
		List<SetExam> durationList = query.getResultList();
		Iterator<SetExam> itr = durationList.iterator();
		while (itr.hasNext()) {
			System.out.println(itr.next());
		}
		return durationList;
	}
	@Override
	public void putMarkService(SetExam setexam) {
		// TODO Auto-generated method stub
		factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
		entityManager = factory.createEntityManager();
		entityManager.getTransaction().begin();
		Query query=entityManager.createQuery("update SetExam s set marks=:new_marks, is_conducted=:new_is_conducted where set_exam_id="+setexam.getSet_exam_id());
		query.setParameter("new_marks", setexam.getMarks());
		query.setParameter("new_is_conducted", true);
		int updateCount = query.executeUpdate();
		if(updateCount > 0){
			System.out.println("record updated");
		}
		entityManager.getTransaction().commit();
	}
	@Override
	public void putAnswer(TemplateQuestion template) {
		// TODO Auto-generated method stub
		factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
		entityManager = factory.createEntityManager();
		entityManager.getTransaction().begin();
		Query query=entityManager.createQuery("update TemplateQuestion tq set tq.user_answer=:new_user_answer where tq.templatequestionsetexam.set_exam_id="+template.getSetexam().getSet_exam_id()+" and tq.question_number="+template.getQuestion_number());
		query.setParameter("new_user_answer", template.getUser_answer());
		int updateCount = query.executeUpdate();
		if(updateCount > 0){
			System.out.println("record updated");
		}
		entityManager.getTransaction().commit();
	}
}