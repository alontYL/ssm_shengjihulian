    //页面载入事件
$(function(){
        loadLinkmanByPage(1)

$(function () {
    //获取下拉选择框
    var selectObj = $("[name=\"linkName\"]");
    var url ="";
    var params=null;

})

    });
    //毫秒转日期
    function turnTime(ms){
        var oDate = new Date(ms),
            oYear = oDate.getFullYear(),
            oMonth = oDate.getMonth()+1,
            oDay = oDate.getDate(),
            oHour = oDate.getHours(),
            oMin = oDate.getMinutes(),
            oSen = oDate.getSeconds(),
            oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay) +' '+ getzf(oHour) +':'+ getzf(oMin) +':'+getzf(oSen);//最后拼接时间
        return oTime;
    }
    //给时间补上零
    function getzf(num){
        if(parseInt(num) < 10){
            num = '0'+num;
        }
        return num;
    }

    function checkDel(id,page,length){
        alert(length);

        var url = "/linkman/api/v_1/delLinkmanById/"+id+"/"+page;
       if(confirm("你确定要删除吗？")){
            $.ajax({
              url:url,
              type:"delete",
             success:function(data){
                  if(length == 1){
                    loadLinkmanByPage(data-1);
                  }else{
                      loadLinkmanByPage(data);
                  }
             }
            });
             }
    }




    function loadLinkmanByPage(indexPage){
        var url = "/linkman/api/v_1/findLinkmanByPage";
        var params = {"indexPage":indexPage};
            $.post(
                url,
                params,
                function(data){
                  //获取集合数据
                    var datas = data.beanList;
                    //获取数据保存位置
                    var $context = $("#dataContext");
                    //清空上一页的内容
                    $context.empty();
                    $(datas).each(function(index,dom){
                        $context.append("<tr>\n" +
                            "            <td>"+(index+1)+"</td>\n" +
                            "            <td>"+dom.lkmName+"</td>\n" +
                            "            <td>"+dom.lkmGender+"</td>\n" +
                            "            <td>"+dom.lkmPhone+"</td>\n" +
                            "            <td>"+dom.lkmEmail+"</td>\n" +
                            "            <td>"+dom.lkmQq+"</td>\n" +
                            "            <td>"+dom.lkmPosition+"</td>\n" +
                            "            <td><a href='/linkman/api/v_1/findLinkManById/"+dom.lkmId+"' class='btn btn-default'>编辑</a>&nbsp;<a href='#' onclick='checkDel("+dom.lkmId+","+data.indexPage+","+datas.length+")' class='btn btn-danger'>删除</a></td>\n" +
                            "        </tr>")

                    });

                    //使用js封装分页数据

                    var pagehtml ="";

                    pagehtml += "<a onclick='loadLinkmanByPage(1)' class='btn btn-default btn-sm active' >首页</a>&nbsp;";
                    if(data.indexPage > 1){

                        pagehtml += "<a onclick='loadLinkmanByPage("+(data.indexPage - 1)+")' class='btn btn-default btn-sm active'> 上一页 </a>&nbsp;";
                    }else{
                        pagehtml +="<span class='btn btn-default btn-sm disabled'>上一页</span>&nbsp;";

                    }


                    if(data.totalPage < 4){
                        for (var i = 1; i <= data.totalPage; i++) {
                            pagehtml +="<a  onclick='loadLinkmanByPage("+i+")' class='btn btn-default btn-sm active'>"+i+"</a>&nbsp;";
                        }

                    }else if(data.indexPage + 4 <= data.totalPage){

                        for ( var i = data.indexPage; i < data.indexPage + 4; i++) {
                            pagehtml += "<a  onclick='loadLinkmanByPage("+i+")' class='btn btn-default btn-sm active'> "+i+" </a>&nbsp;";
                        }
                    }else{
                        for ( var i = data.totalPage - 3; i <= data.totalPage; i++) {
                            pagehtml += "<a onclick='loadLinkmanByPage("+i+")' class='btn btn-default btn-sm active'> "+i+" </a>&nbsp;";
                        }
                    }


                    if(data.indexPage < data.totalPage){

                        pagehtml += "<a onclick='loadLinkmanByPage("+(data.indexPage + 1)+")' class='btn btn-default btn-sm active'> 下一页 </a>&nbsp;";
                    }else{
                        pagehtml +="<span class='btn btn-default btn-sm disabled'>下一页</span>&nbsp;";
                    }


                    pagehtml += "<a onclick='loadLinkmanByPage("+(data.totalPage)+")' class='btn btn-default btn-sm active'>尾页</a>&nbsp;";
                    pagehtml += "<font class='page-header' size='4.5px'>当前第&nbsp;"+data.indexPage+"&nbsp;页/共&nbsp;"+data.totalPage+"&nbsp;页</font>";
                    pagehtml +="</ul>";
                    $("#myIndexPage").html(pagehtml);

                },
                "json"
            );

    }