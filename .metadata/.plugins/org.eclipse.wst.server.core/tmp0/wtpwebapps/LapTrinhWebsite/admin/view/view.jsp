<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
th, td {
	font-size: 15px;
	padding: 3px 5px !important;
}
</style>
<div class="col-lg-9">
	<h4 class="userHeader_Title">DANH SÁCH SẢN PHẨM</h4>
	<hr class="userHeader_Gach">
	<div class="row">
		<div class="col">
			<div class="text-center mb-3">
				<label>Hiển thị: </label> <select id="type">
					<option value="tat-ca" disable selected>Tất cả</option>
					<option value="dang-ban">Đang bán</option>
					<option value="dang-an">Đang ẩn</option>
					<option value="hang-moi-ve">Hàng mới về</option>
					<option value="hang-giam-gia">Hàng giảm giá</option>
					<option value="het-hang">Hết hàng</option>
				</select>
			</div>

			<div class="table-responsive">
				<table
					class="table table-hover table-sm table-bordered table-xs-responsive text-center"
					id="table" style="display: table; width: 100%; border: 0px">
					<thead class="bg bg-info text-white">
						<tr>
							<th>#</th>
							<th>Ngày tạo</th>
							<th>Loại</th>
							<th>Tên</th>
							<th>Thao tác</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${items}" var="item">
							<tr>
								<td>${item.id}</td>
								<td>${item.time}</td>
								<c:if test="${item.type == 0}">
									<td>Giày</td>
								</c:if>
								<c:if test="${item.type == 1}">
									<td>Dép</td>
								</c:if>
								<td>${item.name}</td>
								<td><c:if test="${item.status == 1}">
										<a href="<c:url value='/chi-tiet-san-pham?id=${item.id}'/>"
											target="_blank"><span class="fas fa-eye""></span></a>
									</c:if> <c:if test="${item.status == 0}">
										<a href="<c:url value='/chi-tiet-san-pham?id=${item.id}'/>"
											target="_blank"><span class="fas fa-eye-slash""></span></a>
									</c:if> <a href="<c:url value='/admin/editItem?id=${item.id}'/>"><span
										class="fas fa-edit"></span></a> <a
									href="<c:url value='/admin/addQuantity?id=${item.id}'/>"><i
										class="fas fa-plus-circle"></i></a></td>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>



<script>


	$("#type").on("change", function() {
		window.location.replace("view?type=" + $("#type").val());
	});

	$(document).ready(function() {
		$("#table").DataTable({
			"order" : [ [ 0, "desc" ] ]
		});
		
		$('#type option[value="${type}"]').attr("selected", true);
	});
</script>
