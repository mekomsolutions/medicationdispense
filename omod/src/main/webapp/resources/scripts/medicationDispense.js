angular.module('MedicationDispense', ['encounterService', 'session' ,'uicommons.widget.select-concept-from-list'])


.controller('MDPageCtrl', ['$scope', '$window', 'EncounterService', 'SessionInfo' , function ($scope, $window, EncounterService, SessionInfo) {
	
	$scope.config = $window.OpenMRS.dispenseConfig;

	$scope.order = $scope.config.order;

	var orders = [];
	orders.push($scope.order);

	$scope.quantity = 0;
	$scope.quantityUnits = $scope.config.quantityUnits;

	$scope.createDispense = function() {

		var encounterContext = {
			patient: $scope.config.patient,
			encounterType: $scope.config.dispenseEncounterType,
			location: null, /* TODO */
			visit: $scope.config.visit
		};

		SessionInfo.get().$promise.then(function(info) {
			orderContext.provider = info.currentProvider;
		});


		var encounter = {
			patient: encounterContext.patient.uuid,
			encounterType: encounterContext.encounterType.uuid,
			visit: uuidIfNotNull(encounterContext.visit),
			location: uuidIfNotNull(encounterContext.location),
			provider: provider.person.uuid, /* submit the person because of RESTWS-443 */
			orders: orders,
		};
	}

	$scope.cancelDispense = function () {
		location.href = $scope.config.returnUrl;
	}

}])
