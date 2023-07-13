// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:sizer/sizer.dart';

class HistoryPeminjamanBuku extends StatefulWidget {
  @override
  State<HistoryPeminjamanBuku> createState() => _HistoryPeminjamanBukuState();
}

class _HistoryPeminjamanBukuState extends State<HistoryPeminjamanBuku> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: DataColors.white,
        centerTitle: true,
        title: Text(
          "History Peminjaman",
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: DataColors.primary700),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: DataColors.primary700,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10.sp, right: 10.sp, bottom: 10.sp, top: 20.sp),
        child: Column(
          children: [
            ContentHistory(),
          ],
        ),
      ),
    );
  }
}

class ContentHistory extends StatelessWidget {
  // const ContentHistory({
  //   Key? key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        color: DataColors.bluesky
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.sp),
            child: Container(
              height: 100.sp,
              width: 75.sp,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.sp),
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/coverbuku/bukukesehatan1.jpg'),
                      fit: BoxFit.fill)),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 8.sp, top: 8.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left:110.sp),
                    child: Row(
                      children: [
                        Text(
                          "Sedang Aktif",
                          style: TextStyle(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.normal,
                              color: DataColors.primary800),
                        ),
                        SizedBox(width: 5.sp,),
                        Container(
                          height: 10.sp,
                          width: 10.sp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.sp),
                            color: Colors.green
                          ),
                        )
                      ],
                    ),
                  ),
                  // SizedBox(height: 2.sp,),
                  Text(
                    "Buku Ajar",
                    style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.normal,
                        color: DataColors.primary800),
                  ),
                  Text(
                    "Manajemen Pelayanan Kesehatan",
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: DataColors.primary800,
                    ),
                  ),
                  Text(
                    "Author : Lilik Djuari",
                    style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.normal,
                        color: DataColors.primary,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    height: 22.sp,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 2.sp),
                            child: Text(
                              "Tanggal Pinjam",
                              style: TextStyle(
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.bold,
                                  color: DataColors.primary800),
                            ),
                          ),
                          SizedBox(
                            height: 2.sp,
                          ),
                          Container(
                            padding: EdgeInsets.all(0.sp),
                            height: 15.sp,
                            width: 70.sp,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(20.sp),
                              color: DataColors.primary800,
                            ),
                            child: Center(
                              child: Text(
                                "04 - 06 - 2023",
                                style: TextStyle(
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.normal,
                                    color: DataColors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5.sp,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tanggal Kembali",
                            style: TextStyle(
                                fontSize: 8.sp,
                                fontWeight: FontWeight.bold,
                                color: DataColors.primary800),
                          ),
                          SizedBox(
                            height: 2.sp,
                          ),
                          Container(
                            padding: EdgeInsets.all(0.sp),
                            height: 15.sp,
                            width: 70.sp,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(20.sp),
                              color: DataColors.primary800,
                            ),
                            child: Center(
                              child: Text(
                                "15 - 06 - 2023",
                                style: TextStyle(
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.normal,
                                    color: DataColors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
