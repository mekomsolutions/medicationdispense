angular.module('MedicationDispense', ['uicommons.widget.select-concept-from-list'])


.controller('MDPageCtrl', ['$scope', '$window', function ($scope, $window) {
	$scope.config = $window.OpenMRS.dispenseConfig;

	$scope.order = $scope.config.order;

	$scope.quantityUnits = $scope.config.quantityUnits;

}])
