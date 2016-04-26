angular.module('MedicationDispense', ['encounterService', 'orderEntry', 'session' ,'uicommons.widget.select-concept-from-list'])


.controller('MDPageCtrl', ['$scope', '$window', 'EncounterService', 'Encounter', 'OrderContext', 'OrderEntryService', 'SessionInfo' ,
	function ($scope, $window, EncounterService, Encounter, OrderContext, OrderEntryService, SessionInfo) {

		$scope.config = $window.OpenMRS.dispenseConfig;
		$scope.order = $scope.config.order;

		var orders = [];
		orders.push($scope.order);

		$scope.quantity = 0;
		$scope.quantityUnits = $scope.config.quantityUnits;

		var sessionInfoPromise = SessionInfo.get();
		var orderContext = {};

		function uuidIfNotNull(obj) {
			return obj ? obj.uuid : null;
		}

		$scope.createDispense = function() {

			OrderContext.draftOrders = orders;

			
			var encounterContext = {
				patient: $scope.config.patient,
				encounterType: $scope.config.dispenseEncounterType,
				location: null, /* TODO */
				visit: $scope.config.visit
			};

			OrderEntryService.signAndSave(OrderContext, encounterContext);
		}

		$scope.cancelDispense = function () {
			location.href = $scope.config.returnUrl;
		}

	}])
