// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gostradav1/app/data/models/library/library_m.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/library/library_c.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HistoryPeminjamanBuku extends StatefulWidget {
  @override
  State<HistoryPeminjamanBuku> createState() => _HistoryPeminjamanBukuState();
}

class _HistoryPeminjamanBukuState extends State<HistoryPeminjamanBuku>
    with TickerProviderStateMixin {
  LibraryController lc = Get.find<LibraryController>();
  final box = GetStorage();
  var isLoading = true.obs;
  late Map data = box.read("dataUser") as Map<String, dynamic>;
  RxList<CurrentLoanModel> listcurrent = <CurrentLoanModel>[].obs;
  RxList<HistoryLoanModel> listhistory = <HistoryLoanModel>[].obs;

  @override
  void initState() {
    currentloan(data['nim']);
    historyloan(data['nim']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController tc = TabController(length: 2, vsync: this);

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
          leading: Padding(
            padding: EdgeInsets.only(top: 11.sp, left: 10.sp),
            child: GestureDetector(
              onTap: () {
                lc.allbook(data['nim']);
                Get.back();
              },
              child: FaIcon(
                FontAwesomeIcons.angleLeft,
                color: DataColors.primary800,
                size: 18.sp,
              ),
            ),
          ),
        ),
        body: WillPopScope(
          onWillPop: () {
            lc.allbook(data['nim']);
            return Future.value(true);
          },
          child: Obx(
            () {
              if (isLoading.isTrue) {
                return Container(
                  padding: EdgeInsets.only(
                      left: 10.sp, right: 10.sp, bottom: 10.sp, top: 10.sp),
                  child: Column(
                    children: [
                      Container(
                        child: TabBar(
                            controller: tc,
                            isScrollable: true,
                            unselectedLabelColor: DataColors.primary,
                            labelPadding:
                                EdgeInsets.only(left: 20.sp, right: 20.sp),
                            labelColor: DataColors.primary800,
                            indicatorColor: DataColors.primary700,
                            tabs: [
                              Tab(
                                child: Text(
                                  "Peminjaman Saat Ini",
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "History Peminjaman",
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ]),
                      ),
                      Expanded(
                          child: TabBarView(
                        controller: tc,
                        children: [
                          Center(
                              child: LoadingAnimationWidget.fourRotatingDots(
                                  color: DataColors.primary700, size: 40.sp)),
                          Center(
                              child: LoadingAnimationWidget.fourRotatingDots(
                                  color: DataColors.primary700, size: 40.sp))
                        ],
                      ))
                    ],
                  ),
                );
              } else if (listcurrent.isEmpty && listhistory.isEmpty) {
                return Container(
                  padding: EdgeInsets.only(
                      left: 10.sp, right: 10.sp, bottom: 10.sp, top: 10.sp),
                  child: Column(
                    children: [
                      Container(
                        child: TabBar(
                            controller: tc,
                            isScrollable: true,
                            unselectedLabelColor: DataColors.primary,
                            labelPadding:
                                EdgeInsets.only(left: 20.sp, right: 20.sp),
                            labelColor: DataColors.primary800,
                            indicatorColor: DataColors.primary700,
                            tabs: [
                              Tab(
                                child: Text(
                                  "Peminjaman Saat Ini",
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "History Peminjaman",
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ]),
                      ),
                      Expanded(
                          child: TabBarView(
                        controller: tc,
                        children: [
                          Center(
                            child: SizedBox(
                              width: 100.w,
                              height: 20.h,
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: const AssetImage(
                                        'assets/images/datatidakada.png'),
                                    height: 110.sp,
                                  ),
                                  Text(
                                    "Belum Ada Data",
                                    style:
                                        TextStyle(color: DataColors.Neutral300),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: SizedBox(
                              width: 100.w,
                              height: 20.h,
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: const AssetImage(
                                        'assets/images/datatidakada.png'),
                                    height: 110.sp,
                                  ),
                                  Text(
                                    "Belum Ada Data",
                                    style:
                                        TextStyle(color: DataColors.Neutral300),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                );
              } else if (listcurrent.isEmpty) {
                return Container(
                  padding: EdgeInsets.only(
                      left: 10.sp, right: 10.sp, bottom: 10.sp, top: 10.sp),
                  child: Column(
                    children: [
                      Container(
                        child: TabBar(
                            controller: tc,
                            isScrollable: true,
                            unselectedLabelColor: DataColors.primary,
                            labelPadding:
                                EdgeInsets.only(left: 20.sp, right: 20.sp),
                            labelColor: DataColors.primary800,
                            indicatorColor: DataColors.primary700,
                            tabs: [
                              Tab(
                                child: Text(
                                  "Peminjaman Saat Ini",
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "History Peminjaman",
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ]),
                      ),
                      Expanded(
                          child: TabBarView(
                        controller: tc,
                        children: [
                          Center(
                            child: SizedBox(
                              width: 100.w,
                              height: 20.h,
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: const AssetImage(
                                        'assets/images/datatidakada.png'),
                                    height: 110.sp,
                                  ),
                                  Text(
                                    "Belum Ada Data",
                                    style:
                                        TextStyle(color: DataColors.Neutral300),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Obx(() =>  Padding(
                            padding: EdgeInsets.only(left: 5.sp, top: 10.sp),
                            child: ListView.builder(
                              itemCount: listhistory.length,
                              itemBuilder: (context, index) {
                                // final datalistloan = listhistory[index];
                                return 
                                LoanHistory(
                                    itemCode:
                                        listhistory[index].data[0].itemCode,
                                    title: listhistory[index].data[0].title,
                                    loandate:
                                        listhistory[index].data[0].loanDate,
                                    returndate:
                                        listhistory[index].data[0].returnDate);
                              },
                            ),
                          ),)
                        ],
                      ))
                    ],
                  ),
                );
              } else if (listhistory.isEmpty) {
                return Container(
                  padding: EdgeInsets.only(
                      left: 10.sp, right: 10.sp, bottom: 10.sp, top: 10.sp),
                  child: Column(
                    children: [
                      Container(
                        child: TabBar(
                            controller: tc,
                            isScrollable: true,
                            unselectedLabelColor: DataColors.primary,
                            labelPadding:
                                EdgeInsets.only(left: 20.sp, right: 20.sp),
                            labelColor: DataColors.primary800,
                            indicatorColor: DataColors.primary700,
                            tabs: [
                              Tab(
                                child: Text(
                                  "Peminjaman Saat Ini",
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "History Peminjaman",
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ]),
                      ),
                      Expanded(
                          child: TabBarView(
                        controller: tc,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 0.sp, top: 10.sp),
                            child: ListView.builder(
                              itemCount: listcurrent.length,
                              itemBuilder: (context, index) {
                                // final datalist = listcurrent[index];
                                return CurrentLoan(
                                  itemCode: listcurrent[index].data[0].itemCode,
                                  title: listcurrent[index].data[0].title,
                                  loandate: listcurrent[index].data[0].loanDate,
                                  duedate: listcurrent[index].data[0].dueDate,
                                  onTapReturn: () {
                                    Get.defaultDialog(
                                        onConfirm: () => returned(
                                            listcurrent[index].data[0].itemCode,
                                            data['nim']),
                                        onCancel: () => dispose(),
                                        middleText:
                                            "Apakah anda ingin mengebalikan Buku ini");
                                  },
                                );
                              },
                            ),
                          ),
                          Center(
                            child: SizedBox(
                              width: 100.w,
                              height: 20.h,
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: const AssetImage(
                                        'assets/images/datatidakada.png'),
                                    height: 110.sp,
                                  ),
                                  Text(
                                    "Belum Ada Data",
                                    style:
                                        TextStyle(color: DataColors.Neutral300),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                );
              } else {
                return Container(
                  padding: EdgeInsets.only(
                      left: 10.sp, right: 10.sp, bottom: 10.sp, top: 10.sp),
                  child: Column(
                    children: [
                      Container(
                        child: TabBar(
                            controller: tc,
                            isScrollable: true,
                            unselectedLabelColor: DataColors.primary,
                            labelPadding:
                                EdgeInsets.only(left: 20.sp, right: 20.sp),
                            labelColor: DataColors.primary800,
                            indicatorColor: DataColors.primary700,
                            tabs: [
                              Tab(
                                child: Text(
                                  "Peminjaman Saat Ini",
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "History Peminjaman",
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ]),
                      ),
                      Expanded(
                          child: TabBarView(
                        controller: tc,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 0.sp, top: 10.sp),
                            child: ListView.builder(
                              itemCount: listcurrent.length,
                              itemBuilder: (context, index) {
                                // final datalist = listcurrent[index];
                                return CurrentLoan(
                                  itemCode: listcurrent[index].data[0].itemCode,
                                  title: listcurrent[index].data[0].title,
                                  loandate: listcurrent[index].data[0].loanDate,
                                  duedate: listcurrent[index].data[0].dueDate,
                                  onTapReturn: () {
                                    Get.defaultDialog(
                                        onConfirm: () => returned(
                                            listcurrent[index].data[0].itemCode,
                                            data['nim']),
                                        onCancel: () => dispose(),
                                        middleText:
                                            "Apakah anda ingin mengebalikan Buku ini");
                                  },
                                );
                              },
                            ),
                          ),
                          Obx(() =>  Padding(
                            padding: EdgeInsets.only(left: 5.sp, top: 10.sp),
                            child: ListView.builder(
                              itemCount: listhistory.length,
                              itemBuilder: (context, index) {
                                // final datalistloan = listhistory[index];
                                return 
                                LoanHistory(
                                    itemCode:
                                        listhistory[index].data[0].itemCode,
                                    title: listhistory[index].data[0].title,
                                    loandate:
                                        listhistory[index].data[0].loanDate,
                                    returndate:
                                        listhistory[index].data[0].returnDate);
                              },
                            ),
                          ),)
                          
                        ],
                      ))
                    ],
                  ),
                );
              }
            },
          ),
        ));
  }

  historyloan(String memberId) async {
    final Map<String, dynamic> databody = {
      Library.memberId: memberId,
    };

    var response = await http.post(
        Uri.parse(
            "https://lib.strada.ac.id/index.php?p=api/loan/historyloan"),
        body: databody);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['error'] == true) {
        isLoading.value = false;
        return null;
      } else {
        var result = HistoryLoanModel.fromJson(data);
        
        listhistory.value = result.data
            .map((data) => HistoryLoanModel(error: false, data: [data]))
            .toList();
        isLoading.value = false;
      }
    } else {
      Get.snackbar("Hi", "Gagal Memuat Data");
    }
  }

  currentloan(String memberId) async {
    final Map<String, dynamic> databody = {
      Library.memberId: memberId,
    };

    var response = await http.post(
        Uri.parse(
            "https://lib.strada.ac.id/index.php?p=api/loan/currentloan"),
        body: databody);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['error'] == true) {
        isLoading.value = false;
        return null;
      } else {
        var result = CurrentLoanModel.fromJson(data);
        listcurrent.value = result.data
            .map((dataku) => CurrentLoanModel(error: false, data: [dataku]))
            .toList();
        isLoading.value = false;
      }
    } else {
      Get.snackbar("Hi", "Gagal Memuat Data");
    }
  }

  returned(String itemCode, String memberId) async {
    final Map<String, dynamic> databody = {
      Library.itemCode: itemCode,
      Library.memberId: memberId,
    };

    var response = await http.post(
        Uri.parse("https://lib.strada.ac.id/index.php?p=api/biblio/return"),
        body: databody);
    if (response.statusCode == 200) {
      // var dataku = jsonDecode(response.body);
      // ever(listhistory, (_) {
      //   update();
      // });
      // ever(listbook, (_) {
      //   update();
      // });
      Get.back();
      listcurrent.removeWhere((data) => data.data[0].itemCode == itemCode);

      Get.snackbar('Sucsess', "Anda Berhasil Melakukan Pengembalian");
      historyloan(data['nim']);
    } else {}
  }
}

class CurrentLoan extends StatelessWidget {
  String itemCode;
  String title;
  final DateTime loandate;
  final DateTime duedate;
  final VoidCallback onTapReturn;

  CurrentLoan(
      {Key? key,
      required this.itemCode,
      required this.title,
      required this.loandate,
      required this.duedate,
      required this.onTapReturn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.sp, 10.sp, 0.sp, 0.sp),
      child: Container(
        width: double.infinity,
        height: 90.sp,
        decoration: BoxDecoration(
          color: Color(0xFFDDE9FA),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x33000000),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 55.sp,
              height: 20.sp,
              decoration: BoxDecoration(
                color: Color(0xFF1A2A64),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.sp),
                  bottomRight: Radius.circular(10.sp),
                  topLeft: Radius.circular(10.sp),
                  topRight: Radius.circular(0.sp),
                ),
              ),
              child: Center(
                child: Text(
                  itemCode,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5.sp, left: 8.sp),
                      child: Container(
                        height: 35.sp,
                        width: 240.sp,
                        child: Text(
                          title,
                          style: TextStyle(
                            color: DataColors.primary800,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.sp, 2.sp, 0.sp, 0.sp),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(8.sp, 0, 0, 0),
                            child: FaIcon(
                              FontAwesomeIcons.calendar,
                              color: DataColors.primary800,
                              size: 15.sp,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.sp, 0.sp, 0.sp, 0.sp),
                            child: Text(
                              DateFormat('dd MMM yyyy').format(loandate),
                              style: TextStyle(
                                color: DataColors.primary800,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.sp, 0.sp, 0.sp, 0.sp),
                            child: FaIcon(
                              FontAwesomeIcons.calendarTimes,
                              color: DataColors.primary800,
                              size: 15.sp,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.sp, 0.sp, 0.sp, 0.sp),
                            child: Text(
                              DateFormat('dd MMM yyyy').format(duedate),
                              style: TextStyle(
                                color: DataColors.primary800,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(0.sp, 0.sp, 2.sp, 10.sp),
                  child: GestureDetector(
                    onTap: onTapReturn,
                    child: FaIcon(
                      FontAwesomeIcons.reply,
                      color: DataColors.primary800,
                      size: 18.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LoanHistory extends StatelessWidget {
  String itemCode;
  String title;
  final DateTime loandate;
  final DateTime returndate;

  LoanHistory({
    required this.itemCode,
    required this.title,
    required this.loandate,
    required this.returndate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.sp, 10.sp, 0.sp, 0.sp),
      child: Container(
        width: double.infinity,
        height: 90.sp,
        decoration: BoxDecoration(
          color: Color(0xFFDDE9FA),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x33000000),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 55.sp,
              height: 20.sp,
              decoration: BoxDecoration(
                color: Color(0xFF1A2A64),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.sp),
                  bottomRight: Radius.circular(10.sp),
                  topLeft: Radius.circular(10.sp),
                  topRight: Radius.circular(0.sp),
                ),
              ),
              child: Center(
                child: Text(
                  itemCode,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5.sp, left: 8.sp),
                      child: Container(
                        height: 35.sp,
                        width: 255.sp,
                        child: Text(
                          title,
                          style: TextStyle(
                            color: DataColors.primary800,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.sp, 2.sp, 0.sp, 0.sp),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(8.sp, 0, 0, 0),
                            child: FaIcon(
                              FontAwesomeIcons.calendar,
                              color: DataColors.primary800,
                              size: 15.sp,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.sp, 0.sp, 0.sp, 0.sp),
                            child: Text(
                              DateFormat('dd MMM yyyy').format(loandate),
                              style: TextStyle(
                                color: DataColors.primary800,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.sp, 0.sp, 0.sp, 0.sp),
                            child: FaIcon(
                              FontAwesomeIcons.calendarCheck,
                              color: DataColors.primary800,
                              size: 15.sp,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.sp, 0.sp, 0.sp, 0.sp),
                            child: Text(
                              DateFormat('dd MMM yyyy').format(returndate),
                              style: TextStyle(
                                color: DataColors.primary800,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
