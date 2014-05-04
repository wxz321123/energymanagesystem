package com.managementsystem.energy.portlet.energymanagement;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.PortletPreferences;
import javax.portlet.ReadOnlyException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.web.BaseController;
import com.managementsystem.util.dao.Page;

@Controller
@RequestMapping("Edit")
public class EnergymanagementPreferenceController extends BaseController {
	private final Log logger = LogFactory.getLog(EnergymanagementPreferenceController.class);
	@Autowired
	private BuildService buildService;
	/**
	 * 设置
	 * */
	@RenderMapping
	public ModelAndView setup(RenderRequest request, RenderResponse response,
			PortletPreferences prefs) {
		 ModelAndView mav = new ModelAndView();
			Buildinfo buildinfo = null;
			if (prefs.getMap().size() == 0) {
				buildinfo = new Buildinfo();
			} else {
				String buildId = prefs.getValue("buildId", "");
				if(StringUtils.hasLength(buildId)){
				buildinfo = buildService.getBuildinfo(buildId);
				}
			}
		mav.addObject("buildinfo", buildinfo);
		mav.setViewName(PORTLETFOLDER + "energymanagement/preferences");
		return mav;
	}
	
	/**
	 * 保存
	 * 
	 * @param buildinfo 设置对象
	 * @param prefs	 首选项对象
	 * */
	@SuppressWarnings("rawtypes")
	@ActionMapping(params = "action=savePreferences")
	public void savePreferences(PortletPreferences prefs, ActionRequest request,
			ActionResponse response) throws PortletException,
			ReadOnlyException, IOException {
		
		List<String> errorMessages = new ArrayList<String>();
		Map mapField;
		try {
			String buildId = "", nhmb="", nyxhl="", bfb="", starttime="", jstime="";
			Date now = Calendar.getInstance().getTime();
			if(request.getParameter("buildId")!=null) {
				buildId = request.getParameter("buildId");
			}
			prefs.setValue("buildId",buildId);
			
			if(request.getParameter("nhmb")!=null) {
				nhmb = request.getParameter("nhmb");
			}
			prefs.setValue("nhmb",nhmb);
			
			if(request.getParameter("nyxhl")!=null) {
				nyxhl = request.getParameter("nyxhl");
			}
			prefs.setValue("nyxhl",nyxhl);
			
			if(request.getParameter("bfb")!=null) {
				bfb = request.getParameter("bfb");
			}
			prefs.setValue("bfb",bfb);
			
			DateFormat   st=new   SimpleDateFormat( "yyyy-MM-dd");
			starttime = st.format(now);
			prefs.setValue("starttime",starttime);
			
			jstime =  Calendar.getInstance().getTime().toString();
			prefs.setValue("jstime",starttime);
			
			prefs.store();
		} catch(Exception e) {
			e.printStackTrace();
			logger.error(e);
		}
		response.setRenderParameter("", "");
		request.setAttribute("errorMessages", errorMessages);
		request.setAttribute("successMessages", "操作成功");
	}
	
	/**
	 * 返回所有建筑信息
	 * */
	@ResourceMapping(value = "getBuildinfos")
	public Page getBuildinfos(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Map<String, Object> mapCondition = new HashMap<String, Object>();

		if (request.getParameter("keyword") != null) {
			String keyword = request.getParameter("keyword");
			mapCondition.put("buildName", keyword);
		}
		Page buildinfos = buildService.getBuildinfos(page, rows);
		return buildinfos;
	}
}