<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="col-lg-9">
	<h4 class="userHeader_Title">THÊM SẢN PHẨM</h4>
	<hr class="userHeader_Gach">
	<div class="row">
		<div class="col">
			<p style="color: red">${message}</p>
			<form id="form" action="addItem" method="POST"
				enctype="multipart/form-data">
				<div class="form-group">
					<label>Loại sản phẩm: </label> <select name="type" id="type"
						class="form-control">
						<option value="-1">Chọn loại sản phẩm</option>
						<option value="0">Giày</option>
						<option value="1">Dép</option>
					</select>
				</div>
				<div class="form-group">
					<label>Tình trạng: </label> <select name="isNew" id="isNew"
						class="form-control">
						<option value="1">Hàng mới</option>
						<option value="0">Hàng bình thường</option>
					</select>
				</div>
				<div class="form-group">
					<label>Tên sản phẩm:</label> <input class="form-control"
						type="text" id="name" name="name">
				</div>
				<div class="form-group">
					<label>Mô tả:</label> <input class="form-control" type="text"
						id="description" name="description">
				</div>
				<div class="form-group">
					<label>Màu sắc:</label> <select class="form-control" name="color"
						id="color">
						<option value="-1" selected>Chọn màu sắc</option>
						<c:forEach items="${colors}" var="color">
							<option value="${color.id}">${color.name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label>Giá:</label> <input class="form-control" type="number"
						id="price" name="price">
				</div>
				<div class="form-group">
					<label>Giảm: (%)</label> <input class="form-control" type="number"
						id="sale" name="sale" value="0">
				</div>
				<div class="form-group">
					<label>Thump:</label> <input type="file" name="thump" id="thump" />
				</div>
				<div class="form-group">
					<label>Ảnh:</label> <input type="file" name="images" id="images"
						multiple />
				</div>
				<button class="btn btn-primary btn-sm font-weight-bold form-control"
					type="submit">THỰC HIỆN</button>
			</form>
		</div>
	</div>
</div>
