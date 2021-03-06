<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: LIUCHAO
	Created Date: 2013-11-29 下午5点46分
	LastModified Date:
	Description: 运行参数首选项页面
 -->
<style type="text/css">
.spanwidth {
	width: 130px;
	margin-top: 5px;
}
</style>

<portlet:actionURL var="savePreferencesUrl">
	<portlet:param name="action" value="savePreferences" />
</portlet:actionURL>

<div id="msg"></div>

<form:form commandName="preferenceinfo" id="coreinfo" method="post"
	class="tb_space" action="#" style="background-color: white;">

	<br /><br />

	<div class="ftitle">
		<span class="spanwidth" align="right">增加小时数：</span> <input id="hours"
			name="hours" type="text" value="<%=prefs.getValue("hours", "")%>"><br> <span class="spanwidth" align="right">模块标题：</span> <input id="formTitle" name="formTitle" type="text"
			value="<%=prefs.getValue("formTitle", "")%>"><br> <span
			class="spanwidth" align="right">默认视图：</span> <select id="chooseView"
			name="chooseView" style="width: 14.7%; margin-bottom: 10px;">
			<option value="0">图形视图</option>
			<option value="1">表格视图</option>
		</select><br> <span class="spanwidth" align="right">小数位数：</span> <select
			id="decimals" name="decimals"
			style="width: 14.7%; margin-bottom: 10px;">
			<option value="0.00">保留两位小数</option>
			<option value="0.0">保留一位小数</option>
			<option value="0">取整数</option>
		</select>
	</div>

	<br /><br />

	<div class="div-table">
		<div class="div-table-row">
			<div class="ftitle">
				<span>冷水机组</span><span class="title-back"><a
					href="<portlet:renderURL portletMode="view" windowState="normal"></portlet:renderURL>">«返回</a></span>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-col"
				style="height: 250px; width: 900px; margin-left: 30px;">
				<div id="<portlet:namespace/>dgrid1"></div>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-col">
				<div id="buttons" style="margin-left: 30px;">
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>setNameAndId('dgrid1','chart_name1','chart_id1','chart_ispd1')">获取name和id</a>
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>clear('chart_name1','chart_id1','chart_ispd1')">清空name/id/ispd</a>&nbsp;&nbsp;&nbsp;
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>setNameAndId('dgrid1','form_name1','form_id1','form_ispd1')">获取name和id</a>
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>clear('form_name1','form_id1','form_ispd1')">清空name/id/ispd</a>
				</div>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Name：</span> <input
					id="chart_name1" name="chart_name1" type="text"
					value="<%=prefs.getValue("chart_name1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Id：</span> <input
					id="chart_id1" name="chart_id1" type="text"
					value="<%=prefs.getValue("chart_id1", "")%>">
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ispd：</span> <input
					id="chart_ispd1" name="chart_ispd1" type="text"
					value="<%=prefs.getValue("chart_ispd1", "")%>">
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题：</span> <input id="title1"
					name="title1" type="text" value="<%=prefs.getValue("title1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">描述：</span> <input
					id="description1" name="description1" type="text"
					value="<%=prefs.getValue("description1", "")%>">
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表标题：</span> <input
					id="chartTitle1" name="chartTitle1" type="text"
					value="<%=prefs.getValue("chartTitle1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图例列表：</span> <input
					id="chartLegends1" name="chartLegends1" type="text"
					value="<%=prefs.getValue("chartLegends1", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">颜色列表：</span> <input
					id="chartColors1" name="chartColors1" type="text"
					value="<%=prefs.getValue("chartColors1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴单位：</span> <input
					id="ySymbol1" name="ySymbol1" type="text"
					value="<%=prefs.getValue("ySymbol1", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴左标题：</span> <input
					id="yLeftTitle1" name="yLeftTitle1" type="text"
					value="<%=prefs.getValue("yLeftTitle1", "")%>">
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴右标题：</span> <input
					id="yRightTitle1" name="yRightTitle1" type="text"
					value="<%=prefs.getValue("yRightTitle1", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">曲线点类型：</span> <select
					id="symbol1" name="symbol1" style="width: 29.5%">
					<option value="circle">圆点</option>
					<option value="square">正方形</option>
					<option value="diamond">方形</option>
					<option value="triangle">三角形</option>
					<option value="triangle-down">倒三角</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">导出列头名称：</span> <input
					id="expColumnName1" name="expColumnName1" type="text"
					value="<%=prefs.getValue("expColumnName1", "")%>">
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="ftitle">
				<span>表格视图配置</span>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Name：</span> <input
					id="form_name1" name="form_name1" type="text"
					value="<%=prefs.getValue("form_name1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Id：</span> <input
					id="form_id1" name="form_id1" type="text"
					value="<%=prefs.getValue("form_id1", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ispd：</span> <input
					id="form_ispd1" name="form_ispd1" type="text"
					value="<%=prefs.getValue("form_ispd1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">共用的列：</span> <input
					id="commonColumn1" name="commonColumn1" type="text"
					value="<%=prefs.getValue("commonColumn1", "")%>">
			</div>
		</div>

		<br /><br />

		<div class="div-table-row">
			<div class="ftitle">
				<span>锅炉</span>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-col"
				style="height: 250px; width: 900px; margin-left: 30px;">
				<div id="<portlet:namespace/>dgrid2"></div>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-col">
				<div id="buttons" style="margin-left: 30px;">
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>setNameAndId('dgrid2','chart_name2','chart_id2','chart_ispd2')">获取name和id</a>
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>clear('chart_name2','chart_id2','chart_ispd2')">清空name/id/ispd</a>&nbsp;&nbsp;&nbsp;
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>setNameAndId('dgrid2','form_name2','form_id2','form_ispd2')">获取name和id</a>
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>clear('form_name2','form_id2','form_ispd2')">清空name/id/ispd</a>
				</div>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Name：</span> <input
					id="chart_name2" name="chart_name2" type="text"
					value="<%=prefs.getValue("chart_name2", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Id：</span> <input
					id="chart_id2" name="chart_id2" type="text"
					value="<%=prefs.getValue("chart_id2", "")%>">
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ispd：</span> <input
					id="chart_ispd2" name="chart_ispd2" type="text"
					value="<%=prefs.getValue("chart_ispd2", "")%>">
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题：</span> <input id="title2"
					name="title2" type="text" value="<%=prefs.getValue("title2", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">描述：</span> <input
					id="description2" name="description2" type="text"
					value="<%=prefs.getValue("description2", "")%>">
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表标题：</span> <input
					id="chartTitle2" name="chartTitle2" type="text"
					value="<%=prefs.getValue("chartTitle2", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图例列表：</span> <input
					id="chartLegends2" name="chartLegends2" type="text"
					value="<%=prefs.getValue("chartLegends2", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">颜色列表：</span> <input
					id="chartColors2" name="chartColors2" type="text"
					value="<%=prefs.getValue("chartColors2", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴单位：</span> <input
					id="ySymbol2" name="ySymbol2" type="text"
					value="<%=prefs.getValue("ySymbol2", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴左标题：</span> <input
					id="yLeftTitle2" name="yLeftTitle2" type="text"
					value="<%=prefs.getValue("yLeftTitle2", "")%>">
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴右标题：</span> <input
					id="yRightTitle2" name="yRightTitle2" type="text"
					value="<%=prefs.getValue("yRightTitle2", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">曲线点类型：</span> <select
					id="symbol2" name="symbol2" style="width: 29.5%">
					<option value="circle">圆点</option>
					<option value="square">正方形</option>
					<option value="diamond">方形</option>
					<option value="triangle">三角形</option>
					<option value="triangle-down">倒三角</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">导出列头名称：</span> <input
					id="expColumnName2" name="expColumnName2" type="text"
					value="<%=prefs.getValue("expColumnName2", "")%>">
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="ftitle">
				<span>表格视图配置</span>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Name：</span> <input
					id="form_name2" name="form_name2" type="text"
					value="<%=prefs.getValue("form_name2", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Id：</span> <input
					id="form_id2" name="form_id2" type="text"
					value="<%=prefs.getValue("form_id2", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ispd：</span> <input
					id="form_ispd2" name="form_ispd2" type="text"
					value="<%=prefs.getValue("form_ispd2", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">共用的列：</span> <input
					id="commonColumn2" name="commonColumn2" type="text"
					value="<%=prefs.getValue("commonColumn2", "")%>">
			</div>
		</div>

		<br /><br />

		<div class="div-table-row">
			<div class="ftitle">
				<span>冷却水泵</span>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-col"
				style="height: 250px; width: 900px; margin-left: 30px;">
				<div id="<portlet:namespace/>dgrid3"></div>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-col">
				<div id="buttons" style="margin-left: 30px;">
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>setNameAndId('dgrid3','chart_name3','chart_id3','chart_ispd3')">获取name和id</a>
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>clear('chart_name3','chart_id3','chart_ispd3')">清空name/id/ispd</a>&nbsp;&nbsp;&nbsp;
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>setNameAndId('dgrid3','form_name3','form_id3','form_ispd3')">获取name和id</a>
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>clear('form_name3','form_id3','form_ispd3')">清空name/id/ispd</a>
				</div>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Name：</span> <input
					id="chart_name3" name="chart_name3" type="text"
					value="<%=prefs.getValue("chart_name3", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Id：</span> <input
					id="chart_id3" name="chart_id3" type="text"
					value="<%=prefs.getValue("chart_id3", "")%>">
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ispd：</span> <input
					id="chart_ispd3" name="chart_ispd3" type="text"
					value="<%=prefs.getValue("chart_ispd3", "")%>">
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题：</span> <input id="title3"
					name="title3" type="text" value="<%=prefs.getValue("title3", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">描述：</span> <input
					id="description3" name="description3" type="text"
					value="<%=prefs.getValue("description3", "")%>">
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表标题：</span> <input
					id="chartTitle3" name="chartTitle3" type="text"
					value="<%=prefs.getValue("chartTitle3", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图例列表：</span> <input
					id="chartLegends3" name="chartLegends3" type="text"
					value="<%=prefs.getValue("chartLegends3", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">颜色列表：</span> <input
					id="chartColors3" name="chartColors3" type="text"
					value="<%=prefs.getValue("chartColors3", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴单位：</span> <input
					id="ySymbol3" name="ySymbol3" type="text"
					value="<%=prefs.getValue("ySymbol3", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴左标题：</span> <input
					id="yLeftTitle3" name="yLeftTitle3" type="text"
					value="<%=prefs.getValue("yLeftTitle3", "")%>">
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴右标题：</span> <input
					id="yRightTitle3" name="yRightTitle3" type="text"
					value="<%=prefs.getValue("yRightTitle3", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">曲线点类型：</span> <select
					id="symbol3" name="symbol3" style="width: 29.5%">
					<option value="circle">圆点</option>
					<option value="square">正方形</option>
					<option value="diamond">方形</option>
					<option value="triangle">三角形</option>
					<option value="triangle-down">倒三角</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">导出列头名称：</span> <input
					id="expColumnName3" name="expColumnName3" type="text"
					value="<%=prefs.getValue("expColumnName3", "")%>">
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="ftitle">
				<span>表格视图配置</span>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Name：</span> <input
					id="form_name3" name="form_name3" type="text"
					value="<%=prefs.getValue("form_name3", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Id：</span> <input
					id="form_id3" name="form_id3" type="text"
					value="<%=prefs.getValue("form_id3", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ispd：</span> <input
					id="form_ispd3" name="form_ispd3" type="text"
					value="<%=prefs.getValue("form_ispd3", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">共用的列：</span> <input
					id="commonColumn3" name="commonColumn3" type="text"
					value="<%=prefs.getValue("commonColumn3", "")%>">
			</div>
		</div>
		
		<br /><br />
		
		<div class="div-table-row">
			<div class="ftitle">
				<span>冷冻水泵</span>
			</div>
		</div>
		
		<br />
		
		<div class="div-table-row">
			<div class="div-table-col"
				style="height: 250px; width: 900px; margin-left: 30px;">
				<div id="<portlet:namespace/>dgrid4"></div>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-col">
				<div id="buttons" style="margin-left: 30px;">
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>setNameAndId('dgrid4','chart_name4','chart_id4','chart_ispd4')">获取name和id</a>
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>clear('chart_name4','chart_id4','chart_ispd4')">清空name/id/ispd</a>&nbsp;&nbsp;&nbsp;
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>setNameAndId('dgrid4','form_name4','form_id4','form_ispd4')">获取name和id</a>
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>clear('form_name4','form_id4','form_ispd4')">清空name/id/ispd</a>
				</div>
			</div>
		</div>
		
		<br />
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Name：</span> <input
					id="chart_name4" name="chart_name4" type="text"
					value="<%=prefs.getValue("chart_name4", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Id：</span> <input
					id="chart_id4" name="chart_id4" type="text"
					value="<%=prefs.getValue("chart_id4", "")%>">
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ispd：</span> <input
					id="chart_ispd4" name="chart_ispd4" type="text"
					value="<%=prefs.getValue("chart_ispd4", "")%>">
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题：</span> <input id="title4"
					name="title4" type="text" value="<%=prefs.getValue("title4", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">描述：</span> <input
					id="description4" name="description4" type="text"
					value="<%=prefs.getValue("description4", "")%>">
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表标题：</span> <input
					id="chartTitle4" name="chartTitle4" type="text"
					value="<%=prefs.getValue("chartTitle4", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图例列表：</span> <input
					id="chartLegends4" name="chartLegends4" type="text"
					value="<%=prefs.getValue("chartLegends4", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">颜色列表：</span> <input
					id="chartColors4" name="chartColors4" type="text"
					value="<%=prefs.getValue("chartColors4", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴单位：</span> <input
					id="ySymbol4" name="ySymbol4" type="text"
					value="<%=prefs.getValue("ySymbol4", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴左标题：</span> <input
					id="yLeftTitle4" name="yLeftTitle4" type="text"
					value="<%=prefs.getValue("yLeftTitle4", "")%>">
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴右标题：</span> <input
					id="yRightTitle4" name="yRightTitle4" type="text"
					value="<%=prefs.getValue("yRightTitle4", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">曲线点类型：</span> <select
					id="symbol4" name="symbol4" style="width: 29.5%">
					<option value="circle">圆点</option>
					<option value="square">正方形</option>
					<option value="diamond">方形</option>
					<option value="triangle">三角形</option>
					<option value="triangle-down">倒三角</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">导出列头名称：</span> <input
					id="expColumnName4" name="expColumnName4" type="text"
					value="<%=prefs.getValue("expColumnName4", "")%>">
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="ftitle">
				<span>表格视图配置</span>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Name：</span> <input
					id="form_name4" name="form_name4" type="text"
					value="<%=prefs.getValue("form_name4", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Id：</span> <input
					id="form_id4" name="form_id4" type="text"
					value="<%=prefs.getValue("form_id4", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ispd：</span> <input
					id="form_ispd4" name="form_ispd4" type="text"
					value="<%=prefs.getValue("form_ispd4", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">共用的列：</span> <input
					id="commonColumn4" name="commonColumn4" type="text"
					value="<%=prefs.getValue("commonColumn4", "")%>">
			</div>
		</div>
		
		<br /><br />
		
		<div class="div-table-row">
			<div class="ftitle">
				<span>冷却塔</span>
			</div>
		</div>
		
		<br />
		
		<div class="div-table-row">
			<div class="div-table-col"
				style="height: 250px; width: 900px; margin-left: 30px;">
				<div id="<portlet:namespace/>dgrid5"></div>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-col">
				<div id="buttons" style="margin-left: 30px;">
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>setNameAndId('dgrid5','chart_name5','chart_id5','chart_ispd5')">获取name和id</a>
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>clear('chart_name5','chart_id5','chart_ispd5')">清空name/id/ispd</a>&nbsp;&nbsp;&nbsp;
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>setNameAndId('dgrid5','form_name5','form_id5','form_ispd5')">获取name和id</a>
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>clear('form_name5','form_id5','form_ispd5')">清空name/id/ispd</a>
				</div>
			</div>
		</div>
		
		<br />
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Name：</span> <input
					id="chart_name5" name="chart_name5" type="text"
					value="<%=prefs.getValue("chart_name5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Id：</span> <input
					id="chart_id5" name="chart_id5" type="text"
					value="<%=prefs.getValue("chart_id5", "")%>">
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ispd：</span> <input
					id="chart_ispd5" name="chart_ispd5" type="text"
					value="<%=prefs.getValue("chart_ispd5", "")%>">
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题：</span> <input id="title5"
					name="title5" type="text" value="<%=prefs.getValue("title5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">描述：</span> <input
					id="description5" name="description5" type="text"
					value="<%=prefs.getValue("description5", "")%>">
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表标题：</span> <input
					id="chartTitle5" name="chartTitle5" type="text"
					value="<%=prefs.getValue("chartTitle5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图例列表：</span> <input
					id="chartLegends5" name="chartLegends5" type="text"
					value="<%=prefs.getValue("chartLegends5", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">颜色列表：</span> <input
					id="chartColors5" name="chartColors5" type="text"
					value="<%=prefs.getValue("chartColors5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴单位：</span> <input
					id="ySymbol5" name="ySymbol5" type="text"
					value="<%=prefs.getValue("ySymbol5", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴左标题：</span> <input
					id="yLeftTitle5" name="yLeftTitle5" type="text"
					value="<%=prefs.getValue("yLeftTitle5", "")%>">
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴右标题：</span> <input
					id="yRightTitle5" name="yRightTitle5" type="text"
					value="<%=prefs.getValue("yRightTitle5", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">曲线点类型：</span> <select
					id="symbol5" name="symbol5" style="width: 29.5%">
					<option value="circle">圆点</option>
					<option value="square">正方形</option>
					<option value="diamond">方形</option>
					<option value="triangle">三角形</option>
					<option value="triangle-down">倒三角</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">导出列头名称：</span> <input
					id="expColumnName5" name="expColumnName5" type="text"
					value="<%=prefs.getValue("expColumnName5", "")%>">
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="ftitle">
				<span>表格视图配置</span>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Name：</span> <input
					id="form_name5" name="form_name5" type="text"
					value="<%=prefs.getValue("form_name5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Id：</span> <input
					id="form_id5" name="form_id5" type="text"
					value="<%=prefs.getValue("form_id5", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ispd：</span> <input
					id="form_ispd5" name="form_ispd5" type="text"
					value="<%=prefs.getValue("form_ispd5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">共用的列：</span> <input
					id="commonColumn5" name="commonColumn5" type="text"
					value="<%=prefs.getValue("commonColumn5", "")%>">
			</div>
		</div>
		
		<br /><br />
		
		<div class="div-table-row">
			<div class="ftitle">
				<span>空调箱</span>
			</div>
		</div>
		
		<br />
		
		<div class="div-table-row">
			<div class="div-table-col"
				style="height: 250px; width: 900px; margin-left: 30px;">
				<div id="<portlet:namespace/>dgrid6"></div>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-col">
				<div id="buttons" style="margin-left: 30px;">
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>setNameAndId('dgrid6','chart_name6','chart_id6','chart_ispd6')">获取name和id</a>
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>clear('chart_name6','chart_id6','chart_ispd6')">清空name/id/ispd</a>&nbsp;&nbsp;&nbsp;
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>setNameAndId('dgrid6','form_name6','form_id6','form_ispd6')">获取name和id</a>
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>clear('form_name6','form_id6','form_ispd6')">清空name/id/ispd</a>
				</div>
			</div>
		</div>
		
		<br />
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Name：</span> <input
					id="chart_name6" name="chart_name6" type="text"
					value="<%=prefs.getValue("chart_name6", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Id：</span> <input
					id="chart_id6" name="chart_id6" type="text"
					value="<%=prefs.getValue("chart_id6", "")%>">
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ispd：</span> <input
					id="chart_ispd6" name="chart_ispd6" type="text"
					value="<%=prefs.getValue("chart_ispd6", "")%>">
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题：</span> <input id="title6"
					name="title6" type="text" value="<%=prefs.getValue("title6", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">描述：</span> <input
					id="description6" name="description6" type="text"
					value="<%=prefs.getValue("description6", "")%>">
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表标题：</span> <input
					id="chartTitle6" name="chartTitle6" type="text"
					value="<%=prefs.getValue("chartTitle6", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图例列表：</span> <input
					id="chartLegends6" name="chartLegends6" type="text"
					value="<%=prefs.getValue("chartLegends6", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">颜色列表：</span> <input
					id="chartColors6" name="chartColors6" type="text"
					value="<%=prefs.getValue("chartColors6", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴单位：</span> <input
					id="ySymbol6" name="ySymbol6" type="text"
					value="<%=prefs.getValue("ySymbol6", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴左标题：</span> <input
					id="yLeftTitle6" name="yLeftTitle6" type="text"
					value="<%=prefs.getValue("yLeftTitle6", "")%>">
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴右标题：</span> <input
					id="yRightTitle6" name="yRightTitle6" type="text"
					value="<%=prefs.getValue("yRightTitle6", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">曲线点类型：</span> <select
					id="symbol6" name="symbol6" style="width: 29.5%">
					<option value="circle">圆点</option>
					<option value="square">正方形</option>
					<option value="diamond">方形</option>
					<option value="triangle">三角形</option>
					<option value="triangle-down">倒三角</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">导出列头名称：</span> <input
					id="expColumnName6" name="expColumnName6" type="text"
					value="<%=prefs.getValue("expColumnName6", "")%>">
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="ftitle">
				<span>表格视图配置</span>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Name：</span> <input
					id="form_name6" name="form_name6" type="text"
					value="<%=prefs.getValue("form_name6", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Id：</span> <input
					id="form_id6" name="form_id6" type="text"
					value="<%=prefs.getValue("form_id6", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ispd：</span> <input
					id="form_ispd6" name="form_ispd6" type="text"
					value="<%=prefs.getValue("form_ispd6", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">共用的列：</span> <input
					id="commonColumn6" name="commonColumn6" type="text"
					value="<%=prefs.getValue("commonColumn6", "")%>">
			</div>
		</div>
		
		<br /> <br />
		
				<div class="div-table-row">
			<div class="ftitle">
				<span>图形视图共用配置</span>
			</div>
		</div>
		
		<br />

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">说明区背景：</span> <input
					id="bgColor" name="bgColor" type="text"
					value="<%=prefs.getValue("bgColor", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">默认时间：</span> <input
					id="defaultTime" name="defaultTime" type="text"
					value="<%=prefs.getValue("defaultTime", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">连接线宽：</span> <input
					id="connLineWidth" name="connLineWidth"
					title="为空则默认为2，为0则不显示连接线" type="text"
					value="<%=prefs.getValue("connLineWidth", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">背景颜色：</span> <input
					id="c_bgColor" name="c_bgColor" type="text"
					value="<%=prefs.getValue("c_bgColor", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">填充颜色列表：</span> <input
					id="c_fillColors" name="c_fillColors" type="text"
					value="<%=prefs.getValue("c_fillColors", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">线宽：</span> <input
					id="lineWidth" name="lineWidth" type="text"
					value="<%=prefs.getValue("lineWidth", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">X轴间隔：</span> <input
					id="xStep" name="xStep" type="text"
					value="<%=prefs.getValue("xStep", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">线样式：</span> <input
					id="gridLineStyle" name="gridLineStyle" type="text"
					value="<%=prefs.getValue("gridLineStyle", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">表类型1：</span> <select
					id="chartType1" name="chartType1"
					style="width: 29.5%">
					<option value="line">曲线图</option>
					<option value="column">柱状图</option>
					<option value="area">面积图</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">表类型2：</span> <select
					id="chartType2" name="chartType2"
					style="width: 29.5%">
					<option value="line">曲线图</option>
					<option value="column">柱状图</option>
					<option value="area">面积图</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">显示X轴网格线：</span> <select
					id="showXGridLine" name="showXGridLine" style="width: 29.5%">
					<option value="1">显示</option>
					<option value="0">不显示</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">显示Y轴网格线:</span> <select
					id="showYGridLine" name="showYGridLine" style="width: 29.5%">
					<option value="1">显示</option>
					<option value="0">不显示</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴数据列表：</span> <input
					id="yAxisList" name="yAxisList" type="text"
					value="<%=prefs.getValue("yAxisList", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">半径列表：</span> <input
					id="radiusList" name="radiusList" type="text"
					value="<%=prefs.getValue("radiusList", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="ftitle">
				<span>表格视图共用配置</span>
			</div>
		</div>
		
		<br />

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">日报特有的列：</span> <input
					id="dayColumn" name="dayColumn" type="text"
					value="<%=prefs.getValue("dayColumn", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">是否显示冷机：</span> <select
					id="showLegendForm" name="showLegendForm" style="width: 29.5%">
					<option value="show">显示</option>
					<option value="hide">不显示</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">是否需要乘数：</span> <input
					id="form_mul" name="form_mul" type="text"
					value="<%=prefs.getValue("form_mul", "")%>">
			</div>
		</div>

		<br /><br />
		
		<div id="buttons">
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
				onclick="<portlet:namespace/>savePreference()">保存</a>
		</div>
	</div>
