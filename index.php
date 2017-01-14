<?php
  require 'fpdf181/fpdf.php';
  //koneksi ke database
  $server     = "localhost";
  $user       = "root";
  $password   = "";
  $db         = "u5961869_bai_main";
  $koneksi = mysql_connect($server, $user, $password);
  if ($koneksi) {
    $buka = mysql_select_db($db);
    if (!$buka) {
      die("Database Eror karena ".mysql_error());
    }
  }else{
    die("Oops! Ada eror pada ".mysql_error());
  }
  //----------------------------------------------------------
  $query = "SELECT id_calon,nama_lengkap,nim,jenis_kelamin,no_hp,line_bbm,mentoring,tanggal_daftar,status from calon_anggota ORDER BY tanggal_daftar DESC";
  $sql = mysql_query($query);
  $data = array();
  while($row = mysql_fetch_assoc($sql)){
  array_push($data, $row);
  }
  //-----------------------------------------------------------

  //LAPORAN START
  $judul = "CALON ANGGOTA BAI YANG SUDAH REGISTRASI VIA WEB";
  $subJudul = "UKM Badan Amalan Islam UDINUS";
  $header = array(
    array("label" => "ID", "length"=>10, "align" =>"L" ),
    array("label" => "NAMA LENGKAP", "length"=>50, "align" =>"L" ),
    array("label" => "NIM", "length"=>40, "align" =>"L" ),
    array("label" => "L/P", "length"=>10, "align" =>"L" ),
    array("label" => "Nomor HP", "length"=>40, "align" =>"L" ),
    array("label" => "LINE/BBM", "length"=>30, "align" =>"L" ),
    array("label" => "Mentoring", "length"=>25, "align" =>"L" ),
    array("label" => "Tanggal Daftar", "length"=>50, "align" =>"L" ),
    array("label" => "Status", "length"=>30, "align" =>"L" )
  );

  //konvert ke pdf
  $pdf = new FPDF('L');
  $pdf->addPage();

  //menampilakan judul laporan
  $pdf->SetFont('Arial','B',18);
  $pdf->Cell(0,10,$judul, '0',1,'C');

  //sub judul
  $pdf->SetFont('Arial','B',14);
  $pdf->Cell(0,10,$subJudul, '0',1,'C');

  //header tabel rgb(39, 174, 96)
  $pdf->SetFont('Arial','B',12);
  $pdf->SetFillColor(39, 174, 96);
  $pdf->SetTextColor(255);
  $pdf->SetDrawColor(128,0,0);
  foreach ($header as $kolom) {
    $pdf->Cell($kolom['length'], 10, $kolom['label'], 1, '0', $kolom['align'], true);
  }
  $pdf->Ln();

  //mengatur font
  $pdf->SetFillColor(255,255,255);
  $pdf->SetTextColor(0);
  $pdf->SetFont('');
  $fill = false;
  //menampilkan data hasil query
  foreach ($data as $baris) {
    $i = 0;
    foreach ($baris as $cell) {
      $pdf->Cell($header[$i]['length'], 5, $cell, 1, '0', $kolom['align'], $fill);
      $i++;
    }
    $fill = !$fill;
    $pdf->Ln();
  }
  //$pdf->Cell(40,10,'FPDF Sukses !!!');
  $pdf->Output();

?>
