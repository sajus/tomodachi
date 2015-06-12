package com.domo.dao;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import com.domo.interfaces.DomoDao;
import com.domo.pojo.SetExam;
import com.domo.pojo.Template;
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
		System.out.println("Inside dao implementation");
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
		System.out.println("inside signin user details");
		factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
		entityManager = factory.createEntityManager();
		entityManager.getTransaction().begin();
		if(!authenticUserList.isEmpty())
			authenticUserList.remove(0);
		Query userid1 = entityManager.createQuery("select u.userid from User u where u.userid='"+userid+"'");
		List<Integer> useridList = userid1.getResultList();
		int newElement=useridList.get(0);
		System.out.println(newElement);
		if(newElement==userid)
		{
			System.out.println(newElement==userid);
			Query role = entityManager.createQuery("select u.role from User u where u.userid='"+ userid +"' AND u.password='"+ password +"'");
			List<String> roleList = role.getResultList();
			System.out.println(roleList.get(0));
			if(roleList.get(0).equals("admin"))
			{
				System.out.println(roleList.get(0).equals("admin"));
				authenticUserList.add(0,"admin");
				System.out.println(authenticUserList.get(0));
			}
			else
			{
				authenticUserList.add(0,"candidate");
				System.out.println(authenticUserList.get(0));
			}
		}
		else
		{
			authenticUserList.add(0,"invalid");
			System.out.println(authenticUserList.get(0));
		}
		return authenticUserList;
	}
	@Override
	public List<User> getAllCandidatesFromDatabase() {
		// TODO Auto-generated method stub
		System.out.println("inside get specific candidate details from database");
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
		System.out.println("inside get candidate info from database");
		factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
		entityManager = factory.createEntityManager();
		entityManager.getTransaction().begin();
		Query getCandidate = entityManager.createQuery("select s from SetExam s where s.user.userid='"+id+"'");
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
	public void createExam(SetExam setexam) {
		// TODO Auto-generated method stub
		factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
		entityManager = factory.createEntityManager();
		entityManager.getTransaction().begin();
		entityManager.merge(setexam);
		entityManager.getTransaction().commit();
		System.out.println("data added");
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
	public void editExamService(int id) {
		// TODO Auto-generated method stub
		factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
		entityManager = factory.createEntityManager();
		entityManager.getTransaction().begin();
		Query query=entityManager.createQuery("update SetExam s");
	}
	@Override
	public void newExam(SetExam setexam) {
		// TODO Auto-generated method stub
		System.out.println("Inside dao implementation");
		factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
		entityManager = factory.createEntityManager();
		entityManager.getTransaction().begin();
		entityManager.merge(setexam);
		entityManager.getTransaction().commit();
		System.out.println("data added");
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
	@Override
	public void setExam(SetExam setexam) {
		// TODO Auto-generated method stub
		System.out.println("Inside dao implementation");
		factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
		entityManager = factory.createEntityManager();
		entityManager.getTransaction().begin();
		entityManager.persist(setexam);
		entityManager.getTransaction().commit();
		System.out.println("data added");
	}
}