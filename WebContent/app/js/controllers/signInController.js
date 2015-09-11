angular.module('myapp.controllers').controller('signInController',["authenticationService", "$scope", "$routeParams", "$window", "$rootScope", "$cookies",function(authenticationService, $scope, $routeParams, $window, $rootScope, $cookies){
	$scope.userRole = [];
	$scope.signInUser = function(userid,password) {
    $routeParams.userid = userid;
    $routeParams.password = password;
    $scope.userRole=authenticationService.signIn({userid : $routeParams.userid, password : $routeParams.password}, function(data){
    localStorage.setItem("userid", $scope.userid);
      if(data[0] == "admin" ){
        $window.location.href='admin.html';
      }
      else{
        $window.location.href='candidate.html';
      }
    });
   }
}]);