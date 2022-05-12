<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#info td, #info th {
	padding: 10px 15px;
}

#history th, #history td {
	font-size: 15px;
	padding: 5px 20px !important;
}
</style>

<div class="container pt-5">
	<h3 class="text-center">THÔNG TIN CỦA BẠN</h3>
	<hr style="width: 10%; height: 2px" class="color-main">
	<div class="row mt-5">
		<div class="col">
			<table class="table" id="info">
				<tr>
					<th>Họ tên:</th>
					<td>${user.name}</td>
				</tr>
				<tr>
					<th>Email:</th>
					<td>${user.email}</td>
				</tr>
				<tr>
					<th>Số điện thoại:</th>
					<td>${user.phone}</td>
				</tr>
				<tr>
					<th>Tham gia:</th>
					<td>${user.timecreat}</td>
				</tr>
			</table>
		</div>
	</div>

	<div class="row mt-5">
		<div class="col">
			<p style="font-size: 19px" class="text-center">ĐƠN HÀNG GẦN NHẤT</p>
			<table class="table text-center" id="history">
				<thead class="bg bg-info text-white">
					<th>#</th>
					<th>Thời gian tạo</th>
					<th>Tình trạng</th>
					<th>Chi tiết</th>
				</thead>
				<tbody>
					<c:forEach items="${historys}" var="item" varStatus="loop">
					<c:if test="${loop.index < 3}">
						<tr>
							<td>${item.id }</td>
							<td>${item.timecreat }</td>
							<td><c:if test="${item.status == -1}">
									<div class="badge badge-danger p-2">ĐÃ HỦY</div>
								</c:if> <c:if test="${item.status == 0}">
									<div class="badge badge-primary p-2">ĐANG THỰC HIỆN</div>
								</c:if> <c:if test="${item.status == 1}">
									<div class="badge badge-success p-2">ĐÃ THỰC HIỆN</div>
								</c:if></td>
							<td><a href="don-hang?id=${item.id}"><i
									class="fas fa-ellipsis-h"></i></a></td>

						</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
</div>

