<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-7-26 下午2点27分
	LastModified Date:
	Description: 能耗分析
 -->


<div class="div-table">

	<div class="content450 center">
		<div class="vision_7">
			<div class="single_chart build_ele_itemize">
				<div class="chart_describe"
					style="background-color:${vavelectrotrend.backgroundColor};">
					<h4 class="h4size">VAV用电趋势</h4>
					<div>${vavelectrotrend.description}</div>
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

				<div id="vavelectrotrend" class="chartdivstyle"></div>

				<div class="bottom_link">
					<i><a href="${vavelectrotrend.linkUrl_1}">${vavelectrotrend.linkName_1}</a></i><i><a
						href="${vavelectrotrend.linkUrl_2}">${vavelectrotrend.linkName_2}</a></i>
				</div>
			</div>
		</div>
	</div>

</div>

<script type="text/javascript">
	//为报表填充数据 
	//renderToColumnAndLineCharts('vavelectrotrend','line','VAV用电量（kWh）','#886EA8','4','white');

	renderToColumnAndLineCharts('vavelectrotrend',
			"${vavelectrotrend.chartType}", "${vavelectrotrend.yLeftTitle}",
			"${vavelectrotrend.lineColor}", "${vavelectrotrend.xStep}",
			"${vavelectrotrend.fillColor}");
</script>