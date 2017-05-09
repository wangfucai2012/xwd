/****************************************/
/********             ictweb               *******/
/******** 从广州地铁项目开始用的 *******/
/********          2014/03/04          *******/
/****************************************/

/**
 * 全选/清除多选框
 */
function selcheck() {
	var checkBox = document.getElementById("selectAll");

	var chenkB = document.getElementsByName("objectId");

	if (checkBox.checked == true) {
		for (var i = 0; i < chenkB.length; i++) {
			chenkB[i].checked = true;
		}
	} else {
		for (var i = 0; i < chenkB.length; i++) {
			chenkB[i].checked = false;
		}
	}
}

/**
 * 获取选中的记录IDS
 */
function assembleDeleteId() {
	var result = "";
	var objectId = document.getElementsByName("objectId");
	for (var i = 0; i < objectId.length; i++) {
		if (objectId[i].checked == true) {
			result = result + objectId[i].value;
			if (i < objectId.length - 1)
				result = result + ",";
		}
	}
	rowid = result;
}

/**
 * 此方法获取页面选中checkbox中的对象IDS
 */
function checkboxIds() {
	var result = "";
	var objectId = document.getElementsByName("objectId");
	for (i = 0; i < objectId.length; i++) {
		if (objectId[i].checked == true) {
			result = result + objectId[i].value + ",";
		}
	}
	return result;
}
/**
 * 此方法判断获取到的ID是否为空
 */
function blankId(rowid) {
	if (rowid == "") {
		alert("请选择要操作的数据");
		return false;
	}
	return true;

}
/**
 * 此方法判断获取到的ID是否选中一条
 */
function oneId(rowid) {

	var n = rowid.split(',');
	var sl = n.length - 1;
	if (sl > 1) {
		alert("此操作只能选择一条数据,您已选择了\"" + sl + "\"条!");
		return false;
	}
	return true;
}
/**
 * 此方法是删除确认提示
 */
function deletevalid() {
	if (window.confirm("您确认要删选中的数据吗?"))
		return true;
	else
		return false;
}
/**
 * 此方法是修改确认提示
 */
function endvalid() {
	if (window.confirm("您确认要结束选中的数据吗?"))
		return true;
	else
		return false;
}
/**
 * 此方法是删除附件提示、用于每个编辑页面附件使用
 */
function delAttach() {
	if (window.confirm("您确认要删选此附件吗?"))
		return true;
	else
		return false;
}
// 多选删除操作
function deleteMutliData(returnurl) {
	var result = checkboxIds();
	if (blankId(result)) {
		var returnpath = returnurl + "?assembleDelId=" + result;
		confirmx('确认要删除所选数据吗？', returnpath);
	}
	return false;
}
//多选删除操作
function deleteMutliDataUrl(returnurl) {
	var result = checkboxIds();
	if (blankId(result)) {
		var returnpath = returnurl + "&assembleDelId=" + result;
		confirmx('确认要删除所选数据吗？', returnpath);
	}
	return false;
}

//zhuwei 2015-05-29 添加 
//多选删除操作
function deleteMutliDataWithParams(returnurl,params) {
	var result = checkboxIds();
	if (blankId(result)) {
		var returnpath = returnurl + "?assembleDelId=" + result+"&"+params;
		confirmx('确认要删除所选数据吗？', returnpath);
	}
	return false;
}

//daliu
function jsSelectItemByValue(objSelect, objItemVal) 
{            
    //判断是否存在        
    for (var i = 0; i < objSelect.options.length; i++) 
    {        
        if (objSelect.options[i].value == objItemVal) 
        {        
            objSelect.options[i].selected = true;        
            break;        
        }      
    }  
}
