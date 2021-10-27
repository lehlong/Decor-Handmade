<footer id="footer">
			<!-- top footer -->
			<div class="section">
				<!-- container -->
				<div class="container">
					<!-- row -->
					<div class="row">
						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Giới thiệu</h3>
								
								<ul class="footer-links">
									<li><a href="#"><i class="fa fa-map-marker"></i>Cửa hàng HCM: 0903 80 3556 - 16 Hoa Huệ, P. 7, Q. Phú Nhuận, TP Hồ Chí Minh, Vietnam</a></li>
									<li><a href="#"><i class="fa fa-phone"></i>HCM: 0903 80 3556</a></li>
									<li><a href="#"><i class="fa fa-map-marker"></i>Cửa hàng Hà Nội: 0973 628 417 - Nhà 107 ngõ 178 Nguyễn Lương Bằng, P. Quang Trung, Q. Đống Đa</a></li>
									<li><a href="#"><i class="fa fa-phone"></i>HN: 0973628417</a></li>
									<li><a href="#"><i class="fa fa-envelope-o"></i>vietgiftcenter@gmail.com</a></li>
								</ul>
							</div>
						</div>
						<div class="col-md-6 text-center" style="margin-top:80px;color:#fff">
							<ul class="footer-payments">
								<li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
								<li><a href="#"><i class="fa fa-credit-card"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
							</ul>
							<span class="copyright">
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved
							
							</span>
						</div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Bạn quan tâm?</h3>
								<ul class="footer-links">
									<li><a href="#"><i class="fa fa-money" aria-hidden="true"></i>Mua sỉ, giảm giá</a></li>
									<li><a href="#"><i class="fa fa-user" aria-hidden="true"></i>Craft & More tuyển dụng</a></li>
									<li><a href="#"><i class="fa fa-question-circle" aria-hidden="true"></i>Câu hỏi thường gặp</a></li>
									<li><a href="#"><i class="fa fa-window-maximize" aria-hidden="true"></i>Góp ý, khiếu nại</a></li>
									<li><a href="#"><i class="fa fa-arrows-h" aria-hidden="true"></i>Đổi trả hàng</a></li>
									<li><a href="#"><i class="fa fa-bookmark" aria-hidden="true"></i>Chính sách chung</a></li>
								</ul>
							</div>
						</div> 

						<div class="clearfix visible-xs"></div>

						
					</div>
					<!-- /row -->
				</div>
				<!-- /container -->
			</div>
			<!-- /top footer -->
                

			<!-- bottom footer -->
			
			<!-- /bottom footer -->
		</footer>
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/slick.min.js"></script>
		<script src="js/nouislider.min.js"></script>
		<script src="js/jquery.zoom.min.js"></script>
		<script src="js/main.js"></script>
		<script src="js/actions.js"></script>
		<script src="js/sweetalert.min"></script>
		<script src="js/jquery.payform.min.js" charset="utf-8"></script>
    <script src="js/script.js"></script>
		<script>var c = 0;
        function menu(){
          if(c % 2 == 0) {
            document.querySelector('.cont_drobpdown_menu').className = "cont_drobpdown_menu active";    
            document.querySelector('.cont_icon_trg').className = "cont_icon_trg active";    
            c++; 
              }else{
            document.querySelector('.cont_drobpdown_menu').className = "cont_drobpdown_menu disable";        
            document.querySelector('.cont_icon_trg').className = "cont_icon_trg disable";        
            c++;
              }
        }
           
		
</script>
    <script type="text/javascript">
		$('.block2-btn-addcart').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.block2-name').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});

		$('.block2-btn-addwishlist').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.block2-name').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");
			});
		});
	</script>
	
