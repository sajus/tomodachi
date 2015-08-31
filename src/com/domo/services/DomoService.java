package com.domo.services;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.domo.dao.DomoDaoImpl;
import com.domo.interfaces.DomoServiceInterface;
import com.domo.pojo.Question;
import com.domo.pojo.SetExam;
import com.domo.pojo.Template;
import com.domo.pojo.User;
@Service
public class DomoService implements DomoServiceInterface{
	@Autowired
	DomoDaoImpl domodaoimpl;
	@Override
	public void addUserService(User user) {
		domodaoimpl.addUser(user);
	}
	@Override
	public List<String> signinUserService(int userid, String password) {
		// TODO Auto-generated method stub
		List<String> user_role=domodaoimpl.signinUser(userid, password);
		System.out.println(user_role);
		return user_role;
	}
	@Override
	public List<User> getAllCandidatesService() {
		// TODO Auto-generated method stub
		System.out.println("inside get all candidates service");
		return domodaoimpl.getAllCandidatesFromDatabase();
	}
	@Override
	public List<SetExam> showCandidateDetailsByIdService(int id) {
		// TODO Auto-generated method stub
		System.out.println("inside get particular candidate detail service");
		return domodaoimpl.getCandidateByIdFromDatabase(id);
	}
	public List<SetExam> showCandidateDetailsByIdNotConductedService(String userid){
		System.out.println("inside get candidate details by id whose exam not conducted");
		return domodaoimpl.getCandidateByIdNotConductedFromDatabase(userid);
	}
	@Override
	public List<SetExam> getAllExamsService(){
		return domodaoimpl.getAllExams();
	}
	@Override
	public List<SetExam> getAllExamStudentService(int exam_id){
		System.out.println("inside get exam for particular exam");
		return domodaoimpl.getAllExamsStudent(exam_id);
	}
	@Override
	public SetExam showExamService(int id) {
		// TODO Auto-generated method stub
		return domodaoimpl.showExam(id);
	}
	@Override
	public void editExamService(SetExam setexam) {
		// TODO Auto-generated method stub
		domodaoimpl.editExamService(setexam);
	}
	@Override
	public void newExamService(SetExam setexam) {
		// TODO Auto-generated method stub
		domodaoimpl.newExam(setexam);
	}
	@Override
	public List<User> getAllStudentsService() {
		// TODO Auto-generated method stub
		return domodaoimpl.getAllStudents();
	}
	@Override
	public List<Template> getAllTemplatesService() {
		// TODO Auto-generated method stub
		return domodaoimpl.getAllTemplates();
	}
	@Override
	public void setExamService(SetExam setexam) {
		// TODO Auto-generated method stub
		domodaoimpl.setExam(setexam);
	}
	//question module
	public List<Question> getAllQuestionsService(){
		return domodaoimpl.getQuestions();
	}
	@Override
	public List<SetExam> getAllDurationsService(int examid) {
		// TODO Auto-generated method stub
		return domodaoimpl.getDurations(examid);
	}
	public void putMarksService(SetExam setexam) {
		// TODO Auto-generated method stub
		domodaoimpl.putMarkService(setexam);
	}
}