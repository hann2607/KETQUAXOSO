<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DÒ KẾT QUẢ XỔ SỐ</title>
<!-- Link API Trang kết quả xổ số minhngoc.net.vn -->
<script language="javascript"
	src="//www.minhngoc.com.vn/jquery/jquery-1.7.2.js"></script>
<link rel="stylesheet" type="text/css"
	href="//www.minhngoc.com.vn/style/bangketqua_mini.css" />


<!-- Bootstrap CSS v5.2.1 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
	crossorigin="anonymous">

<!-- link fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

<!-- Angular js  -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.8.3/angular.min.js"
	integrity="sha512-KZmyTq3PLx9EZl0RHShHQuXtrvdJ+m35tuOiwlcZfs/rE7NZv29ygNA8SFCkMXTnYZQK2OX0Gm2qKGfvWEtRXA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/angular-messages/1.8.3/angular-messages.min.js"
	integrity="sha512-a+xgEyXVK7r+KKIDYyHtFfLi9LItmFDff6Z4/5lrGmL03u1vtFCjQXQz3dSIwOapB3YIRMBO1+IQj6ptnxAh/A=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<style>
a {
	color: #FFFFFF;
	text-decoration: none;
	font-weight: 500;
	-webkit-transition: 0.2s color;
	transition: 0.2s color;
}

a:hover, a:focus {
	color: #D10024;
	text-decoration: none;
	outline: none;
}

ul, ol {
	margin: 0;
	padding: 0;
	list-style: none;
}
</style>

</head>

