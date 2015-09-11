angular.module("myapp.directives").directive("studentExamInfo", function(){
  return{
    restrict: 'EA',
	transclude: true,
	scope:{
	  startTime: "=?",
	  startDate: "=?",
	  isConducted:  "=?",
	  showStart: "=?",
	  showMarks: "=?",
	  filterVal: "=?"
	},
	templateUrl: "app/partials/studentinfo.html",
	controller: ["$scope","candidateInfoService","$routeParams", function($scope, candidateInfoService, $routeParams){
	  $scope.$watch("filterVal", function(){
	    if($scope.filterVal === 'all'){
		  $scope.candidateInfo=candidateInfoService.getCandidateInfo({id : $routeParams.id}),function(){
						//all candidates info
		  };
		} 
	    else{
		  $scope.candidateInfo =candidateInfoService.getCandidateInfoNotConducted({id : $routeParams.id, filter: 'remaining'}),function(){
					//candidates whose exam is not condusted
		  };
		}
	  });
	}],
	link:["$scope",function(){		 
	}]
  };
});