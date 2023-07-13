// ignore_for_file: use_key_in_widget_constructors, unrelated_type_equality_checks

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/tagihan_c.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class BuatTagihanPage extends StatefulWidget {
  @override
  State<BuatTagihanPage> createState() => _BuatTagihanPageState();
}

class _BuatTagihanPageState extends State<BuatTagihanPage> {
  TagihanController controller = Get.find<TagihanController>();

  TextEditingController bayar = TextEditingController();
  TextEditingController catatan = TextEditingController();
  String newbayar = "";
  String newtagihan = "";
  String? totaltagihan;
  bool isEditable = false;

  final box = GetStorage();
  var datas = Get.arguments;

  // @override
  // void initState() {
  //   bayar.text = NumberFormat.decimalPattern('id').format(datas[2]);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final formatNominal = NumberFormat.decimalPattern('id');

    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0.sp, 50.sp),
        child: AppBar(
          elevation: 0,
          backgroundColor: DataColors.white,
          centerTitle: true,
          title: Text(
            "Detail Tagihan",
            style: TextStyle(
                color: DataColors.primary700, fontWeight: FontWeight.w600),
          ),
          foregroundColor: DataColors.primary700,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_ios));
            },
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2.h),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   "Nama Tagihan",
              //   style: TextStyle(
              //       color: DataColors.primary700,
              //       fontSize: 12.sp,
              //       fontWeight: FontWeight.w700),
              // ),
              // SizedBox(
              //   height: 5.sp,
              // ),
              // Container(
              //   padding: EdgeInsets.all(10.sp),
              //   width: 90.w,
              //   decoration: BoxDecoration(
              //     color: DataColors.Neutral100,
              //     borderRadius: BorderRadius.circular(5.sp),
              //   ),
              //   child: Text(
              //     datas[0],
              //     style: TextStyle(
              //       fontSize: 12.sp,
              //       color: DataColors.Neutral400,
              //       fontWeight: FontWeight.w400,
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 5.sp,
              // ),
              // Text(
              //   "Detail Tagihan",
              //   style: TextStyle(
              //       color: DataColors.primary700,
              //       fontSize: 12.sp,
              //       fontWeight: FontWeight.w700),
              // ),
              // SizedBox(
              //   height: 5.sp,
              // ),
              Container(
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(color: DataColors.primary600, width: 1.sp)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Jenis",
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: DataColors.primary600),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 5.sp),
                          child: Text(
                            datas[1],
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: DataColors.primary600),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Nama Tagihan",
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: DataColors.primary600),
                          ),
                        ),
                        // SizedBox(width: 10.sp,),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.only(right: 5.sp),
                            child: Text(
                              datas[0],
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  color: DataColors.primary600),
                                  textAlign: TextAlign.right,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    DottedLine(
                      direction: Axis.horizontal,
                      lineLength: double.infinity,
                      lineThickness: 1.0,
                      dashLength: 6.0,
                      dashColor: DataColors.primary600,
                      dashRadius: 0.0,
                      dashGapLength: 4.0,
                      dashGapColor: Colors.transparent,
                      dashGapRadius: 0.0,
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nominal",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: DataColors.primary600),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 5.sp),
                          child: Text(
                            formatNominal.format(datas[2]),
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: DataColors.primary600),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 10.sp,
              ),
              Container(
                padding: EdgeInsets.all(10.sp),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: DataColors.primary200,
                  borderRadius: BorderRadius.circular(5.sp),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total tagihan",
                      style: TextStyle(
                          color: DataColors.primary700,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5.sp),
                      child: Text(
                        formatNominal.format(datas[2]),
                        // newtagihan == ""
                        // ? formatNominal.format(datas[2])
                        //     : formatNominal.format(int.parse(newtagihan)),
                        style: TextStyle(
                            color: DataColors.primary700,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.sp,
              ),
              Text(
                "Catatan",
                style: TextStyle(
                    color: DataColors.primary700,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp),
              ),
              SizedBox(
                height: 5.sp,
              ),
              TextFormField(
                autocorrect: false,
                controller: catatan,
                maxLines: 5,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Catatan',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                  contentPadding: EdgeInsets.all(10.sp),
                  isDense: true,
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: DataColors.semigrey, width: 1.0),
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        margin: EdgeInsets.only(bottom: 10.sp, top: 2.sp),
        child: ElevatedButton(
          onPressed: () {
            // String bayarku = bayar.text;
            controller.labeljenis = datas[1];
            controller.total = formatNominal.format(datas[2]);
            controller.confirmtagihan(data["nim"], datas[3].toString(),
                datas[4].toString(), datas[2].toString());
            // if (bayarku.isNotEmpty) {
            //   controller.labeljenis = datas[1];
            //   controller.total = formatNominal.format(datas[2]);
            //   controller.confirmtagihan(data["nim"], datas[3].toString(),
            //       datas[4].toString(), datas[2].toString());
            // } else {
            //   Get.snackbar('Go-Strada', 'Terjadi Kesalahan');
            // }
          },
          style: ElevatedButton.styleFrom(
            side: BorderSide(width: 2.0, color: DataColors.primary),
            backgroundColor: DataColors.primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
          ),
          child: Obx(
            () => Padding(
              padding: const EdgeInsets.all(0),
              child: controller.isLoading.isTrue
                  ? const SizedBox(
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : const Text(
                      'Buat Tagihan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