</form:form>

<script type="text/javascript">
/**
* 保存
*/
function <portlet:namespace/>savePreference() {
	$("#coreinfo").form('submit', {
		url:'<%=renderResponse.encodeURL(savePreferencesUrl)%>',
		onSubmit : function() {
			return $(this).form('validate');
		},
		success: function(result){
			$("#msg").addClass("portlet-msg-success").html("您的请求已处理成功。");
		}
	});
}

/**
 * 为urlName和urlId赋值
 */
function <portlet:namespace/>setNameAndId(id,choose_name,choose_id,ispd){
	var names = [],ids = [],ispds = [];
	var rows = $('#<portlet:namespace/>'+id).datagrid('getSelections');
	if(rows.length==0){
		alert('请在列表中选择相应的值！');
	}else{
		for(var i=0;i<rows.length;i++){
			names.push(rows[i].name);
			ids.push(rows[i].id);
			ispds.push(rows[i].ispd);
		}
		// 赋值
		$('#'+choose_name).val(names.join(','));
		$('#'+choose_id).val(ids.join(','));
		$('#'+ispd).val(ispds.join(','));
	}
}

/**
 * 为urlName和urlId赋值
 */
function <portlet:namespace/>clear(choose_name,choose_id,ispd){
	// 赋值
	$('#'+choose_name).val('');
	$('#'+choose_id).val('');
	$('#'+ispd).val('');
}

