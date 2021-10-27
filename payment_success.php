<?php
include"header.php";
?>
					<!DOCTYPE html>
					<html>
						<head>
							<meta charset="UTF-8">
							<title>Thành công</title>
							<link rel="stylesheet" href="css/bootstrap.min.css"/>
							<script src="js/jquery2.js"></script>
							<script src="js/bootstrap.min.js"></script>
							<script src="main.js"></script>
							<style>
								table tr td {padding:10px;}
							</style>
						</head>
					<body>
						
						
							<div class="row">
								<div class="col-md-2"></div>
								<div class="col-md-8">
									<div class="panel panel-default">
										<div class="panel-heading"></div>
										<div class="panel-body">
											<h1 style="text-align:center">THÀNH CÔNG</h1>
											<hr/>
											<h4 style="text-align:center">Xin chào <?php
                             include "db.php";
                            if(isset($_SESSION["uid"]))
                                $sql = "SELECT last_name FROM user_info WHERE user_id='$_SESSION[uid]'";
                                $query = mysqli_query($con,$sql);
                                $row=mysqli_fetch_array($query);
                                
                                echo ''.$row["last_name"].''
                                  ?>,<br> Đơn hàng của bạn đã thanh toán thành công! </br>
											Bạn có thể tiếp tục mua sắm! <br/></h4> <br><br>
										<div style="text-align:center">	<a href="store.php" class="btn btn-success btn-lg">Tiếp tục mua sắm</a></div>
										</div>
										<div class="panel-footer"></div>
									</div>
								</div>
								<div class="col-md-2"></div>
							</div>
						
					</body>
					</html>

				<?php
include"newslettter.php";
include"footer.php";
?>


