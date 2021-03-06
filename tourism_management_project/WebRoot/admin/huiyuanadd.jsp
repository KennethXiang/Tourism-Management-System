﻿<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@ page import="com.daowen.bll.*"%>
<%@ page import="com.daowen.entity.*" %>
<%@page import="com.daowen.dal.DALBase"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>会员</title>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script  type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/messages_cn.js" ></script>
	    <link href="<%=SystemParam.getSiteRoot() %>/webui/easydropdown/themes/easydropdown.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/easydropdown/jquery.easydropdown.js" type="text/javascript"></script>    
    <link href="<%=SystemParam.getSiteRoot() %>/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
    <script src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript">
        function initControl(){
	  //开始绑定
                    //结束绑定
			           $('#btnulTouxiang').uploadify({  
			                //向后台传递的参数 
			                'formData': { 'folder': '<%=SystemParam.getSiteRoot()%>/Upload' }, 
			                'buttonText': '选择图片', //设置按钮文本 
			                'buttonClass': 'browser',  
			                'removeCompleted': true,  //上传完成后是否删除队列中的对应元素
			                'swf': '<%=SystemParam.getSiteRoot()%>/uploadifyv3.1/uploadify.swf', 
			                'fileTypeExts':"*.jpg;*.gif;*.png;",//限制允许上传图片的后缀
			                'auto':true, //开启自动上传
			                'removeTimeout':0,//文件列队上传完成0秒后删除
			                'debug': false,  
			                'height': 15,  
			                'width':90,  
			                'uploader': '<%=SystemParam.getSiteRoot()%>/admin/uploadmanager.do',
			                 'fileSizelimit':'2048KB',//限制上传的图片不得超过2048kb
			                 'queueSizelimit':'5',
			                 'onUploadSuccess':function(file, data, response){//每次成功上传后执行的回调函数，从服务端返回数据到前端
			                     $("#filelist").show();
			                     $("#imgTouxiang").attr("src","<%=SystemParam.getSiteRoot()%>/upload/temp/"+file.name);
                                 $("#hidTouxiang").val("<%=SystemParam.getSiteRoot()%>/upload/temp/"+file.name);
			                  }
			             }); 
			          var imgtouxiangsrc="${requestScope.huiyuan.touxiang}";
				       if(imgtouxiangsrc==""){
				         var url="<%=SystemParam.getSiteRoot()%>/upload/nopic.jpg";
				         $("#imgTouxiang").attr("src",url);
				         $("#hidTouxiang").val(url);
				       }else
				       {
				          $("#imgTouxiang").attr("src",imgtouxiangsrc);
				          $("#hidTouxiang").val(imgtouxiangsrc); 
				       }
                      $("#txtRegdate").datepicker({
                         dateFormat:'yy-mm-dd'
                      }).datepicker("setDate",new Date());
			            editor = KindEditor.create('textarea[name="des"]', {
			            uploadJson : '../plusin/upload_json.jsp',
				        fileManagerJson : '../plusin/file_manager_json.jsp',
			            resizeType: 1,
				        allowFileManager: true
				       });
                   //开始绑定
		              /* $("#loudong").change(function(){
			        	      $("[name=name]").val($("#loudong option:selected").text());
			               })*/
                    //结束绑定
                      $("#txtRzdate").datepicker({
                         dateFormat:'yy-mm-dd'
                      }).datepicker("setDate",new Date());
        }
        $(function ()
        {
            initControl();
            $.metadata.setType("attr","validate");
            $("#huiyuanForm").validate();
        });  
    </script>
