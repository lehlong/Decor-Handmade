<?php
if (isset($_POST["login_user_with_product"])) {
		$product_list = $_POST["product_id"];
		$json_e = json_encode($product_list);
		setcookie("product_list",$json_e,strtotime("+1 day"),"/","","",TRUE);

}
?>
	<div class="wait overlay">
		<div class="loader"></div>
	</div>
	<div class="container-fluid">
				<!-- row -->
				

					<div class="login-marg">
						<!-- Billing Details -->
						
						
						<!-- /Billing Details -->
						
						
								<form onsubmit="return false" id="login" class="login100-form ">
									<div class="billing-details jumbotron">
                                    <div class="section-title">
                                        <h2 class="login100-form-title p-b-49" >Đăng nhập</h2>
                                    </div>
                                   
                                    
                                    <div class="form-group">
                                       <label for="email">Tên tài khoản</label>
                                        <input class="input input-borders" type="email" name="email" placeholder="Email..." id="password" required>
                                    </div>
                                    
                                    <div class="form-group">
                                       <label for="email">Mật khẩu</label>
                                        <input class="input input-borders" type="password" name="password" placeholder="Mật khẩu..." id="password" required>
                                    </div>
                                    
                                    <div class="text-pad" >
                                       <a href="#">
                                          Quên mật khẩu?
                                       </a>
                                        
                                    </div>
                                    
                                        <input class="primary-btn btn-block"   type="submit"  Value="Đăng nhập">                 
     <div class="panel-footer"><div class="alert alert-danger"><h4 id="e_msg"></h4></div></div>
    </div>
     </form>
      <!-- Shiping Details -->
						
						<!-- /Shiping Details -->

						<!-- Order notes -->
						
						<!-- /Order notes -->
					</div>

					<!-- Order Details -->
					
					<!-- /Order Details -->
				
				<!-- /row -->
			</div>