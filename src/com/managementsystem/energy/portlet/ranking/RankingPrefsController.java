package com.managementsystem.energy.portlet.ranking;

import javax.portlet.PortletPreferences;
import javax.portlet.RenderRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.web.PortletBaseController;

@Controller
@RequestMapping("EDIT")
public class RankingPrefsController extends PortletBaseController {

	@RenderMapping
	public ModelAndView showPrefrences(RenderRequest request,
			PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(PORTLETFOLDER + "ranking/rankingPrefs");
		return mav;
	}
}
