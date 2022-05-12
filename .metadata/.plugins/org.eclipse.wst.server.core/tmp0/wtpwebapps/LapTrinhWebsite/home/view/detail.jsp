<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<style>
.img-small {
	margin-bottom: 7px;
}
</style>
<div class="container" style="margin-top: 35px">
	<h3 class="text-center">CHI TIẾT SẢN PHẨM</h3>
	<hr style="width: 10%; height: 2px" class="color-main">
	<div class="container pt-4">
		<div class="row">
			<div class="col-6">
				<div class="row">
					<div class="col-2 p-0">
						<c:forEach items="${item.images}" var="img">
							<img class="img-thumbnail img-small" src="upload/${img}" alt=""
								onclick="fChangeImage(this)">
						</c:forEach>
					</div>
					<div class="col-10">
						<img class="img-thumbnail" src="upload/${item.thump}" alt=""
							id="imgThump">
					</div>
				</div>
				<div class="row">
					<div class="col">
						<div class="bg-light mt-5 p-3">${item.description}</div>
					</div>
				</div>
			</div>
			<div class="col-6">
				<p class="font-weight-bold font-weight-bolder mb-0">${item.name}</p>
				<small>Mã sản phẩm: #${item.id }</small></br>
				<p class="text-danger font-weight-bold" style="font-size: 23px;">
					Giá:
					<fmt:formatNumber value="${item.cost}" type="currency" />
					<c:if test="${item.sale > 0}">
						&ensp;
						<span class="font-italic text-dark"
							style="font-size: 17px; text-decoration: line-through">(<fmt:formatNumber
								value="${item.price}" type="currency" />)
						</span>
					</c:if>
				</p>

				<hr>
				<c:if test="${!item.isEmpty}">
					<div class="row">
						<div class="col-10">
							<div class="form-inline">
								<label>Kích thước: &ensp;</label> <select class="form-control"
									id="size">
									<option value="-1" selected>Chọn size</option>
									<c:forEach items="${item.infos}" var="info">
										<c:if test="${info.quantity > 0}">
											<option value="${info.size}" data-quantity="${info.quantity}">${info.size}</option>
										</c:if>
									</c:forEach>

								</select> <small style="display: none" id="divQuantity"
									class="font-italic">&ensp; Còn <span id="quantityEnd"
									class="font-weight-bold"></span> sản phẩm
								</small>
							</div>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-10">
							<div class="form-inline">
								<label>Số lượng: &ensp;</label> <input type="number"
									class="form-control" value="1" id="quantity">
							</div>
						</div>
					</div>
					<div class="row mt-4">
						<div class="col">
							<button class="form-control btn-primary btn-sm font-weight-bold"
								onclick="addCart()" id="btn">
								<i class="fas fa-cart-arrow-down"></i> MUA NGAY
							</button>
						</div>
					</div>
					<hr>

				</c:if>
				<c:if test="${item.isEmpty}">
					<p class="text-danger font-weight-bold">TẠM HẾT HÀNG</p>
					<hr>
				</c:if>

				<c:if test="${not empty suggests}">
					<p>Có thể bạn sẽ thích</p>
					<div class="row mt-2">
						<c:forEach items="${suggests}" var="item">
							<div class="col-md-4 col-6" id="card-item">
								<a href="chi-tiet-san-pham?id=${item.id}"
									style="text-decoration: none">
									<div class="card mb-3 box-shadow" style="color: black">
										<img class="card-img-top" src="upload/${item.thump}" alt="">
										<div class="top-right font-weight-bold text-white bg-danger"
											style="position: absolute; top: 3px; right: 5px; padding: 1px 4px">-${item.sale}%</div>
										<div class="card-body text-center pt-2"
											style="padding-left: 5px; padding-right: 5px">
											<p
												class="card-text font-weight-bold font-weight-bolder text-warning">${fn:substring(item.name, 0, 15)}...</p>
											<button type="button" class="btn btn-outline-dark">XEM
												CHI TIẾT</button>
										</div>
									</div>
								</a>
							</div>
						</c:forEach>
					</div>
				</c:if>


			</div>
		</div>


	</div>
</div>

</div>
</div>

<script>
	function addCart() {
		$.ajax({
			url : "gio-hang",
			type : "post",
			data : "action=addCart&id=${item.id}&size=" + $("#size").val()
					+ "&quantity=" + $("#quantity").val(),
			success : function(res) {
				if (res.startsWith("OK")) {
					//window.location.replace("gio-hang");
					$("#numCart").html(res.replace("OK|", ""));
					$.notify($("#btn"), "Đã thêm vào giỏ hàng thành công", {
						className : "success",
						position : "top-center"
					});
					$("#giohang").animate({
						zoom : '150%'
					}, "slow");
					$("#giohang").animate({
						zoom : '100%'
					}, "fast");

				} else {
					$.notify($("#btn"), res, {
						className : "info",
						position : "top-center"
					});
				}
			}
		});
	}

	$("#size").on("change", function() {
		$("#divQuantity").show();
		var quantity = $("#size").find(":selected").attr("data-quantity");
		$("#quantityEnd").html(quantity);
	});

	function fChangeImage(t) {
		$('#imgThump').fadeOut().queue(function() {
			var img = $(this);
			img.attr('src', $(t).attr("src"));
			img.fadeIn();
			img.dequeue();
		});
	}
</script>