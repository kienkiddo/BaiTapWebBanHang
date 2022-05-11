<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
th td {
	padding: 5px 10px;
}

.fa-trash {
	cursor: pointer;
}
</style>
<div class="container" style="margin-top: 35px">
	<h3 class="text-center">GIỎ HÀNG CỦA TÔi</h3>
	<hr style="width: 10%; height: 2px" class="color-main">
	<div class="container pt-4 pb-3">
		<c:if test="${empty cart || cart.cartItems.size() == 0}">
			<p class="text-center" style="font-size: 19px">Hiện chưa có sản
				phẩm nào</p>
		</c:if>
		<c:if test="${not empty cart && cart.cartItems.size() > 0}">

			<div class="row">
				<div class="col-4 offset-2">
					<h5>TÊN SẢN PHẨM</h5>
				</div>
				<div class="col">
					<h5>SỐ LƯỢNG</h5>
				</div>
				<div class="col text-center">
					<h5>GIÁ</h5>
				</div>
				<div class="col text-center">
					<h5>THÀNH TIỀN</h5>
				</div>
			</div>
			<c:forEach items="${cart.cartItems}" var="cartItem">
				<div class="row mt-4 mb-4">
					<div class="col-2">
						<img class="img-thumbnail" src="upload/${cartItem.item.thump}"
							alt="" style="width: 75%">
					</div>
					<div class="col-4">
						<p class="mb-1"><a href="chi-tiet-san-pham?id=${cartItem.item.id}" style="color: black">${cartItem.item.name}</a></p>
						<p style="font-size: 11px">Mã sản phẩm: #${cartItem.item.id}</p>
						<small>Size: ${cartItem.size}</small> &nbsp; <span
							class="fas fa-trash"
							onclick="removeCart(${cartItem.id}, ${cartItem.size})"></span>
					</div>
					<div class="col text-center">
						<div class="form-group">
							<p>${cartItem.quantity}</p>
						</div>
					</div>
					<div class="col  text-center">
						<p>
							<fmt:formatNumber value="${cartItem.price}" type="currency" />
						</p>
					</div>
					<div class="col  text-center">
						<p class="font-weight-bold">
							<fmt:formatNumber value="${cartItem.price * cartItem.quantity}"
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
						<fmt:formatNumber value="${cart.price}" type="currency" />
					</p>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<a class="btn btn-primary btn-sm form-control font-weight-bold" href="xac-nhan-don-hang">
						<span class="fas fa-key"></span> ĐẶT HÀNG NGAY
					</a>
				</div>
			</div>
		</c:if>
	</div>
</div>

<script>
	function removeCart(id, size) {
		$.ajax({
			url : "gio-hang",
			type : "post",
			data : "action=removeCart&id=" + id + "&size=" + size,
			success : function(res) {
				if (res == "OK"){
					window.location.reload();
				}
			}
		});
	}
</script>