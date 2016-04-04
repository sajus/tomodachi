angular.module('myapp.services').service('questionService', function($resource){
  return $resource('', {}, {
    getQuestions : {
	  method : 'GET',
	  url : 'rest/questions/'+'/:examid',
	  params : {
	    examid : "@examid"
	  },
	  isArray : true
	},
	getDurations : {
	  method : 'GET',
	  url : 'rest/duration/'+'/:examid',
	  params : {
	    examid : "@examid"
	  },
	  isArray: true
	},
	putMarks : {
	  method : 'PUT',
	  url : 'rest/marks'
	},
	putAnswer : {
	  method : 'PUT',
	  url : 'rest/useranswer'
	}
  });
});