<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container">
	<h3 class="text-center mt-5">ĐƠN HÀNG #${history.id}</h3>
	<hr style="width: 10%; height: 2px" class="color-main">
	<div class="row mt-4">
		<div class="col">
			<p style="font-size: 21px">I. THÔNG TIN NHẬN HÀNG</p>
			<table>
				<tbody>
					<tr>
						<td>Tình trạng:</td>
						<td><c:if test="${history.status == -1}">
								<div class="badge badge-danger p-2">ĐÃ HỦY</div>
							</c:if> <c:if test="${history.status == 0}">
								<div class="badge badge-primary p-2">ĐANG THỰC HIỆN</div>
							</c:if> <c:if test="${history.status == 1}">
								<div class="badge badge-success p-2">ĐÃ THỰC HIỆN</div>
							</c:if></td>
					</tr>
					<tr>
						<td>Thời gian tạo:</td>
						<td class="font-weight-bold">${history.timecreat}</td>
					</tr>
					<tr>
						<td>Họ tên:</td>
						<td class="font-weight-bold">${history.name}</td>
					</tr>
					<tr>
						<td>Số điện thoại:</td>
						<td class="font-weight-bold">${history.phone}</td>
					</tr>
					<tr>
						<td>Địa chỉ:</td>
						<td class="font-weight-bold">${history.address}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<p style="font-size: 21px" class="mt-3">II. THÔNG TIN ĐƠN HÀNG</p>
	<div class="row">
		<div class="col-4 offset-2">
			<p>TÊN SẢN PHẨM</p>
		</div>
		<div class="col">
			<p>SỐ LƯỢNG</p>
		</div>
		<div class="col text-center">
			<p>GIÁ</p>
		</div>
		<div class="col text-center">
			<p>THÀNH TIỀN</p>
		</div>
	</div>
	<c:forEach items="${history.bills}" var="bill">
		<div class="row mt-4 mb-4">
			<div class="col-2">
				<img class="img-thumbnail"
					src="<c:url value='/upload'/>/${bill.item.thump}" alt=""
					style="width: 50%">
			</div>
			<div class="col-4">
				<p class="mb-1">
					<a href="<c:url value='/chi-tiet-san-pham'/>?id=${bill.item.id}"
						style="color: black" target="_blank">${bill.item.name}</a>
				</p>
				<p style="font-size: 11px">Mã sản phẩm: #${bill.item.id}</p>

			</div>
			<div class="col text-center">
				<div class="form-group">
					<p>${bill.quantity}</p>
				</div>
			</div>
			<div class="col text-center">
				<p>
					<fmt:formatNumber value="${bill.price}" type="currency" />
				</p>
			</div>
			<div class="col  text-center">
				<p class="font-weight-bold">
					<fmt:formatNumber value="${bill.price * bill.quantity}"
						type="currency" />
				</p>
			</div>
		</div>
		<hr>
	</c:forEach>
	<div class="row">
		<div class="col text-right">
			<p style="font-size: 21px;" class="font-weight-bold">
				Tổng:
				<fmt:formatNumber value="${history.price}" type="currency" />
			</p>
		</div>
	</div>
	

</div>


