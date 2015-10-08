angular.module("myapp.directives").directive("examForm", function(){
  return{
    restrict: 'EA',
	transclude: true,
	scope:{
	  exams: "=?"
	},
    templateUrl: "app/partials/examform.html",
	controller: ["$scope", "$routeParams", "$filter", "_", "examInfoService", "$window", function($scope, $routeParams,$filter,  _, examInfoService,$window){	
	  $scope.exam = {};
	  $scope.getExams = function(){
	    $window.location.href = '#/examinfo';
	    $window.location.reload();
	  }
	  $scope.examId = $routeParams.exam_id;
	  //edit exam
	  if($scope.examId !== undefined){
	    $scope.students=examInfoService.getStudents(function(){
	      //get students here...
	    });
	    $scope.templates=examInfoService.getTemplates(function(){
	      //get templates here...
	    });
	    $scope.editExams=examInfoService.getAllExam(function(response){
	      $scope.object = _.findWhere(response, {set_exam_id: parseInt($scope.examId)});
	      $scope.exam.selectedStudent = $scope.object.user.userid;
    	  $scope.exam.selectedTemplate = $scope.object.templatesetexam.template_id;
    	  $scope.exam.selectedDate =  new Date($scope.object.start_date + ' ' + $scope.object.start_time);
    	  $scope.exam.selectedTime = new Date($scope.object.start_date + ' ' + $scope.object.start_time);
    	  $scope.exam.selectedDuration = $scope.object.duration;
		});
        $scope.setExam = function(){
	      $scope.exam.set_exam_id =  $scope.examId;
	      $scope.exam.start_date = $filter('date')($scope.exam.selectedDate, "MM/dd/yyyy");
	      $scope.exam.start_time = $filter('date')($scope.exam.selectedTime, "HH:mm:ss");
	      $scope.exam.duration = $scope.exam.selectedDuration;
	      $scope.exam.templatesetexam = _.findWhere($scope.templates, {template_id: $scope.exam.selectedTemplate });
	      $scope.exam.user =  _.findWhere($scope.students, {userid: parseInt($scope.exam.selectedStudent)});
	      examInfoService.updateexam({examid : $scope.exam.set_exam_id}, $scope.exam);
	      $scope.exam={};
	      $scope.getExams();
	    }
	  }
	  //new exam
	  else{
	    $scope.students=examInfoService.getStudents(function(){
	      //get all students
	    });
	    $scope.templates=examInfoService.getTemplates(function(){
	      //get all templates
	    });
	    $scope.setExam = function(){
	      $scope.exam.set_exam_id = $scope.examId;
	      $scope.exam.start_date = $filter('date')($scope.exam.selectedDate, "MM/dd/yyyy");
	      $scope.exam.start_time = $filter('date')($scope.exam.selectedTime, "HH:mm:ss");
	      $scope.exam.duration = $scope.exam.selectedDuration;
	      $scope.exam.templatesetexam = _.findWhere($scope.templates, {template_id: $scope.exam.selectedTemplate });
	      $scope.exam.user =  _.findWhere($scope.students, {userid: parseInt($scope.exam.selectedStudent)});
	      examInfoService.setexam($scope.exam);
	      $scope.exam={};
	      $scope.getExams();
	    };
	  }
	}],
	link: ["$scope",  function($scope){
	}]
  };
});