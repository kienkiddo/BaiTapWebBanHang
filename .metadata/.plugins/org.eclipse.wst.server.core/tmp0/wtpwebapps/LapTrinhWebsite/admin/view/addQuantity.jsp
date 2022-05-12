<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
th, td {
	padding: 3px 5px !important;
}
</style>
<div class="col-lg-9">
	<h4 class="userHeader_Title">THÊM SỐ LƯỢNG</h4>
	<hr class="userHeader_Gach">
	<div class="row">
		<div class="col">
			<div class="text-right mb-2">
				<button class="btn btn-danger btn-sm font-weight-bold" onclick="fRefesh()"><i class="fas fa-trash"></i> XÓA TẤT CẢ SỐ LƯỢNG</button>
			</div>
			<div class="row">
				<div class="col-6 offset-3 text-center">
					<img class="img-thumbnail"
						src="<c:url value='/upload/${item.thump }'/>" alt="" id="imgThump"
						style="width: 50%">
					<p>
						<a href="<c:url value='/chi-tiet-san-pham?id='/>${item.id}">${item.name}</a>
					</p>
				</div>
			</div>
			<form id="form" action="addQuantity" method="POST" class="pb-3">
				<p style="color: red">${message}</p>
				<input type="hidden" id="action" name="action" value="AddQuantity">
				<input type="hidden" id="id" name="id" value="${item.id}">
				<div class="form-group">
					<label>Kích thước (size):</label> <select class="form-control"
						id="size" name="size">
						<option value="35">35</option>
						<option value="36">36</option>
						<option value="37">37</option>
						<option value="38">38</option>
						<option value="39">39</option>
						<option value="40">40</option>
						<option value="41">41</option>
						<option value="42">42</option>
						<option value="43">43</option>
						<option value="44">44</option>
						<option value="45">45</option>
					</select>
				</div>
				<div class="form-group">
					<label>Số lượng:</label> <input class="form-control" type="number"
						id="quantity" name="quantity" value="0"> <small><span
						class="text-danger">(*)</span> Số lượng cộng thêm vào hiện tại</small>
				</div>

				<button class="btn btn-primary btn-sm font-weight-bold form-control"
					type="submit">THÊM HÀNG</button>
			</form>
			<hr>
			<div class="table-responsive mt-4">
				<h6 class="text-center">DANH SÁCH HÀNG TRONG KHO</h6>
				<table class="table table-sm text-center">
					<thead class="bg bg-info text-white">
						<tr>
							<th>Kích thước</th>
							<th>Số lượng còn</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${item.infos}" var="info">
							<tr>
								<td>${info.size}</td>
								<td>${info.quantity}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<script>
	function fRefesh(){
		$.ajax({
			url: "addQuantity",
			type: "post",
			data: "id=${item.id}&action=Refesh",
			success: function(res){
				if (res == "OK"){
					window.location.reload();
				}
			}
		})
	}
</script>
