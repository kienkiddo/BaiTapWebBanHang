<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
th, td {
	font-size: 15px;
	padding: 3px 5px !important;
}
</style>
<div class="col-lg-9">
	<h4 class="userHeader_Title">DANH SÁCH ĐƠN HÀNG</h4>
	<hr class="userHeader_Gach">
	<div class="row">
		<div class="col">
			<div class="table-responsive">
				<table
					class="table table-hover table-sm table-bordered table-xs-responsive text-center"
					id="table" style="display: table; width: 100%; border: 0px">
					<thead class="bg bg-info text-white">
						<tr>
							<th>#</th>
							<th>Thời gian tạo</th>
							<th>Khách hàng</th>
							<th>Tình trạng</th>
							<th>Thao tác</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${historys}" var="history">
							<tr>
								<td>${history.id}</td>
								<td>${history.timecreat}</td>
								<td>${history.name}</td>
								<td><c:if test="${history.status == 1}">
										<span class="badge badge-success p-1">Đã duyệt</span>
									</c:if> <c:if test="${history.status == 0}">
										<span class="badge badge-primary p-1">Chưa duyệt</span>
									</c:if><c:if test="${history.status == -1}">
										<span class="badge badge-danger p-1">Đã hủy</span>
									</c:if> </td>
									

								<td><a
									href="<c:url value='/admin/billDetail?id=${history.id}'/>"
									target="_blank"><span class="fas fa-eye""></span></a></td>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>



<script>
	$(document).ready(function() {
		$("#table").DataTable({
			"order" : [ [ 0, "desc" ] ]
		});
	});
</script>
