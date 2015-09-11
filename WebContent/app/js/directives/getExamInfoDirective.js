angular.module("myapp.directives").directive("getExamInfo", function(){
  return{
    restrict: 'EA',
	transclude: true,
	templateUrl: "app/partials/exams.html",
	controller:["$scope", "$routeParams", '_', 'examInfoService', '$window', function($scope, $routeParams, _, examInfoService, $window){
	  $scope.setExam = function(){
	    $window.location.href = "#/exam/new";
	  }
	  $scope.exams=examInfoService.getAllExam(function(){
	    //getting the exams here...
	  });
	}],
    link: ["$scope",  function($scope){
    }]
  };
});