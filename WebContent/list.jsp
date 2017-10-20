<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.js"></script>
<script src="js/layer/layer.js"></script>
<link href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.css"
	rel="stylesheet">
<script type="text/javascript">
	//在页面装载时，让所有的td都拥有点击事件
	$(function() {
		//找到所有td节点
		var tds = $(".withedit");
		//给所有的td节点增加点击事件
		tds.click(tdclick);

		var atag = $(".ajax");
		atag.click(function() {
			layer.open({
				  type: 2,
				  area: ['300px', '250px'],
				  fix: false, //不固定
				  maxmin: true,
				  content: 'addwithajax.jsp'
				});
			return false;
		});
	})

	function ajaxdo() {
		var url = this.href;
		var args = {};
		$.post(url, args, function(data) {
			alert(data);
		});
		return false;
	}

	function tdclick() {
		var clickfunction = this;
		//0,获取当前的td节点
		var td = $(this);
		//1,取出当前td中的文本内容保存起来
		var text = $(this).text();
		//2，清空td里边内同
		td.html("");
		//3,建立一个文本框，也就是建一个input节点
		var input = $("<input>");
		//4,设置文本框中值是保存起来的文本内容
		input.attr("value", text);
		//4.5让文本框可以相应键盘按下的事件

		input.keyup(function(event) {
			//记牌器当前用户按下的键值
			var myEvent = event || window.event;//获取不同浏览器中的event对象
			var kcode = myEvent.keyCode;
			//判断是否是回车键按下
			if (kcode == 13) {
				//获取当前文本框的内容
				var inputnode = $(this);
				//将内容填充到input
				var inputext = inputnode.val();
				//td的节点
				var tdNode = inputnode.parent();
				var tdID = td.parent().find(".oilID").html();

				var url = "${pageContext.request.contextPath }/ajax";
				var args = {
					"keyid" : tdID,
					"keyval" : inputext,
					"date" : new Date()
				};
				$.post(url, args, function(data) {
					if (data == 1) {
						tdNode.html(inputext);
						layer.msg('操作成功', {
							time : 1500
						});
						//alert("edit success");
					} else {
						tdNode.html(text);
						layer.msg('操作失败', {
							time : 1500
						});
						//alert("edit error");
					}
				});

				//让td重新拥有点击事件
				tdNode.click(tdclick);
			}
		});

		input.focusout(function(event) {
			var inputnode = $(this);
			//获取当前文本框的内容
			//var inputext = inputnode.val();
			//清空td里边的内容,然后将内容填充到里边
			var tdNode = inputnode.parent();
			tdNode.html(text);
			//让td重新拥有点击事件
			tdNode.click(tdclick);
		});

		//5，把文本框加入到td里边去
		td.append(input);
		//5.5让文本框里边的文章被高亮选中
		//需要将jquery的对象转换成dom对象
		var inputdom = input.get(0);
		inputdom.select();

		//6,需要清楚td上的点击事件
		td.unbind("click");
	}
</script>


<title>Insert title here</title>

</head>
<body>

	<c:if test="${page != null && page.numberOfElements > 0 }">
		<table class="table table-striped table-bordered">
			<tr>
				<th>ID</th>
				<th>mile</th>
				<th>cash</th>
				<th>price</th>
				<th>date</th>
			</tr>
			<c:forEach items="${page.content }" var="oil">
				<tr>
					<td class="oilID">${oil.id }</td>
					<td>${oil.mile }</td>
					<td class="withedit">${oil.cash }</td>
					<td>${oil.price }</td>
					<td><fmt:formatDate value="${oil.date }" pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5" align="center"><a
					href="?pageNo=${page.number + 1 - 1 }" class="btn btn-info ">
						&lt;上一页</a> 共 ${page.totalElements } 条记录 共${page.totalPages } 页 当前
					${page.number + 1 } 页 <a href="?pageNo=${page.number + 1 + 1 }"
					class="btn btn-info "> 下一页&gt;</a>
					<a href="./add"	class="btn btn-primary ">ADD NOTES</a> 
					<a class="btn btn-primary ajax">ADD WITH AJAX</a></td>
			</tr>
		</table>
	</c:if>

</body>
</html>