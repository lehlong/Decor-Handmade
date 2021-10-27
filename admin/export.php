<?php
session_start();
include("../db.php");
require './vendor/autoload.php';
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use Maatwebsite\Excel\Concerns\ShouldAutoSize; 

if(isset($_POST['btn11'])){

$rowCount = 1;
$spreadsheet = new Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();
$sheet->setCellValue('A'.$rowCount, 'user_id'); 
$sheet->setCellValue('B'.$rowCount, 'first_name ');
$sheet->setCellValue('C'.$rowCount, 'last_name ');
$sheet->setCellValue('D'.$rowCount, 'email');
$sheet->setCellValue('E'.$rowCount, 'password ');
$sheet->setCellValue('F'.$rowCount, 'mobile ');
$sheet->setCellValue('G'.$rowCount, 'address1 ');
$sheet->setCellValue('H'.$rowCount, 'address2 ');
    $spreadsheet->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
    $spreadsheet->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
    $spreadsheet->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
    $spreadsheet->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
    $spreadsheet->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
    $spreadsheet->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
    $spreadsheet->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
    $spreadsheet->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);

$query = "SELECT * FROM user_info";
$run_query = mysqli_query($con,$query);
while($row = mysqli_fetch_array($run_query))
{
    $rowCount++;
    $sheet->setCellValue('A'.$rowCount, $row['user_id']);
    $sheet->setCellValue('B'.$rowCount, $row['first_name']);
    $sheet->setCellValue('C'.$rowCount, $row['last_name']);
    $sheet->setCellValue('D'.$rowCount, $row['email']);
    $sheet->setCellValue('E'.$rowCount, $row['password']);
    $sheet->setCellValue('F'.$rowCount, $row['mobile']);
    $sheet->setCellValue('G'.$rowCount, $row['address1']);
    $sheet->setCellValue('H'.$rowCount, $row['address2']);
}
$writer = new Xlsx($spreadsheet);
$writer->save('Danh sách người dùng.xlsx');
header("location: sumit_form.php?success=2");
}

if(isset($_POST['btn22'])){

    $rowCount1 = 1;
    $spreadsheet = new Spreadsheet();
    $sheet = $spreadsheet->getActiveSheet();
    $sheet->setCellValue('A'.$rowCount1, 'product_id');
    $sheet->setCellValue('B'.$rowCount1, 'product_cat');
    $sheet->setCellValue('C'.$rowCount1, 'product_brand');
    $sheet->setCellValue('D'.$rowCount1, 'product_title');
    $sheet->setCellValue('E'.$rowCount1, 'first_price');
    $sheet->setCellValue('F'.$rowCount1, 'product_price');
    $sheet->setCellValue('G'.$rowCount1, 'interest');
    $sheet->setCellValue('H'.$rowCount1, 'product_desc');
    $sheet->setCellValue('I'.$rowCount1, 'product_image');
    $sheet->setCellValue('J'.$rowCount1, 'product_keywords');
    $spreadsheet->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
    $spreadsheet->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
    $spreadsheet->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
    $spreadsheet->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
    $spreadsheet->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
    $spreadsheet->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
    $spreadsheet->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
    $spreadsheet->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);
    $spreadsheet->getActiveSheet()->getColumnDimension('J')->setAutoSize(true);
    
   
    $query = "SELECT * FROM products";
    $run_query = mysqli_query($con,$query);
    while($row = mysqli_fetch_array($run_query))
    {
        $rowCount1++;
        $sheet->setCellValue('A'.$rowCount1, $row['product_id']);
        $sheet->setCellValue('B'.$rowCount1, $row['product_cat']);
        $sheet->setCellValue('C'.$rowCount1, $row['product_brand']);
        $sheet->setCellValue('D'.$rowCount1, $row['product_title']);
        $sheet->setCellValue('E'.$rowCount1, $row['first_price']);
        $sheet->setCellValue('F'.$rowCount1, $row['product_price']);
        $sheet->setCellValue('G'.$rowCount1, $row['interest']);
        $sheet->setCellValue('H'.$rowCount1, $row['product_desc']);
        $sheet->setCellValue('I'.$rowCount1, $row['product_image']);
        $sheet->setCellValue('J'.$rowCount1, $row['product_keywords']);
    }
    $writer1 = new Xlsx($spreadsheet);
    $writer1->save('Danh sách sản phẩm.xlsx');
    header("location: sumit_form.php?success=2");
    }


include "sidenav.php";
include "topheader.php";



?>

        <div class="content">
        <div class="container-fluid">
        <?php  //success message
            if(isset($_POST['success1'])) {
            $success = $_POST["success1"];
            echo "<h1 style='color:#0C0'>XUẤT FILE THÀNH CÔNG</h1>";
            }
            ?>
        <div class="col-md-7">
            <div class="card ">
              <div class="card-header card-header-primary">
                <h4 class="card-title">Xuất File </h4>
              </div>
              <div class="table-responsive ps">
                <table class="table tablesorter ">
                <div class="card-body">
                    <thead class=" text-primary">
                        <form action="" method="POST">
                    <tr>
                      <th></th> <th></th><th> XUẤT FILE DỮ LIỆU NGƯỜI DÙNG</th>
                        <th><button class=" btn btn-success" name="btn11" type="submit">Xuất file</button></th>
                    </tr>
                        </form>
                    </thead> 
                    <div class="card-body">
                    <thead class=" text-primary">
                        <form action="" method="POST">
                    <tr>
                       <th></th><th></th><th> XUẤT FILE DANH SÁCH SẢN PHẨM</th>
                        <th><button class=" btn btn-success" name="btn22" type="submit">Xuất file</button></th>
                    </tr>
                        </form>
                    </thead> 
