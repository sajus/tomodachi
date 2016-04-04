angular.module('myapp.services').service('candidateInfoService', function($resource){
  return $resource('', {}, {
    getallCandidates : {
	  method:'GET',
	  url:'rest/candidates',
	  isArray : true
	},
	getCandidateInfo : {
	  method:'GET',
	  url:'rest/candidateDetails/' + '/:id',
	  params : {
	    id : "@id"
	  },
	  isArray : true
	},
	getCandidateInfoNotConducted : {
	  method: 'GET',
	  url: 'rest/candidateDetailsNotConducted/' + '/:id',
	  params : {
	    id : "@id"
	  },
	  isArray : true
	}
  });
});