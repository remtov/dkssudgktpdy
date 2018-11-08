
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="${skyPath}/dhtmlx.css" />

<script>
	var data = [ {
		uinum : 1,
		uilevel : '3',
		uiname : 'test',
		uidesc : 'testdata'
	} ];
	var dxGrid;
	function doInit() {
		dxGrid = new dhtmlXGridObject('dxGrid');
		dxGrid.setImagePath('${skyPath}/imgs');
		dxGrid.setHeader('번호,레벨,이름,설명');
		dxGrid.setColumnIds('uinum,uilevel,uiname,uidesc');
		dxGrid.setColTypes('ro,ed,ed,ed');
		dxGrid.init();
		var xhr = new XMLHttpRequest();
		xhr.open('GET', '/users', true);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == xhr.DONE) {
				if (xhr.status == 200) {

					var data = JSON.parse(xhr.responseText);
					dxGrid.parse(data, 'js');

				}
			}
		}
		xhr.send();

		alert(2);
		dhx.ajax.get('/users', function(res) {
			res = JSON.parse(res.xmlDoc.responseText);
			dxGrid.parse(res, 'js');
		})

		dxGrid.attachEvent('onEditCell', function(stage, rId, cInd, nValue,
				oValue) {
			if (nValue != oValue) {
				var rData = dxGrid.getRowData(rId);
				rData = JSON.stringify(rData);
				dhx.ajax.put('/userinfos', rData, function(res) {
					res = JSON.parse(res);
					alert(res);
				})
			}

			if (stage == 2) {
				console.log(rId);
				console.log(cInd);
				console.log(nValue);
				console.log(oValue);
				return true;
			}
		})
	}
	window.addEventListener('load', doInit);
</script>
</head>
<body>
	<div id="dxGrid" style="width: 400px; height: 300px;"></div>
</body>
</html>