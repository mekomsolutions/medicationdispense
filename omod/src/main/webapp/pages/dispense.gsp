<%
ui.decorateWith("appui", "standardEmrPage")

%>

<script type="text/javascript">

	var breadcrumbs = [
	{ icon: "icon-home", link: '/' + OPENMRS_CONTEXT_PATH + '/index.htm' },
	{ label: "${ ui.message("medicationmanagementui.page.label")}"}
	];

	window.OpenMRS = window.OpenMRS || {};
	window.OpenMRS.dispenseConfig = ${ jsonConfig };

</script>


${patient.id}