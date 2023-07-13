// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/ui/global_widgets/widgetinfo/widgetinfopages.dart';
import 'package:gostradav1/app/ui/global_widgets/widgetinfo/widgetinforating.dart';
import 'package:gostradav1/app/ui/global_widgets/widgetinfo/widgetinfotahun.dart';
import 'package:gostradav1/app/ui/pages/library/formpeminjaman.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:sizer/sizer.dart';

class DetailBookv2Page extends StatefulWidget {
  @override
  State<DetailBookv2Page> createState() => _DetailBookv2PageState();
}

class _DetailBookv2PageState extends State<DetailBookv2Page>
    with TickerProviderStateMixin {
  var datas = Get.arguments;
  List<TextEditingController> namebook = [];

  @override
  Widget build(BuildContext context) {
    TabController tc = TabController(length: 2, vsync: this);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Detail Buku",
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: DataColors.primary700),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: DataColors.primary700,
                ),
              );
            },
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.sp, bottom: 2.sp),
              child: Image.asset(
                'assets/icon/nofillbookmark.png',
                height: 20.sp,
                width: 20.sp,
                color: DataColors.primary700,
              ),
            )
          ],
          elevation: 0,
          backgroundColor: DataColors.white,
        ),
        body: Container(
          padding: EdgeInsets.all(0.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20.sp, right: 0.sp, left: 15.sp),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 3.sp),
                        child: Container(
                          height: 130.sp,
                          width: 88.sp,
                          decoration: BoxDecoration(
                            border: Border.all(color: DataColors.black, width: 1.5),
                              borderRadius: BorderRadius.circular(5.sp),
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/coverbuku/bukukesehatan1.jpg'),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.sp,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                  color: DataColors.primary800),
                            ),
                            Text(
                              "Kategori Buku : Kesehatan",
                              style: TextStyle(
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w500,
                                  color: DataColors.primary800),
                            ),
                            SizedBox(height: 2.sp,),
                            Text(
                              "Author : Lilik Djuari",
                              style: TextStyle(
                                  fontSize: 7.sp,
                                  fontWeight: FontWeight.normal,
                                  color: DataColors.blues,
                                  fontStyle: FontStyle.italic),
                            ),
                            SizedBox(height: 2.sp,),
                            Padding(
                              padding: EdgeInsets.only(top: 0.sp, right: 0.sp),
                              child: RatingBar.builder(
                                itemSize: 15.sp,
                                initialRating: 4.0,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 2.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {},
                              ),
                            ),
                            SizedBox(height: 32.sp,),
                            Container(
                              
                              height: 30.sp,
                              width: 175.sp,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.sp),
                                  color: DataColors.primary600),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 45.sp),
                                    child: Image.asset(
                                      'assets/icon/preview.png',
                                      height: 15.sp,
                                      width: 15.sp,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.sp),
                                    child: Text(
                                      "Pinjam Buku",
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.bold,
                                          color: DataColors.white),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Container(
                  padding: EdgeInsets.only(left: 12.sp, right: 12.sp),
                  child: TabBar(
                    controller: tc,
                    isScrollable: true,
                    unselectedLabelColor: DataColors.primary,
                    labelPadding: EdgeInsets.only(left: 0.sp, right: 15.sp),
                    labelColor: DataColors.primary700,
                    indicatorColor: DataColors.primary800,
                    tabs: [
                      Tab(
                        child: Text(
                          "Overview",
                          style: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.w600,),
                              textAlign: TextAlign.left,
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Detail Buku",
                          style: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.sp,
                ),
                Container(
                  padding: EdgeInsets.only(left: 12.sp, right: 12.sp),
                  height: 295.sp,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: tc,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(0.sp),
                            // height: 280.sp,
                            width: double.infinity,
                            child: Text(
                              "Ekonomi dalam pelayanan kesehatan. Ini sudah lamaterjadi. Bukankah tak jarang orang mengeluh bahwa pelayanan rumah sakit sudah terserang virus komersialisasi? Tetapi, sejauh mana sebenarnya pelayanan rumah sakit boleh mengadopsi ilmu ekonomi? Tidak banyak orang yang tahu. Justru buku ini terbit untuk menjawabpertanyaan ini.\n\nKeunggulan buku ini terletak pada kemampuan penulisnya menceritakan bagaimana sebuah rumah sakit harus dikelola sebagai lembaga pelayanan kesehatan yang efisien dan bermutu tanpa mengurangi porsinyaebagai lembaga sosial. Bagi penulisnya, apa pun produk yang dihasilkan rumah sakit, ia harus memperhatikan aspek sosial. Tidaklah terlalu berlebihan bila buku ini pantas dibaca oleh pihak-pihak yang terkait dengan pelayanan rumah sakit, mulai dari dokter, dokter spesialis, manajer rumah sakit, pasien hingga pemerhati kesehatan.",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.normal,
                                  color: DataColors.primary800),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(0.sp),
                            // height: 200.sp,
                            width: double.infinity,
                            child: Text(
                              "Ekonomi dalam pelayanan kesehatan. Ini sudah lamaterjadi. Bukankah tak jarang orang mengeluh bahwa pelayanan rumah sakit sudah terserang virus komersialisasi? Tetapi, sejauh mana sebenarnya pelayanan rumah sakit boleh mengadopsi ilmu ekonomi? Tidak banyak orang yang tahu. Justru buku ini terbit untuk menjawabpertanyaan ini.\n\nKeunggulan buku ini terletak pada kemampuan penulisnya menceritakan bagaimana sebuah rumah sakit harus dikelola sebagai lembaga pelayanan kesehatan yang efisien dan bermutu tanpa mengurangi porsinyaebagai lembaga sosial. Bagi penulisnya, apa pun produk yang dihasilkan rumah sakit, ia harus memperhatikan aspek sosial. Tidaklah terlalu berlebihan bila buku ini pantas dibaca oleh pihak-pihak yang terkait dengan pelayanan rumah sakit, mulai dari dokter, dokter spesialis, manajer rumah sakit, pasien hingga pemerhati kesehatan.",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.normal,
                                  color: DataColors.primary800),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Buku dengan Kategori yang sama",
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                                color: DataColors.primary800),
                          ),
                          Text(
                            "Lihat Semua",
                            style: TextStyle(
                                fontSize: 8.sp,
                                fontWeight: FontWeight.bold,
                                color: DataColors.blues),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Container(
                        padding: EdgeInsets.only( right: 0.sp),
                        height: 150.sp,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(right: 8.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 85.sp,
                                    width: 65.sp,
                                    decoration: BoxDecoration(
                                        color: DataColors.semigrey,
                                        borderRadius:
                                            BorderRadius.circular(5.sp)),
                                  ),
                                  Text(
                                    "Merry Poppins",
                                    style: TextStyle(
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.bold,
                                        color: DataColors.primary800),
                                  ),
                                  Text(
                                    "P.L. Travers",
                                    style: TextStyle(
                                        fontSize: 7.sp,
                                        fontWeight: FontWeight.normal,
                                        color: DataColors.blues),
                                  ),
                                  RatingBar.builder(
                                    
                                    itemSize: 10.sp,
                                    initialRating: 4.0,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 2.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {},
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
