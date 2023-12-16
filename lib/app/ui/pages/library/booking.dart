// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/library/library_c.dart';
import 'package:gostradav1/app/data/models/library/library_m.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class Booking extends StatefulWidget {
  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  LibraryController lc = Get.find<LibraryController>();
  final box = GetStorage();
  var isLoading = true.obs;
  RxList<BookingModel> listbooking = <BookingModel>[].obs;
  String tokenapi =
      "MUp6bENqTzlzYVZaM0xKd2FkbnY5WkFzbEZQVFdSQTZ1QUdaY3grUnZvND0=";
  late Map data = box.read("dataUser") as Map<String, dynamic>;

  @override
  void initState() {
    booking(data['nim']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: DataColors.white,
          elevation: 0,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(top: 0.sp),
            child: Text(
              "Booking Book",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: DataColors.primary800),
            ),
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
        body: Obx(() => isLoading.isTrue
            ? Center(
                child: LoadingAnimationWidget.fourRotatingDots(
                    color: DataColors.primary700, size: 40.sp))
            : listbooking.isEmpty
                ? Center(
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
                            style: TextStyle(color: DataColors.Neutral300),
                          )
                        ],
                      ),
                    ),
                  )
                : Container(
                    padding: EdgeInsets.only(
                        left: 10.sp, right: 10.sp, bottom: 10.sp, top: 0.sp),
                    child: Padding(
                      padding: EdgeInsets.all(0.sp),
                      child: ListView.builder(
                        itemCount: listbooking.length,
                        itemBuilder: (context, index) {
                          final datalist = listbooking[index];
                          return ContentBookmark(
                            itemCode: datalist.data[0].itemCode,
                            title: datalist.data[0].title,
                            authorName: datalist.data[0].labelStatus,
                            created: datalist.data[0].createdAt,
                            expired: datalist.data[0].expiredDate,
                            onTapHapus: () {
                              Get.defaultDialog(
                                  onConfirm: () =>
                                      delete(data['nim'], datalist.data[0].id),
                                  onCancel: () => dispose(),
                                  middleText:
                                      "Apakah anda yakin ingin hapus data?");
                            },
                          );
                        },
                      ),
                    ),
                  )));
  }

  booking(String memberId) async {
    final Map<String, dynamic> databody = {
      Library.memberId: memberId,
      Library.token: tokenapi,
    };

    var response = await http.post(
        Uri.parse("https://api-lib.strada.ac.id/public_api/loan/reserve"),
        body: databody);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['error'] == true) {
        isLoading.value = false;
        return null;
      } else {
        var result = BookingModel.fromJson(data);
        listbooking.value = result.data
            .map((datab) => BookingModel(error: false, data: [datab]))
            .toList();
        isLoading.value = false;
      }
    } else {
      Get.snackbar("Hi", "Gagal Memuat Data");
    }
  }

  delete(String memberId, idReserve) async {
    final Map<String, dynamic> databody = {
      Library.memberId: memberId,
      Library.reserveId: idReserve,
      Library.token: tokenapi,
    };
    var response = await http.post(
        Uri.parse("https://api-lib.strada.ac.id/public_api/loan/deletereserve"),
        body: databody);

    if (response.statusCode == 200) {
      Get.back();
      listbooking.removeWhere((data) => data.data[0].id == idReserve);

      Get.snackbar('Sucsess', 'Data berhasil dihapus');
    } else {
      Get.snackbar('Galat', 'Data tidak berhasil dihapus');
    }
  }
}

class ContentBookmark extends StatelessWidget {
  String title;
  String authorName;
  String itemCode;
  DateTime expired;
  DateTime created;
  final VoidCallback onTapHapus;

  ContentBookmark(
      {Key? key,
      required this.title,
      required this.authorName,
      required this.created,
      required this.itemCode,
      required this.expired,
      required this.onTapHapus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.sp, 8.sp, 0.sp, 0.sp),
      child: Container(
        width: double.infinity,
        height: title.split(' ').length > 5 ? 110.sp : 100.sp,
        decoration: BoxDecoration(
          color: Color(0xFFDDE9FA),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: DataColors.blackshadow,
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.sp, left: 5.sp),
                  child: Row(
                    children: [
                      Text(
                        itemCode,
                        style: TextStyle(
                          color: DataColors.primary800,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.sp, right: 5.sp),
                        child: Container(
                          height: 10.sp,
                          width: 2.sp,
                          color: DataColors.primary800,
                        ),
                      ),
                      Text(
                        DateFormat('dd/MM/yyyy').format(created),
                        style: TextStyle(
                          color: DataColors.primary800,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    onTapHapus();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 11.sp, right: 5.sp),
                    child: Container(
                      width: 60.sp,
                      height: 20.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        border: Border.all(
                            color: Colors.redAccent, width: 1.sp),
                      ),
                      padding: EdgeInsets.all(0.sp),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 5.sp, top: 0.sp),
                            child: FaIcon(
                              FontAwesomeIcons.trash,
                              color: Colors.redAccent,
                              size: 12.sp,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.sp, top: 0.sp),
                            child: Text(
                              "Delete",
                              style: TextStyle(
                                  color: Colors.redAccent, fontSize: 10.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  EdgeInsetsDirectional.fromSTEB(5.sp, 2.sp, 0.sp, 5.sp),
              child: Container(
                width: 255.sp,
                height: title.split(' ').length > 5 ? 30.sp : 18.sp,
                child: Text(
                  title,
                  style: TextStyle(
                    color: DataColors.primary800,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.sp),
                  child: Text(
                    "Status",
                    style: TextStyle(
                      color: DataColors.primary800,
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      5.sp, 0.sp, 0.sp, 0.sp),
                  child: Container(
                    width: 60.sp,
                    height: 15.sp,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        color: DataColors.primary800),
                    child: Center(
                      child: Text(
                        authorName,
                        style: TextStyle(
                          color: DataColors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.sp, top: 5.sp),
                  child: Text(
                    "Expired Date",
                    style: TextStyle(
                      color: DataColors.primary800,
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      5.sp, 5.sp, 0.sp, 0.sp),
                  child: Container(
                    width: 60.sp,
                    height: 15.sp,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        color: DataColors.primary800),
                    child: Center(
                      child: Text(
                        DateFormat('dd/MM/yyyy').format(expired),
                        style: TextStyle(
                          color: DataColors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
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
