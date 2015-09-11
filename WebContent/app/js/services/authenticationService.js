angular.module('myapp.services').service('authenticationService',function($resource){
  return $resource('', {}, {
    signUp : {
	  method : 'POST',
	  url : 'rest/user'
	},
	signIn : {
	  method : 'POST',
	  url : 'rest/usersign',
	  params : {
	    userid : "@userid",
		password : "@password"		
	  },
	  isArray : true
	}
  });
});