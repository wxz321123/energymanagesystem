<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-7-26 下午2点27分
	LastModified Date:
	Description: 能耗统计-建筑用电分项
 -->

<style type="text/css">
.spanwidth {
	width: 85px;
	margin-top: 5px;
}
</style>

<portlet:actionURL var="savePreferencesUrl">
	<portlet:param name="action" value="savePreferences" />
</portlet:actionURL>

<div id="msg"></div>

<form:form commandName="preferenceinfo" id="buildelesubitem" method="post"
	class="" action="#">

	<div class="ftitle">
		<span></span><span class="title-back"><a
			href="<portlet:renderURL portletMode="view"></portlet:renderURL>">«返回</a></span>
	</div>
	
	<div class="div-table">

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">URL名称：</span> <input
					id="urlName" name="urlName" type="text"
					value="<%=prefs.getValue("urlName", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">描述：</span> <input
					id="description" name="description" type="text"
					value="<%=prefs.getValue("description", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">背景颜色：</span> <input
					id="backgroundColor" name="backgroundColor" type="text"
					value="<%=prefs.getValue("backgroundColor", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表类型：</span> <input
					id="chartType" name="chartType" type="text"
					value="<%=prefs.getValue("chartType", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图例列表：</span> <input
					id="chartLegendList" name="chartLegendList" type="text"
					value="<%=prefs.getValue("chartLegendList", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图例颜色列表：</span> <input
					id="chartColorList" name="chartColorList" type="text"
					value="<%=prefs.getValue("chartColorList", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表数据列表：</span> <input
					id="chartDataList" name="chartDataList" type="text"
					value="<%=prefs.getValue("chartDataList", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图例展示方式：</span> <input
					id="chartLegendLayout" name="chartLegendLayout" type="text"
					value="<%=prefs.getValue("chartLegendLayout", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图例对齐方式：</span> <input
					id="chartLegendAlign" name="chartLegendAlign" type="text"
					value="<%=prefs.getValue("chartLegendAlign", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">字体颜色：</span> <input
					id="chartWordColor" name="chartWordColor" type="text"
					value="<%=prefs.getValue("chartWordColor", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">链接名称1：</span> <input
					id="linkName_1" name="linkName_1" type="text"
					value="<%=prefs.getValue("linkName_1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">链接地址1：</span> <input
					id="linkUrl_1" name="linkUrl_1" type="text"
					value="<%=prefs.getValue("linkUrl_1", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			
			<div class="div-table-2col">
				<span class="spanwidth" align="right">链接名称2：</span> <input
					id="linkName_2" name="linkName_2" type="text"
					value="<%=prefs.getValue("linkName_2", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">链接地址2：</span> <input
					id="linkUrl_2" name="linkUrl_2" type="text"
					value="<%=prefs.getValue("linkUrl_2", "")%>">
			</div>
			
		</div>

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
	$("#buildelesubitem").form('submit', {
		url:'<%=renderResponse.encodeURL(savePreferencesUrl)%>',
		onSubmit : function() {
			return $(this).form('validate');
		},
		success: function(result){
			$("#msg").addClass("portlet-msg-success").html("您的请求已处理成功。");
		}
	});
}
</script>