<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>

<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-7 下午8点29分
	LastModified Date:
	Description: 能效分析-冷冻水输运系数
 -->

<div class="div-table">

	<div class="content450 center left20">
		<div class="analysis_4">
			<div class="single_chart build_ele_itemize">
				<div class="chart_describe"
					style="background-color:${coldtrafficcoefficient.backgroundColor};">
					<h4 class="h4size">冷冻水输运系数</h4>
					<div>${coldtrafficcoefficient.description}</div>
				</div>


				<div class="timediv50">
					<div id="<portlet:namespace />thisday" style="color: red;"
						class="inlinedivstyle tdatt"
						onclick="selectValue('<portlet:namespace />thisday')">日视图</div>
					<div id="<portlet:namespace />thisweek"
						class="inlinedivstyle tdatt"
						onclick="selectValue('<portlet:namespace />thisweek')">周视图</div>
					<div id="<portlet:namespace />thismonth"
						class="inlinedivstyle tdatt"
						onclick="selectValue('<portlet:namespace />thismonth')">月视图</div>
					<div id="<portlet:namespace />thisyear"
						class="inlinedivstyle tdatt"
						onclick="selectValue('<portlet:namespace />thisyear')">年视图</div>
					<div class="inlinedivstyle selectdivstyle">
						&nbsp;与&nbsp; <select name="<portlet:namespace />timeselect"
							id="<portlet:namespace />timeselect" class="selectstyle">
							<option selected="selected"></option>
						</select> &nbsp;对比&nbsp;
					</div>
					<div id="<portlet:namespace />thisyearddd" class="tdatt output"
						onclick="selectValue('<portlet:namespace />thisyear')">输出</div>
				</div>

				<div id="<portlet:namespace />coldtrafficcoefficient"
					class="chartdivstyle"></div>

				<div class="bottom_link">
					<i><a href="${coldtrafficcoefficient.linkUrl_1}">${coldtrafficcoefficient.linkName_1}</a></i>
					<i><a href="${coldtrafficcoefficient.linkUrl_2}">${coldtrafficcoefficient.linkName_2}</a></i>
				</div>

			</div>
		</div>
	</div>

</div>

<script type="text/javascript">
	//为  冷冻水输运系数  报表填充数据 
	//rendToChartMoreSeries('<portlet:namespace />coldtrafficcoefficient', 'column', 'WTFchw', '#4BACC6', '5', '', '当前建筑实测值', 'line', '同类建筑平均水平', '#D668BE', '', '', '', '');

	rendToChartMoreSeries('<portlet:namespace />coldtrafficcoefficient',
			"${coldtrafficcoefficient.chartType_1}",
			"${coldtrafficcoefficient.yLeftTitle}",
			"${coldtrafficcoefficient.lineColor_1}",
			"${coldtrafficcoefficient.xStep}",
			"${coldtrafficcoefficient.fillColor_1}",
			"${coldtrafficcoefficient.dataName_1}",
			"${coldtrafficcoefficient.chartType_2}",
			"${coldtrafficcoefficient.dataName_2}",
			"${coldtrafficcoefficient.fillColor_2}", 
			"${cooltrafficcoefficient.lineWidth}", 
			"${cooltrafficcoefficient.symbol}", 
			'', 
			"${cooltrafficcoefficient.ySymbol}");
</script>