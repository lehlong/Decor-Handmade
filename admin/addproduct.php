  <?php
session_start();
include("../db.php");


if(isset($_POST['btn_save']))
{
$product_title=$_POST['product_title'];
$first_price=$_POST['first_price'];
$product_desc=$_POST['product_desc'];
$product_price=$_POST['product_price'];
$product_cat=$_POST['product_cat'];
$product_brand=$_POST['product_brand'];
$product_keywords=$_POST['product_keywords'];
$interest=$product_price-$first_price;

//picture coding
$picture_name=$_FILES['picture']['name'];
$picture_type=$_FILES['picture']['type'];
$picture_tmp_name=$_FILES['picture']['tmp_name'];
$picture_size=$_FILES['picture']['size'];

if($picture_type=="image/jpeg" || $picture_type=="image/jpg" || $picture_type=="image/png" || $picture_type=="image/gif" || $picture_type=="image/webp")
{
  if($picture_size<=50000000)
  
    $pic_name=time()."_".$picture_name;
    move_uploaded_file($picture_tmp_name,"../product_images/".$pic_name);
    
mysqli_query($con,"INSERT INTO products (product_title, product_desc, product_price, product_cat, product_brand, product_image, product_keywords, first_price, interest) 
VALUES ('$product_title','$product_desc','$product_price','$product_cat','$product_brand','$pic_name','$product_keywords','$first_price','$interest')") or die ("query incorrect");

 header("location: sumit_form.php?success=1");
}

mysqli_close($con);
}
include "sidenav.php";
include "topheader.php";
?>
      <!-- End Navbar -->
      <div class="content">
        <div class="container-fluid">
          <form action="" method="post" type="form" name="form" enctype="multipart/form-data">
          <div class="col-md-7 mx-auto">
            <div class="card">
              <div class="card-header card-header-primary">
                <h5 class="title">Thêm sản phẩm</h5>
              </div>
              <div class="card-body">
                
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>Tên sản phẩm: </label>
                        <input type="text" id="product_title" required name="product_title" class="form-control">
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div class="">
                        <label for="">Ảnh </label>
                        <input type="file" name="picture" required class="btn btn-fill btn-success" id="picture" >
                      </div>
                    </div>
                    
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>Giá nhập:</label>
                        <input type="text" id="first_price" name="first_price" required class="form-control" >
                      </div>
                    </div>

                    <div class="col-md-12">
                      <div class="form-group">
                        <label>Giá bán:</label>
                        <input type="text" id="product_price" name="product_price" required class="form-control" >
                      </div>
                    </div>
                 <div class="col-md-12">
                      <div class="form-group">
                        <label>Chi tiết:</label>
                        <textarea rows="4" cols="80" id="product_desc" required name="product_desc" class="form-control"></textarea>
                      </div>
                      </div> 
                    <div class="col-md-5">
                      <div class="form-group">
                        <label>Thể loại</label>
                        <input type="number" id="product_cat" name="product_cat" required="[1-6]" class="form-control">
                      </div>
                      </div>
                    <div class="col-md-5">
                      <div class="form-group">
                        <label>Từ khoá tìm kiếm</label>
                        <input type="text" id="product_keywords" name="product_keywords" required class="form-control" >
                      </div>
                    </div>
                  </div>
              </div>
              <div class="card-footer">
                  <button type="submit" id="btn_save" name="btn_save" required class="btn btn-fill btn-primary">Thêm sản phẩm</button>
              </div>
            </div>
          </div>
          
        </div>
         </form>
          
        </div>
      </div>
      <?php
include "footer.php";
?>