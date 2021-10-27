
    <?php
session_start();
include("../db.php");

error_reporting(0);
if(isset($_GET['action']) && $_GET['action']!="" && $_GET['action']=='delete')
{
$order_id=$_GET['order_id'];

/*this is delet quer*/
mysqli_query($con,"delete from order_products where order_id='$order_id'")or die("query is incorrect...");
mysqli_query($con,"delete from orders_info where order_id='$order_id'")or die("query is incorrect...");
}

///pagination
$page=$_GET['page'];

if($page=="" || $page=="1")
{
$page1=0;	
}
else
{
$page1=($page*10)-10;	
}

include "sidenav.php";
include "topheader.php";
?>
      <!-- End Navbar -->
      <div class="content">
        <div class="container-fluid">
          <!-- your content here -->
          <div class="col-md-14">
            <div class="card ">
              <div class="card-header card-header-primary">
                <h4 class="card-title">Đơn hàng đang chờ <?php echo $page;?> </h4>
              </div>
              <div class="card-body">
                <div class="table-responsive ps">
                  <table class="table table-hover tablesorter " id="">
                    <thead class=" text-primary">
                      <tr><th>Tên </th><th>Sản phẩm</th><th>Số lượng</th><th>Liên lạc</th><th>Địa chỉ</th><th>Thành tiền</th>
                    </tr></thead>
                    <tbody>
                      <?php 
                       
                        $result=mysqli_query($con,"select f_name,product_title,qty,mobile,address, city, state,amt from orders_info,products,order_products,user_info WHERE order_products.product_id=products.product_id and orders_info.order_id=order_products.order_id  AND orders_info.user_id=user_info.user_id Limit $page1,10")or die ("query 1 incorrect.....");
                        $result2=mysqli_query($con,"select order_id from order_products ")or die ("query 2 incorrect.....");
                        while(list($order_id)=mysqli_fetch_array($result2))
                        while(list($f_name,$product_title,$qty,$mobile,$address, $city, $state,$amt)=mysqli_fetch_array($result))
                        {	
                        echo "<tr><td>$f_name</td><td>$product_title</td><td>$qty</td>
                        <td>$mobile </td>
                        <td>$address, $city, $state  </td>
                        <td>$amt đ  </td>
                        <td>
                        <a href='orders.php?order_id=$order_id&action=delete' type='button' rel='tooltip' title='' class='btn btn-danger btn-link btn-sm' data-original-title='Xoá đơn hàng'>
                                <i class='material-icons'>close</i>
                        
                        </td></tr>";
                        }
                        ?>
                    </tbody>
                  </table>
                  
                <div class="ps__rail-x" style="left: 0px; bottom: 0px;"><div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps__rail-y" style="top: 0px; right: 0px;"><div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;"></div></div></div>
              </div>
            </div>
          </div>
          
        </div>
      </div>
      <?php
include "footer.php";
?>