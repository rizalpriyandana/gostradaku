// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/ui/pages/library/historypeminjaman.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'dart:math';

class DetailPeminjamanBuku extends StatefulWidget {
  // const DetailPeminjamanBuku({super.key});

  @override
  State<DetailPeminjamanBuku> createState() => _DetailPeminjamanBukuState();
}

class _DetailPeminjamanBukuState extends State<DetailPeminjamanBuku> {
  var datapinjam = Get.arguments;

  String generateRandomNumber() {
    Random random = Random();
    int randomNumber = random.nextInt(90000000 - 10000000 + 1) + 10000000;
    return randomNumber.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: DataColors.white,
        centerTitle: true,
        title: Text(
          "Preview Peminjaman",
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: DataColors.primary700),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                // margin: EdgeInsets.only(left: 20.sp),
                padding: EdgeInsets.only(top: 5.sp),
                height: 150.sp,
                width: 200.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  color: DataColors.blusky,
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Sucsess",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: DataColors.primary800,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Icon(
                      Icons.check_circle,
                      color: DataColors.primary800,
                      size: 100.sp,
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Text(
                      "Kode Transaksi : PJM${generateRandomNumber()}",
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: DataColors.primary800,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Informasi",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: DataColors.primary800),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Nama Buku",
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.normal,
                        color: DataColors.primary900),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      datapinjam[0],
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.normal,
                          color: DataColors.primary900),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.sp,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Kategori Buku",
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.normal,
                        color: DataColors.primary800),
                  ),
                  Text(
                    datapinjam[1],
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.normal,
                        color: DataColors.primary800),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.sp,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Label Buku",
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.normal,
                        color: DataColors.primary800),
                  ),
                  Text(
                    datapinjam[2],
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.normal,
                        color: DataColors.primary800),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.sp,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tanggal Peminjaman",
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.normal,
                        color: DataColors.primary800),
                  ),
                  Text(
                    datapinjam[3],
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.normal,
                        color: DataColors.primary800),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.sp,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tanggal Pengembalian",
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.normal,
                        color: DataColors.primary800),
                  ),
                  Text(
                    datapinjam[4],
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.normal,
                        color: DataColors.primary800),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 20.sp),
        child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.to(HistoryPeminjamanBuku());
                    },
                    child: Container(
                      width: 135.sp,
                      height: 7.h,
                      decoration: BoxDecoration(
                        color: DataColors.primary,
                        borderRadius: BorderRadius.circular(10.sp)
                      ),
                      margin: EdgeInsets.only(left: 10.sp),
                      padding: EdgeInsets.only(left: 8.sp, right: 8.sp),
                      child: Center(
                        child: Text(
                          "History Peminjaman",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: DataColors.white,
                              fontSize: 10.sp),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Get.to(LibraryPage());
                    },
                    child: Container(
                      width: 135.sp,
                      height: 7.h,
                      decoration: BoxDecoration(
                        color: DataColors.primary600,
                        borderRadius: BorderRadius.circular(10.sp)
                      ),
                      margin: EdgeInsets.only(right: 10.sp),
                      padding: EdgeInsets.only(left: 8.sp, right: 8.sp),
                      child: Center(
                        child: Text(
                          "Halaman Utama",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: DataColors.white,
                              fontSize: 10.sp),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
