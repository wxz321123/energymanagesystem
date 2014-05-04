<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-12 下午2点46分
	LastModified Date:
	Description: 能耗统计-照明系统用电趋势
 -->


<div class="div-table">

	<div class="content450 center">
		<div class="vision_2">
			<div class="single_chart build_ele_itemize">
				<div class="chart_describe"
					style="background-color:${lightsystemelectrotrend.backgroundColor};">
					<h4 class="h4size">照明系统用电趋势</h4>
					<div>${lightsystemelectrotrend.description}</div>
				</div>

				<div class="timediv50">
					<div id="thisday1" style="color: red;" class="inlinedivstyle tdatt"
						onclick="selectValue('thisday1')">日视图</div>
					<div id="thisweek1" class="inlinedivstyle tdatt"
						onclick="selectValue('thisweek1')">周视图</div>
					<div id="thismonth1" class="inlinedivstyle tdatt"
						onclick="selectValue('thismonth1')">月视图</div>
					<div id="thisyear1" class="inlinedivstyle tdatt"
						onclick="selectValue('thisyear1')">年视图</div>
					<div class="inlinedivstyle selectdivstyle">
						&nbsp;与&nbsp; <select name="timeselect1" id="timeselect1"
							class="selectstyle">
							<option selected="selected"></option>
						</select> &nbsp;对比&nbsp;
					</div>
					<div id="thisyearddd1" class="tdatt output"
						onclick="selectValue('thisyear1')">输出</div>

				</div>

				<div id="lightsystemelectrotrend" class="chartdivstyle"></div>

				<div class="bottom_link">
					<i><a href="${lightsystemelectrotrend.linkUrl_1}">${lightsystemelectrotrend.linkName_1}</a></i>
				</div>
			</div>
		</div>
	</div>

</div>

<script type="text/javascript">
	//为能耗统计-照明系统用电趋势 报表填充数据 
	//renderToColumnAndLineCharts('lightsystemelectrotrend','line','用电量（kWh）','#5CB965','5','white');
	renderToColumnAndLineCharts('lightsystemelectrotrend',
			"${lightsystemelectrotrend.chartType}",
			"${lightsystemelectrotrend.yLeftTitle}",
			"${lightsystemelectrotrend.lineColor}",
			"${lightsystemelectrotrend.xStep}",
			"${lightsystemelectrotrend.fillColor}");
</script>