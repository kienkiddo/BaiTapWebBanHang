<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
@media ( min-width : 1199.98px) {
	.col-lg-3 {
		padding-right: 10px;
	}
	.col-lg-9 {
		padding-left: 10px;
	}
}

@media ( max-width : 1199.98px) {
	.col-lg-9 {
		margin-top: 25px;
	}
}

.userHeader li {
	margin-bottom: 10px;
	border-bottom: 1px solid #f2f2f2;
}

.userHeader_Title {
	margin-bottom: 0px;
}

.userHeader_Gach {
	background-color: rgb(3, 133, 219);
	height: 2px;
	width: 50px;
	text-align: left;
	display: inline-block;
}

#th_dmk:hover {
	cursor: pointer;
}

#userBody {
	margin-top: 35px;
}

td {
	padding-top: 7px;
	padding-bottom: 7px;
	white-space: nowrap;
}
</style>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
<script
	src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<div class="container" id="userBody">
	<div class="row" style="margin-top: 30px;">
		<div class="col-lg-3">
			<link rel="stylesheet"
				href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
			<script
				src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
			<div class="userHeader" style="font-family:" roboto";"="">
				<div
					style="border-left: 7px solid rgb(3, 133, 219); padding-left: 7px; margin-bottom: 25px">
					<h5 style="padding-left: 15px;">MENU CHỨC NĂNG</h5>
				</div>
				<div>
					<ul style="list-style-type: none; padding-left: 0px">
						<li><i class="fas fa-square"
							style="color: rgb(3, 133, 219); margin-right: 10px; font-size: 10px"></i>
							<a href="<c:url value='/admin'/>" style="color: inherit">Thống
								kê chung</a></li>
						<li><i class="fas fa-square"
							style="color: rgb(3, 133, 219); margin-right: 10px; font-size: 10px"></i>
							<a href="<c:url value='/admin/bill'/>" style="color: inherit">Đơn hàng</a></li>
						<li><i class="fas fa-square"
							style="color: rgb(3, 133, 219); margin-right: 10px; font-size: 10px"></i>
							<a href="<c:url value='/admin/view'/>" style="color: inherit">Danh
								sách sản phẩm</a></li>
						<li><i class="fas fa-square"
							style="color: rgb(3, 133, 219); margin-right: 10px; font-size: 10px"></i>
							<a href="<c:url value='/admin/addItem'/>" style="color: inherit">Thêm
								sản phẩm</a></li>

					</ul>
				</div>
			</div>
		</div>