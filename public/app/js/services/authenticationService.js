angular.module('myapp.services').service('authenticationService',function($resource){
  return $resource('', {}, {
    signUp : {
	  method : 'POST',
	  url : 'rest/user'
	},
	signIn : {
	  method : 'POST',
	  url : 'rest/usersign',
	  data : {
	    userid : "@userid",
		password : "@password"		
	  },
	  isArray : true
	}
  });
});