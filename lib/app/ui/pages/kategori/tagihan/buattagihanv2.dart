import 'package:dotted_line/dotted_line.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

class BuatTagihanv2 extends StatefulWidget {
  @override
  State<BuatTagihanv2> createState() => _BuatTagihanv2State();
}

class _BuatTagihanv2State extends State<BuatTagihanv2> {
  final List<String> dataku = [
    'Paket Biaya Profesi',
    'Tagihan Semester 1',
    'Tagihan Semester 2',
  ];
  TextEditingController catatan = TextEditingController();
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0.sp, 50.sp),
        child: AppBar(
          elevation: 0,
          backgroundColor: DataColors.white,
          foregroundColor: DataColors.primary700,
          centerTitle: true,
          title: Text(
            "Data Tagihan",
            style: TextStyle(
                color: DataColors.primary700, fontWeight: FontWeight.w600),
          ),
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
              Text(
                "Jenis Tagihan",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: DataColors.primary700,
                ),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomDropdownButton2(
                    hint: 'Pilih Tagihan',
                    value: selectedValue,
                    dropdownItems: dataku,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                      Fluttertoast.showToast(
                          msg: value.toString(),
                          toastLength: Toast.LENGTH_LONG);
                    },
                    dropdownWidth: 50.w,
                    buttonWidth: 62.w,
                    buttonHeight: 6.h,
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.sp),
                      color: HexColor("#F3F3F3"),
                    ),
                    buttonPadding: EdgeInsets.all(10.sp),
                  ),
                  SizedBox(width: 5.sp,),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(

                      side: BorderSide(width: 1.sp, color: DataColors.primary),
                      backgroundColor: DataColors.white,
                      // foregroundColor: DataColors.primary700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      padding: EdgeInsets.only(top: 11.sp, bottom: 11.sp, left: 5.sp, right: 5.sp),
                    ),
                    child: Text(
                      "Load Tagihan",
                      style: TextStyle(
                          color: DataColors.primary700,
                          fontWeight: FontWeight.w700,
                          fontSize: 10.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.sp,
              ),
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
                            "Tagihan Cicilan",
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
                              "Paket Biaya Profesi",
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
                            "10.000",
                            //formatNominal.format(datas[2]),
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
                        "Rp 10.000",
                        // formatNominal.format(datas[2]),
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
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            side: BorderSide(width: 2.sp, color: DataColors.primary),
            backgroundColor: DataColors.white,
            // foregroundColor: DataColors.primary700,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.sp),
            ),
            padding: EdgeInsets.symmetric(vertical: 10.sp),
          ),
          child: Text(
            "Simpan Tagihan",
            style: TextStyle(
                color: DataColors.primary700, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
