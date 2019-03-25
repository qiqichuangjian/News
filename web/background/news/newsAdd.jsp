<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../commons/info.jsp"%>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
</head>
<body>
    <div class="layui-container" style="padding: 20px">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">新闻标题：</label>
                <div class="layui-input-block">
                    <input type="text" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">作者：</label>
                <div class="layui-input-inline">
                    <input type="text" name="author" required lay-verify="required" placeholder="请输入作者" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">新闻类型：</label>
                <div class="layui-input-block">
                    <select name="typeId" lay-verify="required">
                        <option value="">请选择</option>
                        <c:forEach items="${typeList}" var="type">
                            <option value="${type.typeId}">${type.typeName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">新闻标签：</label>
                <div class="layui-input-block">
                    <input type="checkbox" name="isHot" title="热点">
                    <input type="checkbox" name="isImage" title="图片" >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">发布日期：</label>
                <div class="layui-input-inline">
                    <input type="text" name="publishDate" lay-verify="required" class="layui-input" id="test1">
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">新闻内容：</label>
                <div class="layui-input-block">
                    <textarea id="content"  name="content"  cols="20" rows="2" class="ckeditor"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="submitSave">保存</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
    <script>
        //Demo
        layui.use(['laydate','form'], function(){
            var form = layui.form;
            var laydate = layui.laydate;
            form.render();
            //监听提交
            form.on('submit(submitSave)', function(data){
                layer.msg(JSON.stringify(data.field)+"==="+CKEDITOR.instances.content.getData());
                var title = data.field.title;
                var author = data.field.author;
                var typeId = data.field.typeId;
                var hot = data.field.isHot;
                var isImage = data.field.isImage;
                var publishDate = data.field.publishDate;
                var content =  CKEDITOR.instances.content.getData();
                $.ajax({
                    type:"post",
                    url:"NewsServlet",
                    data:{
                       "action":"add",
                       "title":title,
                       "author":author,
                       "typeId":typeId,
                       "hot":hot,
                       "isImage":isImage,
                       "publishDate":publishDate,
                       "content":content
                    },
                    success:function(msgData){
                        layer.msg("添加成功",{icon:1,time:2000});
                        setTimeout("location.reload()",3000)
                    }
                })
                return false;
            });
            laydate.render({
                elem: '#test1', //指定元素
                type:'datetime'
            });
        });
    </script>
</body>
</html>
