<%
ui.decorateWith("appui", "standardEmrPage")

ui.includeJavascript("uicommons", "angular.min.js")
ui.includeJavascript("uicommons", "angular-app.js")
ui.includeJavascript("uicommons", "angular-resource.min.js")
ui.includeJavascript("uicommons", "angular-common.js")
ui.includeJavascript("uicommons", "angular-ui/ui-bootstrap-tpls-0.11.2.js")

ui.includeJavascript("uicommons", "services/conceptService.js")
ui.includeJavascript("uicommons", "services/drugService.js")
ui.includeJavascript("uicommons", "services/encounterService.js")
ui.includeJavascript("uicommons", "services/orderService.js")
ui.includeJavascript("uicommons", "services/session.js")
ui.includeJavascript("uicommons", "directives/select-concept-from-list.js")

ui.includeJavascript("medicationdispense", "medicationDispense.js")
ui.includeCss("medicationdispense", "dispense.css")

%>

<script type="text/javascript">

	var breadcrumbs = [
	{ icon: "icon-home", link: '/' + OPENMRS_CONTEXT_PATH + '/index.htm' },
	{ label: "${ ui.message("medicationmanagementui.page.label")}"}
	];

	window.OpenMRS = window.OpenMRS || {};
	window.OpenMRS.dispenseConfig = ${ jsonConfig };

</script>

<style type="text/css">
	p {
		line-height: 200%
	}

	span.label {
		font-weight: bold
	}

	span.details {
		margin-left: 3px
	}

	form {
		display: inline;
	}

</style>

<div ng-app="MedicationDispense">
	<div ng-controller="MDPageCtrl">

		<h3>Order details</h3>

		<p><span class="label">Drug:</span><span class="details">{{order.drug.display}}</span></p>
		<p><span class="label">Dose:</span><span class="details">{{order.dose}} {{order.doseUnits.display}}</span></p>
		<p><span class="label">Frequency:</span><span class="details">{{order.frequency.display}}</span></p>
		<p><span class="label">PRN:</span><span class="details">{{order.asNeededCondition}}</span></p>
		<p><span class="label">Route:</span><span class="details">{{order.route.display}}</span></p>
		<p><span class="label">Duration:</span><span class="details">{{order.duration}} {{order.durationUnits.display}}</span></p>
		<p><span class="label">Comments:</span><span class="details">{{order.dosingInstructions}}</span></p>


		<h3>Dipense</h3>
		<form id="dispenseForm" class="sized-inputs css-form" >
			<p>
				<input ng-model="order.quantity" type="number" min="0" placeholder="Quantity" />
				<select-concept-from-list ng-model="order.quantityUnits" concepts="quantityUnits" placeholder="Units" size="8"></select-concept-from-list>
			</p>

			<p>
			<button type="submit" class="confirm right" ng-disabled="dispenseForm.\$invalid" ng-click="createDispense()">Save</button>
				<button class="cancel" ng-click="cancelDispense()">Cancel</button>
			</p>
		</form>
	</div>

</div>