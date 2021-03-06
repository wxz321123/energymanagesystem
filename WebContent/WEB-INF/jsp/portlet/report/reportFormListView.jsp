<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>

<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-17下午4点01分
	LastModified Date:
	Description: 报表输出页面
 -->

<div class="div-table" style="margin-left: 18px;" id="<portlet:namespace />formdiv">
	<input id="<portlet:namespace />datetime1" type="hidden" />
	<iframe name="<portlet:namespace />tmpFrame1"
		id="<portlet:namespace />tmpFrame1" width="1" height="1"
		style="visibility: hidden; position: absolute; display: none"></iframe>
	<div class="content center">
		<div class="form_style">
			<div class="form_func_title">
				<span class="list_title">${reportform.title}</span>
				<div class="block build_select" id="choose_region">
					<span class="select_name">选择楼层</span> 
					<select id="regionSelect">
						<option value="0000010700010001">0M</option> 
						<option value="0000010700010002">5M</option> 
						<option value="0000010700010003">33M</option> 
						<option value="0000010700010004">41M</option> 
						<option value="0000010700010005">49M</option>
					</select>
				</div>
				<div class="block date_select">
					<span class="select_name">选择类型</span> <select
						name="<portlet:namespace />select_type"
						id="<portlet:namespace />select_type">
						<option selected="selected" value="day">日报</option>
						<option value="week">周报</option>
						<option value="month">月报</option>
						<option value="year">年报</option>
					</select>
				</div>
				<div class="block">
					<span class="select_name">选择日期</span> <input type="text"
						id="<portlet:namespace />date1"
						onclick="<portlet:namespace />choosetime('date1','date2')">
					<span class="select_name select_name_2">至</span> <input type="text"
						id="<portlet:namespace />date2" readonly="readonly">
				</div>
				<div class="btn_group">
					<div style="cursor: pointer;"
						onclick="<portlet:namespace />query()">查询</div>
					<div style="cursor: pointer;"
						onclick="<portlet:namespace />expToExcel()">输出</div>
					<div style="cursor: pointer;"
						onclick="<portlet:namespace />returnPage()">返回</div>
				</div>
			</div>
		</div>

		<div id="<portlet:namespace />swap_info" class="table_style">
			<div class="span12 basic_imformation cur">
				<div id="<portlet:namespace />reportdiv" style="width: 100%; height:700px; overflow: auto;"></div>
			</div>
		</div>
	</div>

</div>

<script type="text/javascript">
//设置顶部的皮肤背景颜色 
try{
	$(".portlet-borderless-bar").remove(); // 移除右上角的黑点
	$('#nav_bg_div').css("background-color", "#6699CC");
	$('.nav_gat_bar>li').css("background-color", "#4885C1");
}catch(e){}

var <portlet:namespace />choose_type = "${s_type}"; // 选择的时间类型（日报、周报、月报、年报）
var <portlet:namespace />dformt = 'yyyy-MM-dd'; // 选择的时间类型（日报、周报、月报、年报）
var <portlet:namespace />starttime = '${from_date}'; // 开始时间 
var <portlet:namespace />endtime = '${to_date}'; // 结束时间 

// 点击返回按钮，触发的事件
function <portlet:namespace />query(){
	// 拼接URL并传递参数到后台
	var url = '<portlet:renderURL portletMode="view" windowState="maximized"><portlet:param name="action" value="printReportInfo"></portlet:param><portlet:param name="time_type" value="printReportInfo"></portlet:param></portlet:renderURL>';
	url += "&type=" + <portlet:namespace />choose_type + "&regionid=" + $("#regionSelect").val();
	url += "&show_tfrom=" + <portlet:namespace />starttime + "&show_tto=" + <portlet:namespace />endtime
		   + "&from=" + <portlet:namespace />starttime + 
		   "&to=" + <portlet:namespace />endtime +
		   "&decimals=" + '${reportform.decimals}';
	// 跳转到对应到url上
	window.location.href = url;
}

// 点击返回按钮，触发的事件 
function <portlet:namespace />returnPage(){
	window.location.href = '<portlet:renderURL portletMode="view"  windowState="normal"></portlet:renderURL>';
}

//输出到EXCEL
function <portlet:namespace />expToExcel() {
	// 导出excel的Url
	var expUrl = "";
			
	// 判断导出什么样的excel
	var distance = "${reportform.distance}";
	var title = "${reportform.title}";
	if(distance != "" || (title == "冷机报表" || title == "水系统报表")) { // 针对运行监测特殊处理

		//zzx
		expUrl = "<portlet:resourceURL id='expDeviceDataToExcel'></portlet:resourceURL>"
			+ "&from="
			+ <portlet:namespace />starttime
			+ "&type="
			+ <portlet:namespace />choose_type
			+ "&decimals=${reportform.decimals}"
			+ "&regionText="
			+ $("#regionSelect option:selected").text()
			+ "&regionId="
			+ $("#regionSelect").val()
			;
			
	} else {

		expUrl = "<portlet:resourceURL id='expDataToExcel'></portlet:resourceURL>"
				+ "&from="
				+ <portlet:namespace />starttime
				+ "&type="
				+ <portlet:namespace />choose_type;

	}
	var hSrc = "http://" + document.location.host
			+ "/energymanagesystem/uploadfiles/" + "${reportform.title}"
			+ ".xls";
	$.ajax({
		type : "POST",
		url : expUrl,
		async : false,
		contentType : 'application/x-msdownload;charset=UTF-8',
		success : function(result) {
			$("#<portlet:namespace />tmpFrame1").attr('src', hSrc);
		},
		error : function(result) {
			console.log('error');
		}
	});
}

