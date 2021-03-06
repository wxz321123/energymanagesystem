package com.managementsystem.energy.portlet.chart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.web.BaseController;

@Controller
@RequestMapping("VIEW")
public class DashboardChartViewController extends BaseController {

	/**
	 * 显示仪表盘图表
	 * */
	@RenderMapping
	public ModelAndView setup() {
		ModelAndView mav = new ModelAndView();

		mav.setView(PORTLETFOLDER + "dashboard/dashboardView");
		return mav;
	}

}
