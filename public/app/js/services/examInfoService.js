angular.module('myapp.services').service('examInfoService', function($resource){
  return $resource('', {}, {
    createExam : {		
	  method :'POST',
	  url :'/'
	},		
    getAllExam : {		
	  method :'GET',
	  url :'rest/exams',
	  isArray : true	
	},
	getExamDetail : {		
	  method :'GET',
	  url :'rest/exams/'+'/:exam_id',
	  params : {
	    exam_id : "@exam_id"
	  },
	  isArray : true
	},
	getStudents : {
	  method : 'GET',
	  url : 'rest/exam/new/student',
	  isArray : true
	},
	getTemplates : {
	  method : 'GET',
	  url : 'rest/exam/new/template',
	  isArray : true
	},
	setexam : {
	  method : 'POST',
	  url : 'rest/exam/new/setexam'
	},
	updateexam : {			
	  method :'PUT',
	  url :'rest/exam/edit',
	  params : {
	    exam_id : "@examid"
	  }
	}		
  });
});