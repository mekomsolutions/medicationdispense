package org.openmrs.module.medicationdispense.page.controller;

import java.util.LinkedHashMap;
import java.util.Map;

import org.openmrs.Patient;
import org.openmrs.api.EncounterService;
import org.openmrs.api.ObsService;
import org.openmrs.module.webservices.rest.web.ConversionUtil;
import org.openmrs.module.webservices.rest.web.representation.Representation;
import org.springframework.web.bind.annotation.RequestParam;
import org.openmrs.ui.framework.UiUtils;
import org.openmrs.ui.framework.annotation.SpringBean;
import org.openmrs.ui.framework.page.PageModel;


public class DispensePageController {

	public void controller(@RequestParam("patient") Patient patient,
			@RequestParam(value="visit", required=false) String visit,
			@SpringBean("obsService") ObsService obsService,
			@SpringBean("encounterService") EncounterService encounterService,
			UiUtils ui,
			PageModel model)

	{

		Map<String, Object> jsonConfig = new LinkedHashMap<String, Object>();

		jsonConfig.put("patient", convertToFull(patient));
		
		if (visit != null) {
			jsonConfig.put("visit", convertToFull(visit));
		}

		model.put("patient", patient);
		model.put("jsonConfig", ui.toJson(jsonConfig));

	}

	private Object convertToFull(Object object) {
		return object == null ? null : ConversionUtil.convertToRepresentation(object, Representation.FULL);
	}

}