// 点击文本框弹出的日历控件 
function <portlet:namespace />choosetime(id1,id2){
	<portlet:namespace />choose_type = <portlet:namespace />select_type.value;
	var dformt = 'yyyy-MM-dd';
	if (<portlet:namespace />choose_type == "day"){
		dformt = 'yyyy-MM-dd';
	} else if (<portlet:namespace />choose_type == "week") {
		dformt = 'yyyy-MM-dd';
	} else if (<portlet:namespace />choose_type == "month") {
		dformt = 'MM';
	} else if (<portlet:namespace />choose_type == "year") {
		dformt = 'yyyy';
	}
	
	// date
	WdatePicker({
		el : '<portlet:namespace />datetime1',
		dateFmt : dformt,
		onpicked : function(dp) {
			// 具体的对比时间，格式为（yyyy-MM-dd），此时间会传递到后台
			var paretime= dp.cal.getDateStr('yyyy-MM-dd');
			<portlet:namespace />starttime = paretime;
			
			// 显示在页面文本框上的时间
			var showtime= dp.cal.getDateStr(dformt); // 选择对应的输出格式（日报、周报、月报、年报）
			var val2 = ""; // 结束时间的值
			if (<portlet:namespace />choose_type == "day"){
				val2 = showtime;
			} else if (<portlet:namespace />choose_type == "week") {
				showtime = showWeekFirstDay(paretime);
				val2 = showWeekLastDay(paretime);
			} else if (<portlet:namespace />choose_type == "month") {
				showtime = dp.cal.getDateStr('yyyy-MM-') + "01";
				val2 = showMonthLastDay(paretime); // showMonthLastDay行数在tomcat目录下的
			} else if (<portlet:namespace />choose_type == "year") {
				val2 = showtime;
			}
			
			$('#<portlet:namespace />'+id1).val(showtime);
			$('#<portlet:namespace />'+id2).val(val2);
			<portlet:namespace />starttime = paretime;
			<portlet:namespace />endtime = val2;
		}
	});
}

// 生成表格视图
function buildTableData() {
	$.post('<portlet:resourceURL id="getReportDataList"></portlet:resourceURL>',
			{
				from : <portlet:namespace />starttime,
				to : <portlet:namespace />endtime,
				type : <portlet:namespace />choose_type,
				decimals : '${reportform.decimals}'
			}, function(data) {
				var showCataList = data.showCataList;
				var showDataList = data.showDataList;

				// 最后赋值的html变量
				var html = '<table align="center" class="form_detail" border="1">';
				var firstRow = '<tr><th style="width: 70px; text-align: center;">日期</th>'; // 第一行的数据
				var content = ''; // 中间的内容数据
				
				var commonColumnList = [];
				commonColumnList.push(${reportform.commonColumn});
				
				// 报表的时间类型（day/week/month/year）
				var s_type = "${s_type}";
				if(s_type=="day"){// 日报的处理方式
					
					firstRow += '<th style="width: 44px; text-align: center;">${reportform.dayColumn}</th>';
					
				}
				
				// 循环添加内容数据
				for(var i=0;i<showCataList[0].length;i++){
					content += "<tr align='center'>"+(s_type=="day"?("<td>"+"${from_date}"+"</td>"):"")+"<td>"+showCataList[0][i]+"</td>";
					for(var k=0;k<commonColumnList.length;k++){
						content += '<td>'+ (showDataList[k][i] != undefined ? showDataList[k][i] : '') +'</td>';
					}
					content += "</tr>";
				}
				
				// 处理报表列头信息
				for(var i=0;i<commonColumnList.length;i++){
					firstRow += '<th style="text-align: center;">'+commonColumnList[i]+'</th>';
				}
				firstRow += '</tr>';
				
				html = html + firstRow + content;
				
				html += '</table><br/><br/><br/>';
				
				$('#<portlet:namespace />reportdiv').html("");
			    $('#<portlet:namespace />reportdiv').html(html);
			    
			    // 设置模块的高度，以适应版权的高度  
			    $('#<portlet:namespace />formdiv').height($('#<portlet:namespace />reportdiv').height() + 100);
			}, 'json');
}

