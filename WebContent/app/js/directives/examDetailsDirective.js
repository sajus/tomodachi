angular.module("myapp.directives").directive("examDetails", function(){
  return{
    restrict: 'EA',
	transclude: true,
	templateUrl: "app/partials/showexam.html",
	controller:["$scope", "examInfoService", "$routeParams", function($scope, examInfoService, $routeParams){
	  $scope.setexams=examInfoService.getExamDetail({exam_id : $routeParams.exam_id}),function(){
	    //getting exam details based on examid
	  };
	}],
    link: ["$scope",  function($scope){
    }]
  };
});