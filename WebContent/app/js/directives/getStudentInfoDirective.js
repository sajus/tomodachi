angular.module("myapp.directives").directive("getStudentInfo", function(){
  return{
    restrict: 'EA',
	transclude: true,
	templateUrl: "app/partials/students.html",
	controller: ["$scope","candidateInfoService", function($scope, candidateInfoService){
	  candidateInfoService.getallCandidates().$promise.then(function(data){
	    $scope.candidateList = data;
	  });
	}],
	link:["$scope",function(){
	}]
  };
});
