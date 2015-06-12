var dirObject = angular.module("myapp.directives", []);
dirObject.directive("examForm", function() {
	return {
		restrict: 'EA',
		transclude: true,
		scope: {
			exams: "=?"
		},
		templateUrl: "app/partials/exam_form.html",
		controller: ["$scope", "$routeParams", "$filter",'_', 'examService', function($scope, $routeParams,$filter,  _, examService)
		             {	

			$scope.examId = $routeParams.exam_id;
			if($scope.examId !== undefined )
			{
				/*console.log($scope.exams);*/
				//$scope.exam = _.find($scope.exams, {set_exam_id: parseInt($scope.examId)});
				console.log($scope.exam);

				$scope.selectedStudent = $scope.userid;
				$scope.selectedTemplate = $scope.template_id;
			}
			else
			{
				$scope.students=examService.getStudents(function(){
					//get students here...
				});

				$scope.templates=examService.getTemplates(function(){
					//get templates here...
				});

				$scope.setExam=function(){
					$scope.exam.start_date = $filter('date')($scope.exam.start_date, "MM/dd/yyyy");
					$scope.exam.start_time = $filter('date')($scope.exam.start_time, "HH:mm:ss");
					examService.setexam($scope.exam);
					console.log($scope.exam);
					$scope.exam={};
					alert("Succesfully set the exam!");
				};
			}
		             }],


		             link: ["$scope",  function($scope){

		             }]
	};

});
dirObject.directive("getExam", function() {
	return {
		restrict: 'EA',
		transclude: true,

		templateUrl: "app/partials/exams.html",
		controller: ["$scope", "$routeParams", '_', 'examService', '$window', function($scope, $routeParams, _, examService, $window)
		             {
			$scope.newExam = function(){
				$window.location.href = "#/exam/new";
			}

			$scope.exams=examService.getallExam(function(){
				//getting the exams here...
			});

		             }],

		             link: ["$scope",  function($scope){

		             }]
	};

}); 
dirObject.directive("examDetails", function(){
	return {
		restrict: 'EA',
		transclude: true,
		templateUrl: "app/partials/setexam.html",
		controller:["$scope", "examService", function($scope, examService)
		            {
			$scope.setexams=examService.getallExam(function(){
				//getting the exam details here...
			});
			console.log($scope.setexams);
		            }],
		            link: ["$scope", function($scope){

		            }]
	};
});
dirObject.directive("studentInfo", function() {
	return {
		restrict: 'EA',
		transclude: true,
		templateUrl: "app/partials/studentinfo.html",
		controller: ["$scope","candidateInfoService","$routeParams", function($scope, candidateInfoService, $routeParams)  {
			alert($routeParams.id)  ;
			candidateInfoService.getCandidateInfo({id : $routeParams.id}).$promise.then(function(data){
				console.log(data);
				$scope.candidateInfo = data;
			});
		}],
		link:["$scope",function(){

		}]
	};
});
dirObject.directive("studentsAll", function( ) {
	return {
		restrict: 'EA',
		transclude: true,
		templateUrl: "app/partials/students.html",
		controller: ["$scope","candidateInfoService", function($scope, candidateInfoService) 
		             {
			candidateInfoService.getallCandidates().$promise.then(function(data){
				$scope.candidateList = data;
			});
		             }],
		             link:["$scope",function(){


		             }]
	};
});