//渲染datagrid
function renderDataGrid(id){
	$("#<portlet:namespace/>"+id).datagrid({
		height : 500,
		width:450,
		rownumbers:true,//序号 
		collapsible:false,//是否可折叠的 
		pagination : true,//是否分页
		rownumbers:true,
		fit: true,
		pageSize: 50,
		pageList: [10,30,50,500,1000],
		url:'<portlet:resourceURL id="getQuerySchemeList"></portlet:resourceURL>',
		frozenColumns : [[{
			field : 'ff',
			checkbox : true,
			sortable : true
		}]],
		fitColumns: true,
		columns:[[
		  	{field:'comments',title:'名称',width:$(this).width() * 0.2},
			{field:'id',title:'urlId',width:$(this).width() * 0.15}, 
			{field:'name',title:'urlName',width:$(this).width() * 0.2},
			{field:'ispd',title:'ispd',width:$(this).width() * 0.1}
		]],
		onLoadSuccess : function (){
			//移除报表页面的tr标签的big_tr样式
			$("tr:even").removeClass("big_tr");
		}
	});
}

$("#chooseView").val('<%=prefs.getValue("chooseView","")%>');
$("#decimals").val('<%=prefs.getValue("decimals","")%>');
$("#chartType1").val('<%=prefs.getValue("chartType1","")%>');
$("#chartType2").val('<%=prefs.getValue("chartType2","")%>');
$("#showXGridLine").val('<%=prefs.getValue("showXGridLine","")%>');
$("#showYGridLine").val('<%=prefs.getValue("showYGridLine","")%>');
$("#showLegendForm").val('<%=prefs.getValue("showLegendForm","")%>');
//渲染冷水机组的效果
renderDataGrid("dgrid1");
$("#symbol1").val('<%=prefs.getValue("symbol1","")%>');
//渲染锅炉的效果
renderDataGrid("dgrid2");
$("#symbol2").val('<%=prefs.getValue("symbol2","")%>');
//渲染冷却水泵的效果
renderDataGrid("dgrid3");
$("#symbol3").val('<%=prefs.getValue("symbol3","")%>');
//渲染冷冻水泵的效果
renderDataGrid("dgrid4");
$("#symbol4").val('<%=prefs.getValue("symbol4","")%>');
//渲染冷却塔的效果
renderDataGrid("dgrid5");
$("#symbol5").val('<%=prefs.getValue("symbol5","")%>');
//渲染空调箱的效果
renderDataGrid("dgrid6");
$("#symbol6").val('<%=prefs.getValue("symbol6","")%>');
</script>