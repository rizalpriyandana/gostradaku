import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/ui/global_widgets/tatacarapembayaranBSI/pembayaran4M.dart';
import 'package:gostradav1/app/ui/global_widgets/tatacarapembayaranBSI/pembayaranATMBSI.dart';
import 'package:gostradav1/app/ui/global_widgets/tatacarapembayaranBSI/pembayaranBSIMobile.dart';
import 'package:gostradav1/app/ui/global_widgets/tatacarapembayaranBSI/pembayaranteller.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:sizer/sizer.dart';
import 'package:gostradav1/app/controllers/keuangan/detailtransaksi.dart';

class Vabsi extends StatefulWidget {
  @override
  State<Vabsi> createState() => _VabsiState();
}

class _VabsiState extends State<Vabsi> {
  DetailTransaksiController c = Get.put(DetailTransaksiController());
  @override
  Widget build(BuildContext context) {
    bool visible = false;
    bool visible1 = false;
    bool visible2 = false;
    bool visible3 = false;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: DataColors.white,
        centerTitle: true,
        title: Text(
          "Virtual Account",
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 50.sp,
              // ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(0.sp),
                    height: 50.sp,
                    width: 50.sp,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 50,
                      child: Image.asset('assets/images/BSI.png'),
                    ),
                  ),
                  SizedBox(
                    width: 5.sp,
                  ),
                  Text(
                    "Bank Syariah Indonesia \n(Dicek Otomatis)",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
              SizedBox(
                height: 10.sp,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "No. Virtual Account :",
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
                  ),
                  // SizedBox(
                  //   height: 5.sp,
                  // ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.only(top: 3.sp, right: 2.sp, left: 4.sp),
                        height: 4.h,
                        width: 25.w,
                        decoration: BoxDecoration(
                            color: DataColors.primary700,
                            borderRadius: BorderRadius.circular(5.sp)),
                        child: Text(
                          "777717777",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: DataColors.blusky),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.sp),
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            "Salin",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: DataColors.primary600),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5.sp,
              ),
              Text(
                "Silahkan lakukan pembayaran sejumlah :",
                style: TextStyle(
                    fontSize: 12.sp,
                    color: DataColors.primary700,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 5.sp,
              ),
              Text(
                "Rp 7.980.000",
                style: TextStyle(
                    fontSize: 14.sp,
                    color: DataColors.primary700,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5.sp,
              ),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                    text: 'No.Virtual Account Aktif dalam ',
                    style: TextStyle(
                        color: DataColors.primary700,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                    children: <TextSpan>[
                      TextSpan(
                        text: '24 jam ',
                        style: TextStyle(
                            color: DataColors.primary700,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'dan ',
                        style: TextStyle(
                            color: DataColors.primary700,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: 'expired ',
                        style: TextStyle(
                            color: DataColors.primary700,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'pada :',
                        style: TextStyle(
                            color: DataColors.primary700,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ]),
              ),
              SizedBox(
                height: 5.sp,
              ),
              Container(
                padding: EdgeInsets.all(5.sp),
                height: 4.h,
                // width: 40.w,
                decoration: BoxDecoration(
                    color: DataColors.primary700,
                    borderRadius: BorderRadius.circular(5.sp)),
                child: Text(
                  "11-05-2023 14:42:26",
                  style: TextStyle(
                      color: DataColors.blusky,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 5.sp,
              ),
              Text(
                "Dicek otomatis setelah pembayaran berhasil.",
                style: TextStyle(
                    fontSize: 12.sp,
                    color: DataColors.primary700,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Text(
                "Tata Cara Pembayaran",
                style: TextStyle(
                    fontSize: 12.sp,
                    color: DataColors.primary700,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5.sp,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: DataColors.primary200,
                    borderRadius: BorderRadius.circular(5.sp)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.sp),
                          child: Text(
                            "Pembayaran melalui BSI MOBILE & BSI NET",
                            style: TextStyle(
                                color: DataColors.primary700,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            visible = c.onclick(visible);
                          },
                          icon: Image.asset(
                            'assets/icon/downarrow.png',
                            height: 15.sp,
                            width: 15.sp,
                          ),
                          iconSize: 15.sp,
                          color: DataColors.primary700,
                        )
                      ],
                    ),
                    GetBuilder<DetailTransaksiController>(
                        init: DetailTransaksiController(),
                        initState: (_) {},
                        builder: (_) {
                          return Visibility(
                            visible: visible,
                            child: Container(
                              padding: EdgeInsets.all(5.sp),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: DataColors.white,
                                border: Border.all(
                                    color: DataColors.primary200, width: 1.5),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(5.sp),
                                  bottomLeft: Radius.circular(5.sp),
                                ),
                              ),
                              child: PembayaranBSIMobile(),
                            ),
                          );
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 5.sp,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: DataColors.primary200,
                    borderRadius: BorderRadius.circular(5.sp)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.sp),
                          child: Text(
                            "Pembayaran melalui ATM BSI",
                            style: TextStyle(
                                color: DataColors.primary700,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            visible1 = c.onclick(visible1);
                          },
                          icon: Image.asset(
                            'assets/icon/downarrow.png',
                            height: 15.sp,
                            width: 15.sp,
                          ),
                          iconSize: 8.sp,
                          color: DataColors.primary700,
                        ),
                      ],
                    ),
                    GetBuilder<DetailTransaksiController>(
                        init: DetailTransaksiController(),
                        initState: (_) {},
                        builder: (_) {
                          return Visibility(
                              visible: visible1,
                              child: Container(
                                padding: EdgeInsets.all(5.sp),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: DataColors.white,
                                  border: Border.all(
                                      color: DataColors.primary200, width: 1.5),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(5.sp),
                                    bottomLeft: Radius.circular(5.sp),
                                  ),
                                ),
                                child: PembayaranATMBSI(),
                              ));
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 5.sp,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: DataColors.primary200,
                    borderRadius: BorderRadius.circular(5.sp)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.sp),
                          child: Text(
                            "Pembayaran di TELLER seluruh cabang BSI",
                            style: TextStyle(
                                color: DataColors.primary700,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            visible2 = c.onclick(visible2);
                          },
                          icon: Image.asset(
                            'assets/icon/downarrow.png',
                            height: 15.sp,
                            width: 15.sp,
                          ),
                          iconSize: 8.sp,
                          color: DataColors.primary700,
                        ),
                      ],
                    ),
                    GetBuilder<DetailTransaksiController>(
                        init: DetailTransaksiController(),
                        initState: (_) {},
                        builder: (_) {
                          return Visibility(
                              visible: visible2,
                              child: Container(
                                padding: EdgeInsets.all(5.sp),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: DataColors.white,
                                  border: Border.all(
                                      color: DataColors.primary200, width: 1.5),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(5.sp),
                                    bottomLeft: Radius.circular(5.sp),
                                  ),
                                ),
                                child: PembayaranTeller(),
                              ));
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 5.sp,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: DataColors.primary200,
                    borderRadius: BorderRadius.circular(5.sp)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.sp),
                          child: Text(
                            "Pembayaran dari ATM atau dari \n4 M-BANKING BANK lain",
                            style: TextStyle(
                                color: DataColors.primary700,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            visible3 = c.onclick(visible3);
                          },
                          icon: Image.asset(
                            'assets/icon/downarrow.png',
                            height: 15.sp,
                            width: 15.sp,
                          ),
                          iconSize: 8.sp,
                          color: DataColors.primary700,
                        ),
                      ],
                    ),
                    GetBuilder<DetailTransaksiController>(
                        init: DetailTransaksiController(),
                        initState: (_) {},
                        builder: (_) {
                          return Visibility(
                              visible: visible3,
                              child: Container(
                                padding: EdgeInsets.all(5.sp),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: DataColors.white,
                                  border: Border.all(
                                      color: DataColors.primary200, width: 1.5),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(5.sp),
                                    bottomLeft: Radius.circular(5.sp),
                                  ),
                                ),
                                child: Pembayaran4M(),
                              ));
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
