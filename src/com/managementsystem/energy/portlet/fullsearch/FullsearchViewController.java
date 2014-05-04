package com.managementsystem.energy.portlet.fullsearch;

import javax.portlet.PortletPreferences;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.web.PortletBaseController;

@Controller
@RequestMapping("VIEW")
public class FullsearchViewController extends PortletBaseController {

	@RenderMapping
	public ModelAndView setup(PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();

		mav.setView(PORTLETFOLDER + "fullsearch/fullsearchView");
		return mav;
	}
}
