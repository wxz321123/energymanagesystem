<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HTML START -->
<!-- 
	AUTHOR: LIUCHAO
	Created Date: 2013-11-29 下午5点46分
	LastModified Date:
	Description: 能耗报表-空调系统用电
 -->
<div class="detail report_detail" style="background-color:${tbinfo.bgColor}">
	<div>
		<h1 id="<portlet:namespace />">${tbinfo.title3}</h1>
		<p id="<portlet:namespace />description">${tbinfo.description3}</p>
	</div>
</div>
<div class="charts">
	<div class="chart">
		<div class="look_other">
			<div class="filter_widget" id="<portlet:namespace />choose_build3">
				<div class="filter_label has_border_radius_left">选择建筑</div>
				<select class="selectpicker">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
				</select>
			</div>
			<div class="filter_widget">
				<input id="<portlet:namespace />datetime3" type="hidden" />

				<div class="filter_label has_border_radius_left">选择类型</div>
				<select class="selectpicker"
					name="<portlet:namespace />format_select3"
					id="<portlet:namespace />format_select3">
					<option selected="selected" value="day">日报</option>
					<option value="week">周报</option>
					<option value="month">月报</option>
					<option value="year">年报</option>
				</select>
			</div>
			<div class="filter_widget">
				<div class="filter_label has_border_radius_left">选择日期</div>
				<input type="text" id="<portlet:namespace />from_date3"
					onclick="<portlet:namespace />selectdate3()" /> <span class="to">至</span>
				<input type="text" id="<portlet:namespace />to_date3"
					readonly="readonly" />
			</div>
			<div class="tool_groupt">
				<div class="has_border_radius_left search_btn"
					onclick="<portlet:namespace />confirm3()"></div>
				<div class="has_border_radius_right downLoad_btn"
					onclick="<portlet:namespace />expToExcel3()"></div>
			</div>
		</div>
		<div
			class="sub_content chart_content <portlet:namespace/>showContent3">
			<%-- <div class="double_chartTitle"><p style="font-family:微软雅黑;font-size: 16px;color: #274b6d;">${tbinfo.chartTitle5}</p> --%>
			<div id="<portlet:namespace />consumptionLeft3" class="double_chart"></div>
			<!-- </div> -->
			<div id="<portlet:namespace />consumptionRight3" class="double_chart"></div>
		</div>
		<div
			class="sub_content table_content <portlet:namespace/>showContent3"
			id="<portlet:namespace />form3"></div>
	</div>
</div>

