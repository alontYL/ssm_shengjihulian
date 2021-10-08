<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2021/7/13
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加</title>
    <%--导入jqurey库--%>
    <script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript">
        //页面加载
        $(function () {
            var url = "/province/loadAll.action"
            var params =null;
            //获取省份列表
            var prvoni = $("[name=\"prvice\"]");
            $.post(
                url,
                params,
                function (pro) {
                    $(pro).each(function (index,dom) {
                        prvoni.append("<option value='"+dom.provinceid+"'>"+dom.name+"</option>")
                    })
                },
                "json"
            )
        })

        $(function () {
            checkCity(null);
        })

        function checkCity(obj) {
            if(obj==null){
                var cityIdObj=1;
                var nane="北京";
            }else{
            //获取省份的编号
            var cityIdObj = obj.value;
            //获取省的名称
            var nane = obj[cityIdObj-1].innerHTML;
            }
            var url = "/city/cityAllController.action";
            var params ={"cityId":cityIdObj};
            //获取下拉列表
            var cityname = $("[name=\"citys\"]")
            cityname.empty();
            $.get(
                url,
                params,
                function (data) {
                    $(data).each(function (index,dom) {
                        cityname.append("<option>"+dom.name+"</option>")
                    })
                },
                "json"
            )
        }



        function checkNames() {
            //获取输入框的值
            var name = $("[name=\"lkmName\"]").val();
            alert(name);
            var url = "/ssm_3_zhengHe/cstlinkman/checkName.action";
            var params = {"lkmName":name};
            //获取提示框位置
            var nameMsg = $("#cusNameMsg");
            if(name == null || name.trim() == ""){//trim()去空格
                nameMsg.html("用户名不能为空");
            }else{
                $.post(
                    url,
                    params,
                    function (data) {
                        alert(data)
                        if("n"==data){
                            nameMsg.html("用户名已存在，请重新输入");
                        }else if("ok"==data){
                            nameMsg.html("√");
                        }
                    }

                )
            }
        }

    </script>
</head>
<body>
<form method="post" action="" enctype="multipart/form-data">
    <table >

        <tr>
            <td colspan="2">编号</td>
            <td><input type="hidden" name="lkmId" /></td>
        </tr>
        <tr>
            <td>名称</td>
            <td><input type="text" name="lkmName" onblur="checkNames()"/>
            <span id="cusNameMsg"></span>
            </td>
        </tr>
        <tr>
            <td>性别</td>
            <td><input type="text" name="lkmGender" /></td>
        </tr>
        <tr>
            <td>手机</td>
            <td><input type="text" name="lkmPhone" /></td>
        </tr>
        <tr>
            <td>邮件</td>
            <td><input type="text" name="lkmEmail" /></td>
        </tr>
        <tr>
            <td>QQ</td>
            <td><input type="text" name="lkmQq" /></td>
        </tr>
        <tr>
            <td>等级</td>
            <td><input type="text" name="lkmPosition" /></td>
        </tr>
        <tr>
            <td>地址</td>
            <td>省<select name="prvice" onchange="checkCity(this)">

                </select>&nbsp;
                市<select name="citys" >

                </select>&nbsp;
                <input type="hidden" name="all"/>
                <input type="text" name="address">
            </td>
        </tr>
        <tr>
            <td>文件</td>
            <td><input type="file" name="picFile"/></td>
        </tr>
        <tr>
            <td>提交</td>
            <td><input type="submit" /></td>
        </tr>
    </table>
</form>
</body>
</html>
