package com.domo.interfaces;
import java.util.List;
import com.domo.pojo.SetExam;
import com.domo.pojo.Template;
import com.domo.pojo.User;
public interface DomoDao {
	public void addUser(User user);
	List<String> signinUser(int userid, String password);
	public List<User> getAllCandidatesFromDatabase();
	public List<SetExam> getCandidateByIdFromDatabase(int id);
	public List<SetExam> getAllExams();
	public void createExam(SetExam setexam);
	public SetExam showExam(int id);
	public void editExamService(int id);
	public List<User> getAllStudents();
	public List<Template> getAllTemplates();
	public void setExam(SetExam setexam);
	void newExam(SetExam setexam);
}