<script type="text/javascript">
	var <portlet:namespace />start_date3 = ''; // 开始时间
	var <portlet:namespace />choose_type3 = ''; // 点击类型（日、周、月、年）
	var <portlet:namespace />step3 = "${tbinfo.xStep}"; //存储X轴的显示间隔
	var <portlet:namespace />centerTitle3 = "${tbinfo.chartTitle5}"; //图表居中标题
	/* var <portlet:namespace />c_title3 = ''; // 存储居中标题对应的年份 */
	var <portlet:namespace />chartLegends5 = "${tbinfo.chartLegends5}";// 左图图例列表
	var <portlet:namespace />showLegend3 = false; // 左图默认不显示图例
	var <portlet:namespace />chart_name5 = '${tbinfo.chart_name5}'; // 左图对应的name
	var <portlet:namespace />chart_id5 = '${tbinfo.chart_id5}'; // 左图对应的id
	var <portlet:namespace />chart_ispd5 = '${tbinfo.chart_ispd5}'; // 左图对应的ispd
	var <portlet:namespace />chart_name6 = '${tbinfo.chart_name6}'; // 右图对应的name
	var <portlet:namespace />chart_id6 = '${tbinfo.chart_id6}'; // 右图对应的id
	var <portlet:namespace />chart_ispd6 = '${tbinfo.chart_ispd6}'; // 右图对应的ispd
	var <portlet:namespace />times3 =  [];//根据所选name的个数来保存相应时间
	var <portlet:namespace />series_count3 = '${tbinfo.chart_name5}';
	var <portlet:namespace />series_total3 = <portlet:namespace />series_count3.split(",");//保存每组图表的数据列
	var <portlet:namespace />legend_count3 = <portlet:namespace />chartLegends5.split(",").length;//保存图例说明已配置的个数 
	var <portlet:namespace />end_date3 = ''; //结束时间  
	var <portlet:namespace />loadChart3 = 0; //记录图表视图加载次数 
	var <portlet:namespace />loadTable3 = 0; //记录表格视图加载次数
	
	// 监听select标签的改变事件
	$('#<portlet:namespace />format_select3').change(function() {
		<portlet:namespace />choose_type3 = $('#<portlet:namespace />format_select3').val();
	});
	
	// 选择时间（日、周、月、年）
	function <portlet:namespace />selectdate3(){
		var type = <portlet:namespace />choose_type3;
		var dformt = 'yyyy-MM-dd',titleFormt = 'yyyy-MM-dd';
		if (type == "day") {
			dformt = 'yyyy-MM-dd';
			<portlet:namespace />step3 = "${tbinfo.xStep}";
		} else if (type == "week") {
			dformt = 'yyyy-MM-dd';
			<portlet:namespace />step3 = "1x";
		} else if (type == "month") {
			dformt = 'MM';
			<portlet:namespace />step3 = "${tbinfo.xStep}";
			titleFormt = 'yyyy-MM';
		} else if (type == "year") {
			dformt = 'yyyy';
			<portlet:namespace />step3 = "1";
			titleFormt = 'yyyy';//标题格式
		}

		WdatePicker({
			el : '<portlet:namespace />datetime3',
			dateFmt : dformt,
			onpicked : function(dp) {
				var showtime = dp.cal.getDateStr(dformt);
				var hidetime = dp.cal.getDateStr('yyyy-MM-dd');
				/* <portlet:namespace />c_title3 = dp.cal.getDateStr('yyyy'); //获取年份信息 */
				/* <portlet:namespace />centerTitle3 = dp.cal.getDateStr(titleFormt);//保存居中标题 */
				// 周报的开始时间和结束时间需要做特殊处理 
				if (type == "week") {
					$('#<portlet:namespace />from_date3').val(showWeekFirstDay(showtime));
					$('#<portlet:namespace />to_date3').val(showWeekLastDay(showtime));
				} else {
					$('#<portlet:namespace />from_date3').val(showtime);
					$('#<portlet:namespace />to_date3').val(showtime);
				}
				<portlet:namespace />start_date3 = hidetime; // 设置开始时间
				<portlet:namespace />end_date3 = $('#<portlet:namespace />to_date3').val(); // 设置结束时间 
				<portlet:namespace />times3.length = 0; //清空<portlet:namespace />times3
				// 根据name的个数，来为att添加对应个数的值
				for(var i=0;i<<portlet:namespace />series_total3.length;i++){
					<portlet:namespace />times3.push(<portlet:namespace />start_date3);
				}
				//获取左图name,id,ispd信息
				<portlet:namespace />chart_name5 = '${tbinfo.chart_name5}';
				<portlet:namespace />chart_id5 = '${tbinfo.chart_id5}';
				<portlet:namespace />chart_ispd5 = '${tbinfo.chart_ispd5}';
				
				//获取右图name,id,ispd信息
				<portlet:namespace />chart_name6 = '${tbinfo.chart_name6}'; // 对应的name
				<portlet:namespace />chart_id6 = '${tbinfo.chart_id6}'; // 对应的id
				<portlet:namespace />chart_ispd6 = '${tbinfo.chart_ispd6}'; // 对应的ispd
				
			}
		});
	}

	// 为选择的类型赋值 
	<portlet:namespace />choose_type3 = $('#<portlet:namespace />format_select3').val();
	
	/**
	 * 异步获取左图表数据
	 */
	function <portlet:namespace />getLeftChart3(tfrom,name,id,ispd,legendList) {
		$
			.post(
					'<portlet:resourceURL id="getCommonChartData"></portlet:resourceURL>',
					{
						from : tfrom,
						name : name,
						id : id,
						ispd : ispd,
						decimals : '${tbinfo.decimals}',
						type : <portlet:namespace />choose_type3
					}, function(data) {
						var newLegendList = [];//用来存储图例说明数据
						var chartLegends = "${tbinfo.chartLegends5}";//配置项中的图例名称信息
						var chartLegendList = chartLegends.split(",");//配置项中的图例名称信息
						var cataList = [];
						var dataList = data.dataList;
						var len = data.cataList.length;
												
						if (<portlet:namespace />choose_type3 == "day"){
							//为每个选定name的图表添加对应图例说明名称
							for(var i=0;i<parseInt(<portlet:namespace />series_total3.length);i++){
								//根据已配置的图例名称对被比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
								if(<portlet:namespace />legend_count3>i){
									newLegendList.push(chartLegendList[i]);
								}else{
									newLegendList.push("series" + (i+1));
								}
							}
							for(var j = 0;j<len;j++){
								cataList.push(j);
							}
						} else if (<portlet:namespace />choose_type3 == "week") {
							var cList = ["周一","周二","周三","周四","周五","周六","周日"];
							for(var i=0;i<parseInt(<portlet:namespace />series_total3.length);i++){
								//根据已配置的图例名称进行赋值,未定义图例名称则默认给定series[n]样式名称
								if(parseInt(<portlet:namespace />legend_count3)>i){
									newLegendList.push(chartLegendList[i]);
								}else{
									newLegendList.push("series" + (i+1));
								}
							}
							cataList = cList;
						} else if (<portlet:namespace />choose_type3 == "month") {
							//为每个选定name的图表添加对应图例说明名称
							for(var i=0;i<parseInt(<portlet:namespace />series_total3.length);i++){
								//根据已配置的图例名称对被比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
								if(parseInt(<portlet:namespace />legend_count3)>i){
									newLegendList.push(chartLegendList[i]);
								}else{
									newLegendList.push("series" + (i+1));
								}	
							}
							for(var j = 1;j<=len;j++){
								cataList.push(j);
							}
						} else if (<portlet:namespace />choose_type3 == "year") {
							//为每个选定name的图表添加对应图例说明名称
							for(var i=0;i<parseInt(<portlet:namespace />series_total3.length);i++){
							//根据已配置的图例名称对被比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
							if(parseInt(<portlet:namespace />legend_count3)>i){
								newLegendList.push(chartLegendList[i]);
							}else{
								newLegendList.push( "series" + (i+1));
							}
							cataList = data.yearList[0];// 获取月份信息
						}
					}
					// 渲染图表			
					var chartLegendList = newLegendList//保存图例说明信息
					var chartColor_3 = "${tbinfo.chartColors5}";//颜色列表
					var chartColorList = chartColor_3.split(",");
					var chartFillColor_3 = "${tbinfo.c_fillColors}"; // 填充颜色列表
					var chartFillColorList = chartFillColor_3.split(",");
					var chartRadius_3 = "${tbinfo.radiusList}"; // 曲线点半径列表,默认为1
					var chartRadiusList = chartRadius_3.split(",");
					var chartSymbolList = "${tbinfo.ySymbol3}"; // Y轴单位
					var chartYAxisList = [${tbinfo.yAxisList}];//Y轴数据列表
					if(<portlet:namespace />series_total3.length>1){
						<portlet:namespace />showLegend3 = true;
					}
					//该方法写在\tomcat-6.0.29\webapps\ROOT\html\company\scripts目录下的autoRenderToCharts.js中，用来生成图表
					autoRenderToMoreCharts("<portlet:namespace />consumptionLeft3",// 对应的渲染位置 
							"${tbinfo.chartType1},${tbinfo.chartType2}",//图表类型
							"${tbinfo.c_bgColor}",//图表绘图区域背景颜色
							<portlet:namespace />series_total3.length,//获取选取name的个数
							<portlet:namespace />step3,//X轴间隔
							<portlet:namespace />centerTitle3,// 居中标题
							"${tbinfo.gridLineStyle}",//图表中线的样式
							"${tbinfo.symbol3}", // 曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
							"${tbinfo.lineWidth}", // 线宽，此为具体曲线点的点线宽
							"${tbinfo.connLineWidth}", // 连接线线宽，为空则默认为2，为0则不显示连接线										
							"${tbinfo.yLeftTitle3}",//Y轴左侧标题
							"${tbinfo.yRightTitle3}",//Y轴右侧标题
							<portlet:namespace />showLegend3,//是否显示图例说明
							"${tbinfo.showXGridLine}",//是否显示X轴网格线
							"${tbinfo.showYGridLine}",//是否显示Y轴网格线
							chartLegendList,//图例说明
							chartColorList, //颜色列表
							dataList,//数据列表
							chartFillColorList,//填充颜色列表
							chartRadiusList,//曲线点半径列表
							chartSymbolList, //Y轴单位
							chartYAxisList,//Y轴数据列表
							cataList);//X轴数据信息
		}, 'json');
	}
		/**
		 * 异步获取右图表数据
		 */
		function <portlet:namespace />getRightChart3(tfrom,name,id,ispd) {
			$
			.post(
					'<portlet:resourceURL id="getMoreChartsByNames"></portlet:resourceURL>',
					{
						from : tfrom,
						name : name,
						id : id,
						ispd : ispd,
						type : <portlet:namespace />choose_type3,
						decimals : '${tbinfo.decimals}',// 保留小数位数
						att : 'percents',
						mult : '${tbinfo.form_mul}' // 是否需要在获取的数据的基础上乘数，饼图需乘100，在首选项中配置
					}, function(data) {
						var dataList = data.dataList;
						// 为建筑用电分项报表填充数据
						var categories = [${tbinfo.chartLegends6} ], colorsArr = [${tbinfo.chartColors6}];
						var pieDataList = [];
						for(var i=0;i<dataList.length;i++){
							pieDataList.push(dataList[i][0]);
						}
						//该方法写在\tomcat-6.0.29\webapps\ROOT\html\company\scripts目录下的autoRenderToCharts.js中，用来生成图表
						autoRenderToPieChart('<portlet:namespace />consumptionRight3', //图表渲染位置
								"${tbinfo.chartType3}", // 右图图表类型
			           			"${tbinfo.c_bgColor}",//右图背景颜色，默认为#394264
								"${tbinfo.chartTitle6}",//图表标题
								"${tbinfo.innerSize3}"+"%",//内环大小，按百分比计算
			           			categories,//数据列的名称列表 
			           			colorsArr, //数据列的颜色列表 
			           			pieDataList, //图表数据
			           			${tbinfo.showLegend},//是否显示图例说明，默认是true
			           			"${tbinfo.legendWidth}",//图例说明区域宽度，默认为80
			           			"${tbinfo.legendLayout3}",//图例说明内容的布局是水平horizontal或垂直vertical
								"${tbinfo.legendAlign3}",//图例说明的对齐方式（left/center/right）
								"${tbinfo.distance}",//图表中说明标签与图表之间的间距,默认为10
								"${tbinfo.connLineWidth}",//连接线宽度
								"${tbinfo.wordColor}");//图表中文字的颜色		
					}, 'json');
		}
		
		// 获取报表视图数据
		function <portlet:namespace />getForm3(){
			$.post(
					'<portlet:resourceURL id="getReportDataList"></portlet:resourceURL>',
					{
						from:<portlet:namespace />start_date3, // 设置开始时间
						to:<portlet:namespace />end_date3,	// 设置结束时间
						type:<portlet:namespace />choose_type3, // 设置选择类型
						decimals:'${tbinfo.decimals}',	// 设置小数位数
						name:'${tbinfo.form_name3}', //设置name
						id:'${tbinfo.form_id3}', // 设置id						
						ispd:'${tbinfo.form_ispd3}', // 设置ispd
						curPage:1,	// 当前页数
						size:7	// 每页显示条数
					},function(data){
						var showCataList = data.showCataList; // 保存表头信息
						var showDataList = data.showDataList; // 保存内容数据
						// 生成表格
						var html = "<table><thead>"; 
						var firstRow = "<tr><th>日期</th>"; // 表头信息部分
						var content = ""; // 表格内容部分
						
						var commonColumnList = [] ; // 公共列信息
						commonColumnList.push(${tbinfo.commonColumn3});
			
						if(<portlet:namespace />choose_type3 == "day"){
							firstRow += '<th>${tbinfo.dayColumn}</th>';
						}
						var times = 5;
						if(commonColumnList.length>=5){
							if(<portlet:namespace />choose_type3 == "day"){
								times = 4;
							}
						}else{
							times = commonColumnList.length;
						}
						//循环添加内容数据
						for(var i = 0 ;i<showCataList[0].length;i++){
							content +="<tr>" + (<portlet:namespace />choose_type3 == "day"?("<td>" + <portlet:namespace />start_date3 + "</td>"):"") + "<td>" + showCataList[0][i] + "</td>";
							for(var j = 0;j<times;j++){
								content += '<td>'+ (showDataList[j][i] != undefined ? showDataList[j][i] : '') 
									+'</td>';
							}
							content +="</tr>";
						}
						//添加表头信息
						for(var i = 0;i<times;i++){
							firstRow += '<th>'+(commonColumnList[i] != undefined ? commonColumnList[i] : '')+'</th>';					
						}
						firstRow += '</tr>';
						html = html + firstRow + "</thead>"+ content;
						html += '</table><div class="zoom_mask" onclick = "<portlet:namespace />zoomax(\'${tbinfo.form_name3}\',\'${tbinfo.form_id3}\',\'${tbinfo.form_ispd3}\',\''
								+<portlet:namespace />start_date3+'\',\''+$('#<portlet:namespace />from_date3').val()+'\',\''
								+$('#<portlet:namespace />to_date3').val()+'\',\''+<portlet:namespace />choose_type3+'\',\'${tbinfo.decimals}\',\''
								+commonColumnList+'\',\'${tbinfo.dayColumn}\',\'${tbinfo.form_mul}\',this)"><div class="magnify"></div></div>';
						$('#<portlet:namespace />form3').html("");
						$('#<portlet:namespace />form3').html(html);
					},'json');
		}
		
		$(function() {
			// 判断是否显示建筑下拉列表
			var showBuild = "${tbinfo.showLegendForm}";
			if(showBuild == "show"){
				$("#<portlet:namespace />choose_build3").show(); // 显示选择建筑项
			}else{ 
				$("#<portlet:namespace />choose_build3").hide(); // 隐藏选择建筑项
			}
			//调用图表加载方法，加载相应图表数据
			<portlet:namespace />loadData3();
		})

		/**
		* 加入对比后，获取图表数据
		*/
		function <portlet:namespace />confirm3(){
			// 渲染左侧图表
			<portlet:namespace />getLeftChart3(<portlet:namespace />times3.join(),<portlet:namespace />chart_name5,<portlet:namespace />chart_id5,<portlet:namespace />chart_ispd5,<portlet:namespace />chartLegends5);
			// 渲染右侧图表
			<portlet:namespace />getRightChart3(<portlet:namespace />start_date3,<portlet:namespace />chart_name6,<portlet:namespace />chart_id6,<portlet:namespace />chart_ispd6);
			// 获取网格数据
			<portlet:namespace />getForm3();
		}	
		
		//加载相应视图数据
		function <portlet:namespace />loadData3(){
			//根据所选视图类型加载相应视图内容
			if($("#<portlet:namespace />table_chart_switch div:eq(0)").hasClass("btn_press")){
				if(<portlet:namespace />loadChart3 == 0){
					// 得到报表数据
					<portlet:namespace />getLeftChart3(<portlet:namespace />times3.join(),<portlet:namespace />chart_name5,
							<portlet:namespace />chart_id5,<portlet:namespace />chart_ispd5,<portlet:namespace />chartLegends5);
					// 渲染右侧图表
					<portlet:namespace />getRightChart3(<portlet:namespace />start_date3,<portlet:namespace />chart_name6,
							<portlet:namespace />chart_id6,<portlet:namespace />chart_ispd6);
					<portlet:namespace />loadChart3 = 1;
				}
			}else{
				if(<portlet:namespace />loadTable3 ==0){
					// 渲染网格视图
					<portlet:namespace />getForm3();
					<portlet:namespace />loadTable3 = 1;
				}
			}
		}
		
		// 导出数据到excel
		function <portlet:namespace />expToExcel3(){
			if($("#<portlet:namespace />table_chart_switch div:eq(0)").hasClass("btn_press")){
				console.log("dddddd");
			}else{
				// 导出excel的Url
				var expUrl = "<portlet:resourceURL id='expDataToExcel'></portlet:resourceURL>"
						+ "&name="
						+ '${tbinfo.form_name3}'
						+ "&id="
						+ '${tbinfo.form_id3}'
						+ "&ispd="
						+ '${tbinfo.form_ispd3}'
						+ "&from="
						+ <portlet:namespace />start_date3
						+ "&to="
						+ <portlet:namespace />end_date3
						+ "&type="
						+ <portlet:namespace />choose_type3
						+ "&decimals="
						+ '${tbinfo.decimals}'
						+ "&multip="
						+ '${tbinfo.form_mul}'
						+ "&dayColumn="
						+ '${tbinfo.dayColumn}'
						+ "&commonColumn="
						+ "${tbinfo.commonColumn3}"
						;
				var hSrc = "http://" + document.location.host
						+ "/energymanagesystem/uploadfiles/" + "${tbinfo.formTitle}"
						+ ".xls";
				$.ajax({
					type : "POST",
					url : expUrl,
					async : false,
					contentType : 'application/x-msdownload;charset=UTF-8',
					success : function(result) {
						$("#<portlet:namespace />tmpFrame").attr('src', hSrc);

					},
					error : function(result) {
						alert('error');
					}
				});
			}
		}
		
		// 默认显示当前时间
		<portlet:namespace />choose_type3 = "day";
		if(publicTime != ""){
			<portlet:namespace />start_date3 = publicTime;
		} else {
			if("${tbinfo.defaultTime}" == ""){
				var nowdate = new Date();
				<portlet:namespace />start_date3 = nowdate.getFullYear() + "-" + (nowdate.getMonth()+1) + "-"
						+ nowdate.getDate();
			} else {
				<portlet:namespace />start_date3 = "${tbinfo.defaultTime}";
			}
		}
		// 设置日期输入框的默认值 
		$('#<portlet:namespace />from_date3').val(<portlet:namespace />start_date3);
		$('#<portlet:namespace />to_date3').val(<portlet:namespace />start_date3);
		<portlet:namespace />end_date3 = <portlet:namespace />start_date3; //设置结束时间的默认值 
		/* <portlet:namespace />centerTitle3 = <portlet:namespace />start_date3; // 初始化图表标题 */
		// 根据name的个数，来为att添加对应个数的值
		 for(var i=0;i<<portlet:namespace />series_total3.length;i++){
			<portlet:namespace />times3.push(<portlet:namespace />start_date3);
		} 
		
		//根据配置显示相应视图内容
		$(".<portlet:namespace/>showContent3:eq("+ ${tbinfo.chooseView} +")").show();
</script>