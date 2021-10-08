<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2021/7/13
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <!-- 支持移动设备优先 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert title here</title>
    <!-- 引入bootStrap的csss样式 -->
    <link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <!-- 导入jQuery资源 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
    <!-- 导入bootStrap的js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <title>主页</title>

    <script type="text/javascript">
        function shanChu(id) {
            if(confirm("确定要删除吗？")){
                location.href="/ssm_3_zhengHe/cstlinkman/delectCstlink.action?id="+id;
            }
        }
    </script>
</head>
<body>
    <form method="post" action="/ssm_3_zhengHe/cstlinkman/selectCstlinkPage.action">
        <table width="90%" border="1px solid red">
            <tr>
                <td> <input type="text" name="custName" placeholder="请输入客户名称"  class="form-control"></td>
                <td><select name="">

                </select></td>
                <td><input type="submit" value="搜索" class="btn btn-info"></td>
            </tr>
            <tr>
                <td>编号</td>
                <td>名称</td>
                <td>性别</td>
                <td>手机</td>
                <td>邮件</td>
                <td>QQ</td>
                <td>等级</td>
                <td>地址</td>
                <td>文件</td>
                <td>操作</td>
            </tr>
            <%--Linkman需要保存到PageInfo<>方法list集合里面--%>
            <c:forEach items="${Linkman.list}" var="link" varStatus="vs">
                <tr>
                    <td>${vs.count}</td>
                    <td>${link.lkmName}</td>
                    <td>${link.lkmGender}</td>
                    <td>${link.lkmPhone}</td>
                    <td>${link.lkmEmail}</td>
                    <td>${link.lkmQq}</td>
                    <td>${link.lkmPosition}</td>
                    <td>${link.lkmMemo}</td>
                    <td>${link.lkmPic}</td>
                    <td>
                        <a href="#" onclick="shanChu(${link.lkmId})">删除</a>
                        <a href="/ssm_3_zhengHe/cstlinkman/selectCstlinkById.action?id=${link.lkmId}">修改</a>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td>
                    <a href="/ssm_3_zhengHe/tianJia.jsp">添加</a>
                </td>
            </tr>
        </table>


                <center>

                        <c:if test="${!Linkman.isFirstPage}">

                            <a href="/ssm_3_zhengHe/cstlinkman/selectCstlinkPage.action?indexPage=1&<%--lkmName=${name}--%>">首页</a>
                            <a href="/ssm_3_zhengHe/cstlinkman/selectCstlinkPage.action?indexPage=${Linkman.isFirstPage }<%--&lkmName=${name}--%>">&laquo;</a>


                        </c:if>
                        <c:if test="${Linkman.isFirstPage}">

                            <a href="#" >首页</a>
                            <a href="#" >&laquo;</a>
                        </c:if>
                        <!--
                        begin  从哪里开始  起始值
                        end    到那结束      末位置
                        var    定义一个变量保存当前值
                        step   步长
                         -->
                        <c:forEach begin="1" end="${Linkman.lastPage}" var="i" step="1">
                            <%--<c:forEach items="${Linkman.navigatepageNums}" var="i">--%>
                            <a style="text-decoration: none" href="/ssm_3_zhengHe/cstlinkman/selectCstlinkPage.action?indexPage=${i}&lkmName=${name}">
                                    ${i}
                            </a>
                        </c:forEach>

                        <c:if test="${!Linkman.isLastPage}">
                            <a href="/ssm_3_zhengHe/cstlinkman/selectCstlinkPage.action?indexPage=${Linkman.pageNum + 1 }&lkmName=${name}">&raquo;</a>
                            <a href="/ssm_3_zhengHe/cstlinkman/selectCstlinkPage.action?indexPage=${Linkman.pageSize}&lkmName=${name}">尾页</a>
                        </c:if>
                        <c:if test="${Linkman.isLastPage}">
                           <a href="#" >&raquo;</a>
                           <a href="#" >尾页</a>
                        </c:if>
                        <span>共 ${Linkman.pageSize}页/第${Linkman.pageNum} 页</span>


                </center>

    </form>
</body>
</html>
