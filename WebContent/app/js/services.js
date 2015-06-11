angular.module('myapp.services', []).service('domoExamService',
		function($resource) {
	console.log("i am in domo exam service");
	return $resource('', {}, {
		submit : {
			method : 'POST',
			url : 'rest/user'
		},
		signin : {
			method : 'POST',
			url : 'rest/usersign',
			params : {
				userid : "@userid",
				password : "@password"		
			},
			isArray : true
		}
	});
}).service('candidateInfoService', function($resource) {
	return $resource('',{},
			{
		getallCandidates:
		{
			method:'GET',
			url:'rest/candidates',
			isArray : true
		},
		getCandidateInfo:
		{
			method:'GET',
			url:'rest/candidateDetails/' + '/:id',
			params : {
				id : "@id"
			},
			isArray : true
		}
			});
}).service('examService', function($resource) {
	return $resource('',{},
			{
		createExam:
		{		
			method   :'POST',
			url    :'/'
		},		
		getallExam:
		{		
			method:'GET',
			url:'rest/exams',
			isArray: 'true'	
		},
		getStudents:
		{
			method: 'GET',
			url: 'rest/exam/new/student',
			isArray: 'true'
		},
		getTemplates:
		{
			method: 'GET',
			url: 'rest/exam/new/template',
			isArray: 'true'
		},
		setexam:
		{
			method: 'POST',
			url: 'rest/exam/new/setexam'
		},
		newexam:
		{
			method:'POST',
			url:'rest/exam/new'
		},
		updateexam:			
		{			
			method:'PUT',
			url:'rest/'		
		},			
			});
});