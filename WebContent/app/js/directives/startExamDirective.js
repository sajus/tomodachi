angular.module("myapp.directives").directive("startExam", function(quizFactory, questionService){
  return{
    restrict: 'AE',
	scope: {},
	templateUrl: 'app/partials/startexam.html',
	controller: ["$scope","$window", "questionService", "$routeParams",function($scope,$window,questionService,$routeParams){ 
	  $scope.setexam = questionService.getDurations({examid : $routeParams.examid},function(){
	    //get exams		
	  });
	  //storing final score
      $scope.submitResult=function(){
        $scope.setexam[0].marks = $scope.score;
        $scope.setexam[0].set_exam_id= parseInt($routeParams.examid);
        questionService.putMarks($scope.setexam[0]);
        $scope.setexam = {};
      }
      //storing each answer
      $scope.userAnswer=function(){
        $scope.template = {};
        $scope.template.templatequestionsetexam={};
        $scope.template.templatequestionsetexam.set_exam_id= parseInt($routeParams.examid);
        $scope.template.user_answer = $scope.ans;
        $scope.template.question_number = $scope.question_id;
        questionService.putAnswer($scope.template);
      }
      //getting questions are per template
      $scope.questions=quizFactory.getQuestions($routeParams.examid);
	  $scope.again=function(){
	    $window.location.href = 'candidate.html';
	  }				
	}],
	link: function(scope, elem, attrs){
	  scope.startTime = false;
	  scope.start = function(){
	    scope.id = 0;
		scope.score = 0;
		scope.quizOver = false;
		scope.inProgress = true;
		scope.getQuestion();
		scope.isOptionSelected=true;
		scope.startTime = true;
		scope.lastQuestion = false;
	  };
	  scope.getQuestion = function(){
	    scope.count = quizFactory.getCount();
		var q = quizFactory.getQuestion(scope.id);
		if(q){
		  scope.question_id = q.question_id;
		  scope.question = q.question; 
		  scope.options = [q.op1,q.op2,q.op3,q.op4];
		  scope.isOptionSelected=true;
		  scope.answer = q.answer;
		  if(scope.id == scope.count-1){
		    scope.lastQuestion = true;
		  }
	    }
		else{
		  scope.quizOver=true;
		  scope.startTime = false;
		}
	  };
	  scope.checkAnswer = function(){
	    if(!$('input[name=option]:checked').length) return;
	    scope.ans = $('input[name=option]:checked').val();
	    if(scope.ans == scope.options[scope.answer]){
	      scope.score = scope.score + 1;
	    }
        else{
	      scope.score = scope.score + 0;
	    }
	  };
	  scope.nextQuestion = function(){
	    scope.id++;
	    scope.getQuestion();
	  }
	  scope.onOptionSelect=function(option){
	    scope.isOptionSelected= false;
	  }
	  var interval = setInterval(function(){
	    var timer = $('span').html();
	    timer = timer.split(':');
	    var minutes = parseInt(timer[0], 10);
	    var seconds = parseInt(timer[1], 10);
	    seconds -= 1;
	    if (minutes < 0) return clearInterval(interval);
	    if (minutes < 10 && minutes.length != 2) minutes = '0' + minutes;
	    if (seconds < 0 && minutes != 0){
	      minutes -= 1;
		  seconds = 59;
	    }
	    else if (seconds < 10 && length.seconds != 2) seconds = '0' + seconds;
	    $('span').html(minutes + ':' + seconds);
	    if (minutes == 0 && seconds == 0){	
	      clearInterval(interval);
		  scope.id = null;
		  scope.getQuestion();
	    }
	  }, 1000);
    }
  }
}).factory('quizFactory', ['questionService', '$routeParams', function(questionService, $routeParams){
  var questions;
  return{
    getCount: function(){
	  return questions.length;
	},
	getQuestions: function(examId){
	  questions = questionService.getQuestions({examid : examId}, function(){
	    //getting questions as per template
      });
	  return questions;
	},
	getQuestion: function(id){
	  if(id < questions.length){
	    return questions[id];
	  }
	  else{
	    return false;
	  }
	},
	getDurations: function(){
	  return setexams;
	}
  };
}]);