<body ng-app="myapp" ng-controller="mycontroller">
	<header>
		<img src="http://picture.dzogame.vn/Img/cms13013043606460682739.jpg"
			alt="" width="100%" height="700vh">
	</header>
	<main class="container" style="height: 54vh;">
		<div class="row mt-4">
			<div id="box_kqxs_minhngoc" class="col-lg-9 col-12 ms-4">
				<script language="javascript">
					bgcolor = "#A40E0D";
					titlecolor = "#FFFCF9";
					dbcolor = "#000000";
					fsize = "24px";
					kqwidth = "70%";
				</script>
				<script type='text/javascript'
					src="//www.minhngoc.com.vn/getkqxs${tinh != null ? tinh : '/tp-hcm'}${ngay}.js"></script>
			</div>
			<div id="do-kqxs" class="col-2">
				<h2 class="text-nowrap text-center mb-3" style="margin-left: -23%;">DÒ
					KẾT QUẢ XỔ SỐ</h2>
				<form action="/KQXS" class="Do-KQXS" name="DoKQXS" method="post"
					novalidate>
					<div class="d-lg-flex justify-content-around">
						<select name="chontinh" id="tinh-id" class="form-select col-5"
							aria-label="Default select example" onchange="chonTinhOnChange()">

						</select>
						<div class="col-2 hidden-lg"></div>
						<select name="chonngay" id="ngay-id" class="form-select col-5"
							aria-label="Default select example">
						</select>
					</div>
					<div class="d-flex" style="margin-left: -58%;">
						<div class="mb-3 mt-3 me-4 col-12">
							<label for="mave" class="form-label">DÃY SỐ CỦA BẠN</label> <input
								type="text" class="form-control" id="mave" name="mave"
								aria-describedby="maveHelp" placeholder="Nhập dãy số..."
								ng-model="MaVeModel" minlength="5" maxlength="6" required
								pattern="^[0-9]+$">
						</div>
						<div class="mb-3 mt-5 col-8">
							<button type="submit" class="btn btn-primary" ng-disabled="DoKQXS.$invalid"
								formaction="/Result"
								style="background-color: #A40E0D; border: none;">DÒ KẾT
								QUẢ</button>
						</div>
					</div>
					

					<!-- ERROR FOR MAVE -->
					<div ng-if="DoKQXS.$submitted || DoKQXS.mave.$dirty" class="mb-4"
						ng-messages="DoKQXS.mave.$error"
						style="color: #D10024; margin-left: -58%;" role="alert">
						<div ng-message="required">
							<strong>Dãy số không được để trống!</strong>
						</div>
						<div ng-message="pattern">
							<strong>Chỉ được nhập số!</strong>
						</div>
						<div ng-message="minlength">
							<strong>Vui lòng nhập đúng dãy số trên vé!</strong>
						</div>
						<div ng-message-default>
							<strong>Dãy số không phù hợp!</strong>
						</div>
					</div>
					<button type="submit" class="btn btn-primary" ${disableButton}
						formaction="/ShowResult"
						style="background-color: #A40E0D; border: none;" >HIỂN THỊ
						KẾT QUẢ</button>

					<div class="d-flex" style="margin-left: -30%;">
						<h1 class="mt-2 text-center">${messages}</h1>
					</div>
				</form>
			</div>
		</div>

	</main>

	<!-- Footer -->
	<footer class="text-center text-lg-start text-muted mt-4"
		style="background-color: #1E1F29;">
		<!-- Section: Social media -->
		<section
			class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
			<!-- Left -->
			<div class="me-5 d-none d-lg-block text-color-footer">
				<span>Kết nối với tôi trên các trang mạng xã hội:</span>
			</div>
			<!-- Left -->

			<!-- Right -->
			<div>
				<a href="#" class="me-4 a-footer"> <i class="fab fa-facebook-f"></i>
				</a> <a href="#" class="me-4 a-footer"> <i class="fab fa-twitter"></i>
				</a> <a href="#" class="me-4 a-footer"> <i class="fab fa-google"></i>
				</a> <a href="#" class="me-4 a-footer"> <i class="fab fa-instagram"></i>
				</a> <a href="#" class="me-4 a-footer"> <i class="fab fa-linkedin"></i>
				</a> <a href="#" class="me-4 a-footer"> <i class="fab fa-github"></i>
				</a>
			</div>
			<!-- Right -->
		</section>
		<!-- Section: Social media -->

		<!-- Copyright -->
		<div class="text-center p-4"
			style="background-color: #15161D; color: #FFFFFF;">
			© 2023 Copyright: <a class="fw-bold a-footer" href="#">Hân Nguyễn</a>
		</div>
		<!-- Copyright -->
	</footer>
	<!-- Footer -->


	<!-- javascript -->
	<!-- 	lấy ra danh sách giải thưởng -->
	<script type="text/javascript">
		// đổ dữ liệu thẻ select tỉnh
		for (var option of document.getElementById("box_kqxs_tinh").options) {
			document.getElementById("tinh-id").add(option);
		}

		// đổ dữ liệu thẻ select ngày
		for (var option of document.getElementById("box_kqxs_ngay").options) {
			document.getElementById("ngay-id").add(option);
		}

		// cập nhật lại bảng kết quả
		document.getElementById("box_kqxs_tinh").onchange();

		// Thêm sự kiện cho thẻ select tỉnh
		var chonTinhOnChange = function () {
			// cập nhật lại bảng kết quả xổ số khi dò kết quả
			let scriptEle = document.createElement("script");
			let tinh = document.getElementById("tinh-id").value;
			let ngay = document.getElementById("ngay-id").value;
			let src = "//www.minhngoc.com.vn/getkqxs/" + tinh + "/" + ngay + ".js";
			scriptEle.setAttribute("src", src);
			document.getElementById("box_kqxs_minhngoc").appendChild(scriptEle);

			scriptEle.onload = function () {
				// đổ dữ liệu thẻ select ngày
				document.getElementById("ngay-id").innerText = null;
				for (var option of document.getElementById("box_kqxs_ngay").options) {
					document.getElementById("ngay-id").add(option);
				}
			}
			document.getElementById("box_kqxs_tinh").onchange();
			document.getElementById("box_kqxs_ngay").onchange();
		}
		
		// Gửi list giải về cho server
		
			// cập nhật lại bảng kết quả xổ số khi dò kết quả
			let scriptEle = document.createElement("script");
			let tinh = document.getElementById("tinh-id").value;
			let ngay = document.getElementById("ngay-id").value;
			let src = "//www.minhngoc.com.vn/getkqxs/" + tinh + "/" + ngay + ".js";
			scriptEle.setAttribute("src", src);
			document.getElementById("box_kqxs_minhngoc").appendChild(scriptEle);

			scriptEle.onload = function () {
				// JSON chứa list giải thưởng
				var listGiai = {
					tinh: document.getElementById("box_kqxs_tinh").value,
					ngay: document.getElementById("box_kqxs_ngay").value,
					giaidb: document.getElementsByClassName("giaidb")[0].innerText,
					giai1: document.getElementsByClassName("giai1")[0].innerText,
					giai2: document.getElementsByClassName("giai2")[0].innerText,
					giai3: document.getElementsByClassName("giai3")[0].innerText,
					giai4: document.getElementsByClassName("giai4")[0].innerText,
					giai5: document.getElementsByClassName("giai5")[0].innerText,
					giai6: document.getElementsByClassName("giai6")[0].innerText,
					giai7: document.getElementsByClassName("giai7")[0].innerText,
					giai8: document.getElementsByClassName("giai8")[0].innerText
				}
				console.log(listGiai)
				$.ajax({
					type: "POST",
					url: window.location.href,
					data: listGiai,
					success: function (result) {
						console.log("Post JSON Success")
					},
					error: function (result) {
						console.log("Post JSON error")
					}
				})
			}
		

		// Angular js
		var app = angular.module("myapp", ['ngMessages']);
		app.controller("mycontroller", function ($scope, $window, $rootScope) {

		});
	</script>
	<!-- End javascript -->
</body>

</html>