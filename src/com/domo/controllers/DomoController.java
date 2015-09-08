package com.domo.controllers;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.domo.pojo.Question;
import com.domo.pojo.SetExam;
import com.domo.pojo.Template;
import com.domo.pojo.TemplateQuestion;
import com.domo.pojo.User;
import com.domo.services.DomoService;
@Controller
public class DomoController {
	@Autowired
	DomoService domoservice;
	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public void addUser(@RequestBody User userObject) {
		System.out.println("inside cntrl");
		System.out.println("**" + userObject.getusername()
				+"\t"+ userObject.getRole());
		domoservice.addUserService(userObject);
	}
	@RequestMapping(value = "/usersign", method = RequestMethod.POST)
	@ResponseBody
	public List<String> signinUser(@RequestParam Map<String, String> params) {
		System.out.println(params);
		String password = params.get("password");
		int userId = Integer.parseInt(params.get("userid"));
		System.out.println(password);
		System.out.println(userId);
		System.out.println("inside sign in user");
		List<String> user_role=domoservice.signinUserService(userId, password);
		System.out.println(user_role);
		return	user_role;
	}
	@RequestMapping(value = "/candidates", method = RequestMethod.GET)
	@ResponseBody
    public List<User> getAllCandidates() {
        List<User> getAllCandidateList= domoservice.getAllCandidatesService();
        System.out.println(getAllCandidateList);
        return getAllCandidateList;
    }
	@RequestMapping(value = "/candidateDetails/{id}", method = RequestMethod.GET)
	@ResponseBody
	public List<SetExam> showCandidateDetailsById(@PathVariable int id) {
		List<SetExam> result= domoservice.showCandidateDetailsByIdService(id);
		System.out.println(result);
		return result;
	}
	@RequestMapping(value = "/candidateDetailsNotConducted/{id}", method = RequestMethod.GET)
	@ResponseBody
	public List<SetExam> showCandidateDetailsByIdNotConducted(@PathVariable String id) {
		List<SetExam> result= domoservice.showCandidateDetailsByIdNotConductedService(id);
		System.out.println(result);
		return result;
	}
	//exam module
	@RequestMapping(value = "/exams", method = RequestMethod.GET)
		//index method
    public @ResponseBody List<SetExam> getAllExams() {
        return domoservice.getAllExamsService();
    }
	@RequestMapping(value = "/exam/{id}", method = RequestMethod.GET)
	@ResponseBody
	public SetExam show(@PathVariable int id) {
		return domoservice.showExamService(id);
	}
	@RequestMapping(value = "/exam/edit", method = RequestMethod.PUT)
	public void updateexam(@RequestBody SetExam setexam) {
		domoservice.editExamService(setexam);
	}
	@RequestMapping(value = "/exam/new", method = RequestMethod.POST)
	public void newExam(@RequestBody SetExam setexam) {
		domoservice.newExamService(setexam);
	}
	@RequestMapping(value = "exam/new/setexam", method = RequestMethod.POST)
	public void setExam(@RequestBody SetExam setexam){
		domoservice.setExamService(setexam);
	}
	@RequestMapping(value = "/exams/{exam_id}", method = RequestMethod.GET)
	//getAllTemplates method
	public @ResponseBody List<SetExam> getAllExamStudent(@PathVariable int exam_id) {
		List<SetExam> result=domoservice.getAllExamStudentService(exam_id);
		return result;
	}
	//student module
	@RequestMapping(value = "/exam/new/student", method = RequestMethod.GET)
		//getAllStudents method
	public @ResponseBody List<User> getAllStudents() {
		return domoservice.getAllStudentsService();
	}
	//template module
	@RequestMapping(value = "/exam/new/template", method = RequestMethod.GET)
		//getAllTemplates method
	public @ResponseBody List<Template> getAllTemplates() {
		return domoservice.getAllTemplatesService();
	}
	
	//questions module
	@RequestMapping(value = "/questions/{examid}", method = RequestMethod.GET)
	//index method
	public @ResponseBody List<Question> getAllQuestions(@PathVariable int examid) {
		return domoservice.getAllQuestionsService(examid);
	}
	@RequestMapping(value = "/duration/{examid}", method = RequestMethod.GET)
	@ResponseBody
	public List<SetExam> getAllDurations(@PathVariable int examid) {
		return domoservice.getAllDurationsService(examid);
	}
	@RequestMapping(value = "/marks", method = RequestMethod.PUT)
	public void putMarks(@RequestBody SetExam setexam) {
		domoservice.putMarksService(setexam);
	}
	@RequestMapping(value = "/useranswer", method = RequestMethod.PUT)
	public void putAnswer(@RequestBody TemplateQuestion template) {
		domoservice.putAnswerService(template);
	}
}