// 生成针对运行监测的报表
function buildDynamic() {
	$.post('<portlet:resourceURL id="getReportDataList"></portlet:resourceURL>',
			{
				from : <portlet:namespace />starttime,
				to : <portlet:namespace />endtime,
				type : <portlet:namespace />choose_type,
				decimals : '${reportform.decimals}',
				regionText : $("#regionSelect option:selected").text(),
				regionId : $("#regionSelect").val()
			}, function(data) {
				var showCataList = data.showCataList;
				var showDataList = data.showDataList;

				var t_1 = data.row1, one = t_1.split(","), t1_len = one.length;
				var t_2 = data.row2, two = t_2.split(","), t2_len = two.length;
				var t_3 = data.row3, thr = t_3.split(","), t3_len = thr.length;
				// 1.首先确定行数
				var row = 3;
				if(t_3 == "") { // 判断第三行是否配置了内容
					row = 2, t3_len = 0;
				} 
				if(t_2 == "") { // 判断第二行是否配置了内容
					row = 1, t2_len = 0;
				}

				// 2.确定列数
				var t2t3_len = (t2_len == 0 ? 1 : t2_len) * (t3_len == 0 ? 1 : t3_len), total_col = t1_len * t2t3_len; // 第二行第三行总列数、总列数

				// 3.确定每行的元素
				var html = "<table align='center' class='form_detail' border='1'>", content = '';
				var row1 = "<tr><td nowrap rowspan='" + row + "' style='width: 123px; text-align: center;'>日期</td>", row2 = "", row3 = "";

				// 4.写入元素
				var k = 0, v = 0; // 分别记录第一行、第二行的索引
				for (var i = 1; i <= total_col; i++) {
					
					// 第一行数据
					var index = (i - 1) % t2t3_len;
					if (index == 0) {
						row1 += '<td nowrap colspan="' + t2t3_len + '" style="width: 100px; text-align: center;">' + one[k] + '</td>';
						k++;
					}
					if (t2_len != 0) { // t2_len不为0，才考虑多行的情况
						if (t3_len != 0) { // t3_len不为0，才操作第二行的数据
							index = (i - 1) % t3_len;
							if (index == 0) { // 循环写入第二行的数据
								row2 += "<td nowrap colspan='" + t3_len + "' style='text-align: center; width: 100px;'>" + two[v] + "</td>";
								v++;
								if (v >= t2_len) { v = 0; }
							}
						}

						if (t3_len == 0) { // 第三行没有配置内容的情况
							row2 += "<td nowrap style='text-align: center; width: 100px;'>" + two[index] + "</td>";
						} else {
							row3 += "<td nowrap style='text-align: center; width: 100px;'>" + thr[index] + "</td>";
						}
					}
				}
				
				// 循环添加内容数据
				for (var i = 0; i < showCataList[0].length; i++) {
					var title = "${reportform.title}", ca_val = "", da_val = "";
					try {
						ca_val = showCataList[0][i];
						// 冷机报表和水系统报表需特殊处理
						//if("${s_type}" == "day" && (title == "冷机报表" || title == "水系统报表")) {
							//ca_val = "${show_tfrom} " + ca_val;
						//}
					} catch(e) {
						ca_val = "";
					}
					content += "<tr align='center'><td nowrap style=' width: 100px;'>" + ca_val + "</td>";
					for (var k = 0; k < total_col; k++) {
						try { 
							da_val = showDataList[k][i];
						} catch(e) {
							da_val = "";
						}
						content += '<td nowrap style=" width: 100px;">' + (da_val != undefined ? da_val : '') + '</td>';
					}
					content += "</tr>";
				}

				row2 = (row2 == "" ? "" : ("<tr>" + row2 + "</tr>"));
				row3 = (row3 == "" ? "" : ("<tr>" + row3 + "</tr>"));
				html = html + row1 + "</tr>" + row2 + row3 + content + "<table>";

				$('#<portlet:namespace />reportdiv').html("").html(html);
				// 设置模块的高度，以适应版权的高度
			    $('#<portlet:namespace />formdiv').height($('#<portlet:namespace />reportdiv').height() + 100);
			}, 'json');
}

$(function() {
	$(".form_style").show(); // 显示对应的报表
	
	$('#<portlet:namespace />select_type').change(function(){
		<portlet:namespace />choose_type = <portlet:namespace />select_type.value;
	})
	
	// 设置对应的下拉列表的值
	$("#<portlet:namespace />select_type").val("${s_type}");
	// 设置开始时间和结束时间
	$('#<portlet:namespace />date1').val("${show_tfrom}");
	$('#<portlet:namespace />date2').val("${show_tto}");
	
	// 判断生成什么样的表头
	var distance = "${reportform.distance}";
	if(distance != "") { // 针对运行监测特殊处理
		if(distance == 'ahu' || distance == 'fau' || distance == 'acu') {
			$("#choose_region").show();
			$("#regionSelect").val("${regionid}");
		} else {
			$("#choose_region").hide();
		}
		$("#<portlet:namespace />select_type option:last").remove(); // 移除年份查询
		buildDynamic();
	} else {
		
		$("#choose_region").hide();
		var title = "${reportform.title}";
		if(title == "冷机报表" || title == "水系统报表") {
			$("#<portlet:namespace />select_type option:last").remove(); // 移除年份查询
			buildDynamic();
		} else {
			buildTableData(); // 生成表格数据
		}

	}
});
</script>