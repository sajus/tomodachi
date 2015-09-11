package com.domo.interfaces;
import com.domo.pojo.Question;
import com.domo.pojo.SetExam;
import com.domo.pojo.Template;
import com.domo.pojo.TemplateQuestion;
import com.domo.pojo.User;

import java.lang.String;
import java.util.List;
public interface DomoServiceInterface {
	public void addUserService(User user);
	public List<String> signinUserService(int userid, String password);
	public List<User> getAllCandidatesService();
	public List<SetExam> showCandidateDetailsByIdService(int id);
	public List<SetExam> getAllExamsService();
	public SetExam showExamService(int id);
	public void editExamService(SetExam setexam);
	public List<User> getAllStudentsService();
	public List<Template> getAllTemplatesService();
	public void setExamService(SetExam setexam);
	public List<SetExam> getAllExamStudentService(int exam_id);
	public List<SetExam> showCandidateDetailsByIdNotConductedService(String userid);
	public List<Question> getAllQuestionsService(int examid);
	public List<SetExam> getAllDurationsService(int examid);
	public void putMarksService(SetExam setexam);
	public void putAnswerService(TemplateQuestion template);
}