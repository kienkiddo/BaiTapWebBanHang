<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container" style="margin-top: 35px">
	<h3 class="text-center" s>DANH MỤC SẢN PHẨM</h3>
	<hr style="width: 10%; height: 2px" class="color-main">
	<div class="container bg-light pt-4 pb-3">
		<div class="row">
			<div class="col-lg-4">
				<div class="form-group">
					<select class="form-control" id="price">
						<option value="-1" disabled selected>Chọn giá tiền</option>
						<option value="0">Dưới 200.000đ</option>
						<option value="1">200.000đ - 300.000đ</option>
						<option value="2">300.000đ - 500.000đ</option>
						<option value="3">Trên 500.000đ</option>
					</select>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="form-group">
					<select class="form-control" id="size">
						<option value="-1" disabled selected>Chọn kích thước</option>
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
			</div>
			<div class="col-lg-4">
				<div class="form-group">
					<select class="form-control" id="color">
						<option value="-1" disabled selected>Chọn màu sắc</option>
						<c:forEach items="${colors}" var="color">
							<option value="${color.id}">${color.name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
	</div>
	<div class="container pt-4">
		<div class="row">
			<div class="col text-right">
				<select id="sort">
					<option value="-1" disabled selected>Sắp xếp theo</option>
					<option value="0">Sắp xếp từ A-Z</option>
					<option value="1">Sắp xếp từ Z-A</option>
					<option value="2">Giá giảm dần</option>
					<option value="3">Giá tăng dần</option>
					<option value="4">Đang giảm giá</option>
					<option value="5">Hàng mới về</option>
				</select>
			</div>
		</div>
	</div>
	<div class="container" style="margin-top: 35px">
		<div class="row" id="data"></div>

		<div class="row">
			<div class="col">
				<ul class="pagination justify-content-end" id="pageControl">
				</ul>
			</div>
		</div>
	</div>
</div>

<script>
	var data = ${data};
	var arr = data;
	var numItem = 12;
	var index = 0;

	console.log(data);
	$(document).ready(function() {
		showPage();
	});

	function showPage() {
		var text = "";
		for (var i = index * numItem; i < (index + 1) * numItem; i++) {
			if (i < arr.length) {
				text += creatHtml(arr[i]);
			}
		}
		if (text == "") {
			text = "<div class='col'><p class='text-center'>Hiện không có sản phẩm nào.</p></div>";
		}
		$("#data").html(text);

		text = "";
		var lengthPage = Math.round(arr.length / numItem)
				+ (arr.length % numItem == 0 ? 0 : 1);
		if (index > 0) {
			text += '<li class="page-item"><a class="page-link text-dark" href="javascript:void(0);" onclick="nextPage(-1)"><</a></li>';
		}
		text += '<li class="page-item"><a class="page-link text-light bg-info" href="javascript:void(0);">'
				+ (index + 1) + '</a></li>';
		if (index + 1 < lengthPage) {
			text += '<li class="page-item"><a class="page-link text-dark" href="javascript:void(0);" onclick="nextPage(+1)">></a></li>';
		}
		$("#pageControl").html(text);
	}

	function nextPage(param) {
		index += param;
		showPage();
		$("html, body").animate({
			scrollTop : 0
		}, "slow");
	}

	$("#price").on("change", function() {
		search();
	})

	$("#size").on("change", function() {
		search();
	})

	$("#color").on("change", function() {
		search();
	})

	$("#sort").on("change", function() {
		search();
	})

	function search() {

		arr = Array.from(data);

		var price = $("#price").val();

		if (price != null) {
			console.log("search price");
			var prices = [ 200000, 300000, 500000, 100000000 ];
			for (var i = arr.length - 1; i >= 0; i--) {
				if (arr[i].cost > prices[price]
						|| (price > 0 && arr[i].cost < prices[price - 1])) {
					arr.splice(i, 1);
				}
			}
		}

		var size = $("#size").val();
		if (size != null) {
			console.log("search size");
			for (var i = arr.length - 1; i >= 0; i--) {
				var infos = JSON.parse(arr[i].strInfos);
				var exist = false;
				for (var j = 0; j < infos.length; j++) {
					if (infos[j].size == size && infos[j].quantity > 0) {
						exist = true;
						break;
					}
				}
				if (!exist) {
					arr.splice(i, 1);
				}
			}
		}

		var color = $("#color").val();
		if (color != null) {
			console.log("search color");
			for (var i = arr.length - 1; i >= 0; i--) {
				if (arr[i].colorId != color) {
					arr.splice(i, 1);
				}
			}
		}
		
		
		var sort = $("#sort").val();
		if (sort != null){
			console.log("search sort: " + sort);
			console.log(arr);
			switch (Number(sort)){
			case 0:
				arr.sort((a,b) => (a.name > b.name) ? 1 : ((b.name > a.name) ? -1 : 0));
				break;
			case 1:
				arr.sort((a,b) => (a.name > b.name) ? -1 : ((b.name > a.name) ? 1 : 0));
				break;
			case 2:
				arr.sort((a,b) => (a.cost > b.cost) ? -1 : ((b.price > a.cost) ? 1 : 0));
				break;
			case 3:
				arr.sort((a,b) => (a.cost > b.cost) ? 1 : ((b.price > a.cost) ? -1 : 0));
				break;
			case 4:
				arr.sort((a,b) => (a.sale > b.sale) ? -1 : ((b.sale > a.sale) ? 1 : 0));
				break;
			case 5:
				arr.sort((a,b) => (a.isNew) ? -1 : (b.isNew ? 1 : 0));
				break;
			}
		}
		
		index = 0;
		showPage();
	}

	function creatHtml(item) {
		var description = (item.sale > 0 ? "GIẢM " + item.sale + "%" : (item.isNew ? "HÀNG MỚI" : ""));
		if (description.length > 0){
			description = '<div class="top-right font-weight-bold text-white bg-danger" style="position: absolute; top: 3px; right: 5px; padding: 2px 8px">' + description +  '</div>';
		}
		var priceSource = "";
		if (item.sale > 0){
			priceSource = ' <span style="font-size: 15px; text-decoration: line-through" class="font-italic">(' + formatNumber(item.price) +'đ)</span>';
		}
		return '<div class="col-md-3 col-6" id="card-item"><a href="chi-tiet-san-pham?id='
				+ item.id
				+ '" style="text-decoration: none"> <div class="card mb-3 box-shadow" style="color: black"> <img class="card-img-top mb-4" src="upload/' + item.thump + '" alt=""> ' + description + ' <div class="card-body text-center pt-0" style="padding-left: 5px; padding-right: 5px"> <p class="card-text font-weight-bold font-weight-bolder text-warning">'
				+ item.name
				+ '</p> <p>Giá: '
				+ formatNumber(item.cost)
				+ 'đ ' + priceSource + '</p></div> </div> </a> </div>';
	}
</script>