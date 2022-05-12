
<%@ page contentType="text/html; charset=UTF-8"%>
<footer
	class="container-fluid text-left text-lg-start text-dark bg-light"
	style="margin-top: 50px;">
	<div class="container" style="padding: 20px">

		<div class="text-center mt-5">
			<small>©SINH VIEN PTIT 2022</small>
		</div>
	</div>
</footer>
</body>

<c:if test="${ sessionScope.message != null }">
	<script>
		$.notify("<c:out value='${sessionScope.message}' />", {
			className : "info"
		});
	</script>
	<c:remove var="message" scope="session" />
</c:if>
<script
	src="<c:url value='/home/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
<script src="<c:url value='/home/assets/main.js'/>"></script>