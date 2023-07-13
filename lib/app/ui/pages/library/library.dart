// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/controllers/library/library_c.dart';
import 'package:gostradav1/app/ui/pages/library/detailbook.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

class LibraryPage extends StatefulWidget {
  // const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage>
    with TickerProviderStateMixin {
  LibraryController c = Get.find<LibraryController>();

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 180.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5.sp),
                    bottomRight: Radius.circular(5.sp),
                  ),
                  color: DataColors.primary100,
                ),
                padding: EdgeInsets.only(
                    top: 30.sp, bottom: 0.sp, right: 10.sp, left: 10.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Selamat datang, \ndi STRADA LIBRARY",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: DataColors.primary700),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 5.sp),
                          child: Image.asset(
                            'assets/icon/library.png',
                            height: 50.sp,
                            width: 50.sp,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Text(
                      "Mau pinjam buku apa hari ini?",
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: DataColors.primary700),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 35.sp,
                          width: 240.sp,
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 25.sp),
                              hintText: "Masukkan Nama Buku yang ingin dicari",
                              hintStyle: TextStyle(
                                color: DataColors.primary400,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w100,
                              ),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(
                                    left: 8.sp,
                                    right: 5.sp,
                                    top: 8.sp,
                                    bottom: 8.sp),
                                child: Image.asset(
                                  'assets/icon/search.png',
                                  height: 20.sp,
                                  width: 20.sp,
                                  color: HexColor("#3C5595"),
                                ),
                              ),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: DataColors.primary700),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              fillColor: DataColors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: DataColors.white),
                                  borderRadius: BorderRadius.circular(10.sp)),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Fluttertoast.showToast(
                                msg: "ini filter search",
                                toastLength: Toast.LENGTH_LONG);
                          },
                          child: Container(
                            padding: EdgeInsets.all(0.sp),
                            height: 35.sp,
                            width: 35.sp,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.sp),
                                color: DataColors.primary600),
                            child: Padding(
                              padding: EdgeInsets.all(8.sp),
                              child: Image.asset(
                                'assets/icon/filter.png',
                                height: 15.sp,
                                width: 15.sp,
                                color: DataColors.primary100,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              Container(
                padding: EdgeInsets.all(0.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.sp),
                      child: Text(
                        "Kategori Buku",
                        style: TextStyle(
                            color: DataColors.primary700,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp),
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TabBar(
                            // indicator: BoxDecoration(
                            //   border: Border.all(color: DataColors.primary800),
                            //   borderRadius: BorderRadius.circular(10.sp),
                            //   color: DataColors.primary400
                            // ),
                            controller: _tabController,
                            isScrollable: true,
                            labelPadding:
                                EdgeInsets.only(left: 10.sp, right: 10.sp),
                            labelColor: DataColors.primary700,
                            indicatorColor: DataColors.primary800,
                            unselectedLabelColor: DataColors.primary,
                            tabs: [
                              Tab(
                                  child: Text(
                                "Kesahatan",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600),
                              )),
                              Tab(
                                  child: Text(
                                "Kedokteran",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600),
                              )),
                              Tab(
                                  child: Text(
                                "Ilmu Keperawatan",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600),
                              )),
                              Tab(
                                  child: Text(
                                "Kebidanan",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600),
                              )),
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10.sp),
                      height: 150.sp,
                      width: double.maxFinite,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (_, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(DetailBookPage(), arguments: [
                                    c.imgkesehatan[index],
                                    c.jenisbukukesehatan[index],
                                    c.namabukukesehatan[index],
                                    c.penulisbukukesehatan[index],
                                    c.ratingbukukesehatan[index],
                                    c.deskripsibukukesehatan[index],
                                    c.pagesbukukesehatan[index],
                                    c.thnterbitbukes[index],
                                    c.kategoribukes[index],
                                    c.labelbukes[index],
                                  ]);
                                  
                                },
                                child: Container(
                                  width: 85.sp,
                                  height: 200.sp,
                                  margin: EdgeInsets.only(
                                      right: 10.sp, top: 10.sp, bottom: 0.sp),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/coverbuku/' +
                                                  c.imgkesehatan[index]),
                                          fit: BoxFit.fill)),
                                ),
                              );
                            },
                          ),
                          ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (_, index) {
                              return GestureDetector(
                                onTap: () {
                                  Fluttertoast.showToast(
                                          msg: "ini index ke $index",
                                          toastLength: Toast.LENGTH_SHORT)
                                      .toString();
                                },
                                child: Container(
                                  width: 85.sp,
                                  height: 200.sp,
                                  margin: EdgeInsets.only(
                                      right: 10.sp, top: 10.sp, bottom: 0.sp),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.sp),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/coverbuku/' +
                                                  c.imgkedokteran[index]),
                                          fit: BoxFit.fill)),
                                ),
                              );
                            },
                          ),
                          ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (_, index) {
                              return GestureDetector(
                                onTap: () {
                                  Fluttertoast.showToast(
                                          msg: "ini index ke $index",
                                          toastLength: Toast.LENGTH_SHORT)
                                      .toString();
                                },
                                child: Container(
                                  width: 85.sp,
                                  height: 200.sp,
                                  margin: EdgeInsets.only(
                                      right: 10.sp, top: 10.sp, bottom: 0.sp),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.sp),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/coverbuku/' +
                                                  c.imgkeperawatan[index]),
                                          fit: BoxFit.fill)),
                                ),
                              );
                            },
                          ),
                          ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (_, index) {
                              return GestureDetector(
                                onTap: () {
                                  Fluttertoast.showToast(
                                          msg: "ini index ke $index",
                                          toastLength: Toast.LENGTH_SHORT)
                                      .toString();
                                },
                                child: Container(
                                  width: 85.sp,
                                  height: 200.sp,
                                  margin: EdgeInsets.only(
                                      right: 10.sp, top: 10.sp, bottom: 0.sp),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.sp),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/coverbuku/' +
                                                  c.imgkebidanan[index]),
                                          fit: BoxFit.fill)),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.sp),
                      child: Text(
                        "Banyak Dicari ",
                        style: TextStyle(
                            color: DataColors.primary700,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp),
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Container(
                      height: 150.sp,
                      width: double.maxFinite,
                      padding: EdgeInsets.only(left: 10.sp),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (_, index) {
                          return Container(
                            margin: EdgeInsets.only(
                                right: 10.sp, top: 0.sp, bottom: 10.sp),
                            height: 200.sp,
                            width: 85.sp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/coverbuku/' +
                                      c.imgbnykdicari[index]),
                                  fit: BoxFit.fill),
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
      ),
    );
  }
}
