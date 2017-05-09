<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<SCRIPT src="${ctx}/static/js/pdfobject.js" type="text/javascript"></SCRIPT>
    <title>图片展示</title>
    <meta name="decorator" content="default" />
</head>

<body>
<table>
<div id="pdfview">${bridge.attachments}
        <c:forEach items="${bridge.attachments}" var="id" varStatus="i">
            <c:if test="${(i.index)%3==0}">
                <tr>
            </c:if>
                <td>
                 ${id}
                    <img style="margin: 5px" src="${ctx}/sys/attachment/download?id=${id}"
                         onload='if (this.width>140 || this.height>226) if (this.width/this.height>140/226) this.width=140; else this.height=226;' />
                </td>
             <c:if test="${(i.index+1)%3==0}">
                </tr>
             </c:if>
        </c:forEach>
    </table>
 

</body>
</html>