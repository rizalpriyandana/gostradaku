import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/controllers/keuangan/detailtransaksi.dart';
import 'package:gostradav1/app/ui/global_widgets/tatacarapembayaranBNI/pembayaranATMBNI.dart';
import 'package:gostradav1/app/ui/global_widgets/tatacarapembayaranBNI/pembayaranATMBanklain.dart';
import 'package:gostradav1/app/ui/global_widgets/tatacarapembayaranBNI/pembayaranATMBersama.dart';
import 'package:gostradav1/app/ui/global_widgets/tatacarapembayaranBNI/pembayaranAgen46.dart';
import 'package:gostradav1/app/ui/global_widgets/tatacarapembayaranBNI/pembayaranBNIsmsbanking.dart';
import 'package:gostradav1/app/ui/global_widgets/tatacarapembayaranBNI/pembayaranMobileBanking.dart';
import 'package:gostradav1/app/ui/global_widgets/tatacarapembayaranBNI/pembayaranOVO.dart';
import 'package:gostradav1/app/ui/global_widgets/tatacarapembayaranBNI/pembayaraniBank.dart';
import 'package:gostradav1/app/ui/global_widgets/tatacarapembayaranBNI/pembayaranoutletbniteller.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:sizer/sizer.dart';

class VABniv2 extends StatefulWidget {
  @override
  State<VABniv2> createState() => _VABniv2State();
}

class _VABniv2State extends State<VABniv2> {
  DetailTransaksiController c = Get.put(DetailTransaksiController());

  bool vis = false;
  bool vis1 = false;
  bool vis2 = false;
  bool vis3 = false;
  bool vis4 = false;
  bool vis5 = false;
  bool vis6 = false;
  bool vis7 = false;
  bool vis8 = false;

