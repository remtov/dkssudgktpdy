
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<style>
#lay{
width:100%;
height:100%;
margin:auto 0px;
}
</style>
<script>
window.addEventListener('load',doInit);
function doInit(){
	var dxLay;
	var conf={parent:'lay',
		pattern:'4H',
		cells:[
			{id:"a",text:"Left",fix_size:[true,null]},
			{id:"b",text:"middle top"},
			{id:"c",text:"middle bottom"},
			{id:"d",text:"Right"}
		]
	
	};
	
	dxLay =new dhtmlXLayoutObject(conf);
	dxLay.attachEvent('onDblClick',function(id){
		/*이벤트를 붙여서  onDbClick은 더블클릭 */
		alert(id);
	});
	
}
</script>
	

</head>
<body>
<div id="lay"></div>
</body>
</html>