</head>
<body>
	<div class="search-title">
		<h2>录入业主</h2>
		<div class="description"></div>
	</div>
	<form name="huiyuanform" method="post"
		action="<%=SystemParam.getSiteRoot()%>/admin/huiyuanmanager.do"
		id="huiyuanForm">
		<table class="grid" cellspacing="1" width="100%">
			<input type="hidden" name="id" value="${id}" />
			<input type="hidden" name="actiontype" value="${actiontype}" />
			<input type="hidden" name="seedid" value="${seedid}" />
			<input type="hidden" name="errorurl" value="/admin/huiyuanadd.jsp" />
			<input type="hidden" name="forwardurl"
				value="/admin/huiyuanmanager.do?actiontype=get&forwardurl=/admin/huiyuanmanager.jsp" />
			<tr>
				<td colspan="4">${errormsg}</td>
			</tr>
			<tr>
				<td align="right">账户名:</td>
				<td><input name="accountname" placeholder="账户名"
					validate="{required:true,messages:{required:'请输入账户名'}}"
					value="${requestScope.huiyuan.accountname}" class="input-txt"
					type="text" id="txtAccountname" /></td>
				<td  colspan="2" rowspan="6"><img id="imgTouxiang" width="200px" height="200px"
					src="${requestScope.huiyuan.touxiang}" />
					<div>
						<input type="file" name="upload" id="btnulTouxiang" />
					</div> <input type="hidden" id="hidTouxiang" name="touxiang"
					value="${requestScope.huiyuan.touxiang}" /></td>
			</tr>
			<tr>
				<td align="right">姓名:</td>
				<td><input name="name" placeholder="姓名"
					validate="{required:true,messages:{required:'请输入姓名'}}"
					value="${requestScope.huiyuan.name}" class="input-txt" type="text"
					id="txtName" /></td>
			</tr>
			<tr>
				<td align="right">性别:</td>
				<td><select name="sex" id="ddlSex" class="dropdown">
						<option value="男">男</option>
						<option value="女">女</option>
				</select></td>
			</tr>
			<tr>
				<td align="right">邮箱:</td>
				<td><input name="email" placeholder="邮箱"
					validate="{required:true,messages:{required:'请输入邮箱'}}"
					value="${requestScope.huiyuan.email}" class="input-txt" type="text"
					id="txtEmail" /></td>
			</tr>
			
			<tr>
				<td align="right">楼栋:</td>
				<td><web:dropdownlist name="loudong" id="loudong"
						cssclass="dropdown" value="${requestScope.huiyuan.loudong}"
						datasource="${loudong_datasource}" textfieldname="name"
						valuefieldname="name">
					</web:dropdownlist> 
				</td>
			</tr>
			<tr>
				<td align="right">单元:</td>
				<td><input name="unit" placeholder="单元"
					validate="{required:true,messages:{required:'请输入单元'}}"
					value="${requestScope.huiyuan.unit}" class="input-txt" type="text"
					id="txtUnit" /></td>
			</tr>
			<tr>
				<td align="right">联系电话:</td>
				<td><input name="mobile" placeholder="联系电话"
					validate="{required:true,messages:{required:'请输入联系电话'}}"
					value="${requestScope.huiyuan.mobile}" class="input-txt"
					type="text" id="txtMobile" /></td>
			
				<td align="right">入住时间:</td>
				<td><input name="rzdate" value="${requestScope.huiyuan.rzdate}"
					type="text" id="txtRzdate" class="input-txt"
					validate="{required:true}" /></td>
			</tr>
			<tr>
				<td align="right">地址:</td>
				<td><input name="address" placeholder="地址"
					validate="{required:true,messages:{required:'请输入地址'}}"
					value="${requestScope.huiyuan.address}" class="input-txt"
					type="text" id="txtAddress" /></td>
			
				<td align="right">职业:</td>
				<td><input name="zhiye" placeholder="职业"
					validate="{required:true,messages:{required:'请输入职业'}}"
					value="${requestScope.huiyuan.zhiye}" class="input-txt" type="text"
					id="txtZhiye" /></td>
			</tr>
			<tr>
				<td align="right">会员说明:</td>
				<td colspan="3"><textarea name="des" id="txtDes"
						style="width:98%;height:200px;">${requestScope.huiyuan.des}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<div class="ui-button">
						<button class="ui-button-text">
							<i class="icon-ok icon-white"></i>提交
						</button>
					</div></td>
			</tr>
		</table>
	</form>
</body>
</html>