  String va = "80777082228199185";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: DataColors.white,
        centerTitle: true,
        title: Text(
          "Virtual Account",
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: DataColors.primary700),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: DataColors.primary700,
                ));
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    EdgeInsets.only(left: 10.sp, right: 10.sp, bottom: 10.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 40,
                        child: Image.asset('assets/images/BNI.png'),
                      ),
                    ),
                    SizedBox(
                      height: 2.sp,
                    ),
                    Center(
                      child: Text(
                        "Bank Negara Indonesia(BNI)",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: DataColors.primary700),
                      ),
                    ),
                    SizedBox(
                      height: 15.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nomor Virtual Account",
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w700,
                              color: DataColors.primary700),
                        ),
                        InkWell(
                          onTap: () async {
                            await Clipboard.setData(ClipboardData(text: va));
                            Fluttertoast.showToast(
                                msg: "Berhasil disalin",
                                toastLength: Toast.LENGTH_SHORT);
                          },
                          splashColor: DataColors.primary200,
                          child: Text(
                            "SALIN",
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                                color: DataColors.primary600),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: 3.sp, right: 2.sp, left: 5.sp),
                          height: 4.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                              color: DataColors.blusky,
                              borderRadius: BorderRadius.circular(5.sp)),
                          child: Text(
                            va,
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: DataColors.primary700),
                          ),
                        ),
                        SizedBox(
                          width: 5.sp,
                        ),
                        // IconButton(
                        //     onPressed: () async {
                        //       await Clipboard.setData(ClipboardData(text: va));
                        //       Fluttertoast.showToast(
                        //           msg: "Berhasil disalin",
                        //           toastLength: Toast.LENGTH_SHORT);
                        //     },
                        //     icon: Image.asset(
                        //       'assets/icon/copy.png',
                        //       height: 15.sp,
                        //       width: 15.sp,
                        //     ))
                      ],
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Text(
                      "Total Pembayaran",
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700,
                          color: DataColors.primary700),
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 3.sp, right: 2.sp, left: 4.sp, bottom: 3.sp),
                        height: 5.h,
                        width: 35.w,
                        decoration: BoxDecoration(
                            color: DataColors.primary700,
                            borderRadius: BorderRadius.circular(5.sp)),
                        child: Center(
                          child: Text(
                            "Rp 10.000.000",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: DataColors.blusky),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 5.sp,
              // ),
              Container(
                width: double.infinity,
                height: 2.h,
                color: DataColors.Neutral200,
              ),
              Container(
                padding: EdgeInsets.only(left: 10.sp, right: 10.sp, top: 10.sp, bottom: 10.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Batas Akhir Pembayaran",
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w200,
                          color: DataColors.primary700),
                    ),
                    SizedBox(
                      height: 2.sp,
                    ),
                    Text(
                      "Kamis, 20 Jun 2023 15:30 WIB",
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                          color: DataColors.primary700),
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Text(
                      "Nomor Virtual Account akan terhapus apabila anda tidak membayar dalam jangka waktu 2 x 24 jam",
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w200,
                          color: DataColors.primary700),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Text(
                      "Tata Cara Pembayaran",
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                          color: DataColors.primary700),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: DataColors.primary200,
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 5.sp),
                                child: Text(
                                  "Pembayaran melalui ATM BNI",
                                  style: TextStyle(
                                      color: DataColors.primary700,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  vis = c.onclick(vis);
                                },
                                icon: Image.asset(
                                  'assets/icon/downarrow.png',
                                  height: 15.sp,
                                  width: 15.sp,
                                ),
                                color: DataColors.primary700,
                              )
                            ],
                          ),
                          GetBuilder<DetailTransaksiController>(
                            init: DetailTransaksiController(),
                            initState: (_) {},
                            builder: (_) {
                              return Visibility(
                                  visible: vis,
                                  child: Container(
                                    padding: EdgeInsets.all(5.sp),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: DataColors.white,
                                        border: Border.all(
                                            color: DataColors.primary200,
                                            width: 1.5),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5.sp),
                                          bottomRight: Radius.circular(5.sp),
                                        )),
                                    child: PembayaranAtmBNI(),
                                  ));
                            },
                          ),
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
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 5.sp),
                                child: Text(
                                  "Pembayaran melalui Mobile Banking BNI",
                                  style: TextStyle(
                                      color: DataColors.primary700,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  vis1 = c.onclick(vis1);
                                },
                                icon: Image.asset(
                                  'assets/icon/downarrow.png',
                                  height: 15.sp,
                                  width: 15.sp,
                                ),
                                color: DataColors.primary700,
                              ),
                            ],
                          ),
                          GetBuilder<DetailTransaksiController>(
                            init: DetailTransaksiController(),
                            initState: (_) {},
                            builder: (_) {
                              return Visibility(
                                  visible: vis1,
                                  child: Container(
                                    padding: EdgeInsets.all(5.sp),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: DataColors.white,
                                        border: Border.all(
                                            color: DataColors.primary200,
                                            width: 1.5),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5.sp),
                                          bottomRight: Radius.circular(5.sp),
                                        )),
                                    child: PembayaranMobileBanking(),
                                  ));
                            },
                          ),
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
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 5.sp),
                                child: Text(
                                  "Pembayaran melalui iBank Personal BNI",
                                  style: TextStyle(
                                      color: DataColors.primary700,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  vis2 = c.onclick(vis2);
                                },
                                icon: Image.asset(
                                  'assets/icon/downarrow.png',
                                  height: 15.sp,
                                  width: 15.sp,
                                ),
                                color: DataColors.primary700,
                              ),
                            ],
                          ),
                          GetBuilder<DetailTransaksiController>(
                            init: DetailTransaksiController(),
                            initState: (_) {},
                            builder: (_) {
                              return Visibility(
                                  visible: vis2,
                                  child: Container(
                                    padding: EdgeInsets.all(5.sp),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: DataColors.white,
                                        border: Border.all(
                                            color: DataColors.primary200,
                                            width: 1.5),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5.sp),
                                          bottomRight: Radius.circular(5.sp),
                                        )),
                                    child: PembayaraniBank(),
                                  ));
                            },
                          ),
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
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 5.sp),
                                child: Text(
                                  "Pembayaran melalui BNI Sms Banking",
                                  style: TextStyle(
                                      color: DataColors.primary700,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  vis3 = c.onclick(vis3);
                                },
                                icon: Image.asset(
                                  'assets/icon/downarrow.png',
                                  height: 15.sp,
                                  width: 15.sp,
                                ),
                                color: DataColors.primary700,
                              ),
                            ],
                          ),
                          GetBuilder<DetailTransaksiController>(
                            init: DetailTransaksiController(),
                            initState: (_) {},
                            builder: (_) {
                              return Visibility(
                                  visible: vis3,
                                  child: Container(
                                    padding: EdgeInsets.all(5.sp),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: DataColors.white,
                                        border: Border.all(
                                            color: DataColors.primary200,
                                            width: 1.5),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5.sp),
                                          bottomRight: Radius.circular(5.sp),
                                        )),
                                    child: PembayaranBNIsmsbanking(),
                                  ));
                            },
                          ),
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
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 5.sp),
                                child: Text(
                                  "Pembayaran melalui dari Cabang atau \nOutlet BNI(Teller)",
                                  style: TextStyle(
                                      color: DataColors.primary700,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  vis4 = c.onclick(vis4);
                                },
                                icon: Image.asset(
                                  'assets/icon/downarrow.png',
                                  height: 15.sp,
                                  width: 15.sp,
                                ),
                                color: DataColors.primary700,
                              ),
                            ],
                          ),
                          GetBuilder<DetailTransaksiController>(
                            init: DetailTransaksiController(),
                            initState: (_) {},
                            builder: (_) {
                              return Visibility(
                                  visible: vis4,
                                  child: Container(
                                    padding: EdgeInsets.all(5.sp),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: DataColors.white,
                                        border: Border.all(
                                            color: DataColors.primary200,
                                            width: 1.5),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5.sp),
                                          bottomRight: Radius.circular(5.sp),
                                        )),
                                    child: PembayaranOutletBniTeller(),
                                  ));
                            },
                          ),
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
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 5.sp),
                                child: Text(
                                  "Pembayaran melalui Agen46",
                                  style: TextStyle(
                                      color: DataColors.primary700,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  vis5 = c.onclick(vis5);
                                },
                                icon: Image.asset(
                                  'assets/icon/downarrow.png',
                                  height: 15.sp,
                                  width: 15.sp,
                                ),
                                color: DataColors.primary700,
                              ),
                            ],
                          ),
                          GetBuilder<DetailTransaksiController>(
                            init: DetailTransaksiController(),
                            initState: (_) {},
                            builder: (_) {
                              return Visibility(
                                  visible: vis5,
                                  child: Container(
                                    padding: EdgeInsets.all(5.sp),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: DataColors.white,
                                        border: Border.all(
                                            color: DataColors.primary200,
                                            width: 1.5),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5.sp),
                                          bottomRight: Radius.circular(5.sp),
                                        )),
                                    child: PembayaranAgen46(),
                                  ));
                            },
                          ),
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
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 5.sp),
                                child: Text(
                                  "Pembayaran melalui ATM Bersama",
                                  style: TextStyle(
                                      color: DataColors.primary700,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  vis6 = c.onclick(vis6);
                                },
                                icon: Image.asset(
                                  'assets/icon/downarrow.png',
                                  height: 15.sp,
                                  width: 15.sp,
                                ),
                                color: DataColors.primary700,
                              ),
                            ],
                          ),
                          GetBuilder<DetailTransaksiController>(
                            init: DetailTransaksiController(),
                            initState: (_) {},
                            builder: (_) {
                              return Visibility(
                                  visible: vis6,
                                  child: Container(
                                    padding: EdgeInsets.all(5.sp),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: DataColors.white,
                                        border: Border.all(
                                            color: DataColors.primary200,
                                            width: 1.5),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5.sp),
                                          bottomRight: Radius.circular(5.sp),
                                        )),
                                    child: PembayaranAtmBersama(),
                                  ));
                            },
                          ),
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
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 5.sp),
                                child: Text(
                                  "Pembayaran melalui Bank lain",
                                  style: TextStyle(
                                      color: DataColors.primary700,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  vis7 = c.onclick(vis7);
                                },
                                icon: Image.asset(
                                  'assets/icon/downarrow.png',
                                  height: 15.sp,
                                  width: 15.sp,
                                ),
                                color: DataColors.primary700,
                              ),
                            ],
                          ),
                          GetBuilder<DetailTransaksiController>(
                            init: DetailTransaksiController(),
                            initState: (_) {},
                            builder: (_) {
                              return Visibility(
                                  visible: vis7,
                                  child: Container(
                                    padding: EdgeInsets.all(5.sp),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: DataColors.white,
                                        border: Border.all(
                                            color: DataColors.primary200,
                                            width: 1.5),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5.sp),
                                          bottomRight: Radius.circular(5.sp),
                                        )),
                                    child: PembayaranAtmBanklain(),
                                  ));
                            },
                          ),
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
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 5.sp),
                                child: Text(
                                  "Pembayaran melalui OVO",
                                  style: TextStyle(
                                      color: DataColors.primary700,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  vis8 = c.onclick(vis8);
                                },
                                icon: Image.asset(
                                  'assets/icon/downarrow.png',
                                  height: 15.sp,
                                  width: 15.sp,
                                ),
                                color: DataColors.primary700,
                              ),
                            ],
                          ),
                          GetBuilder<DetailTransaksiController>(
                            init: DetailTransaksiController(),
                            initState: (_) {},
                            builder: (_) {
                              return Visibility(
                                  visible: vis8,
                                  child: Container(
                                    padding: EdgeInsets.all(5.sp),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: DataColors.white,
                                        border: Border.all(
                                            color: DataColors.primary200,
                                            width: 1.5),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5.sp),
                                          bottomRight: Radius.circular(5.sp),
                                        )),
                                    child: PembayaranOVO(),
                                  ));
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
