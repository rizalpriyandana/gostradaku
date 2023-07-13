import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gostradav1/app/controllers/keuangan/detailtransaksi.dart';
import 'package:gostradav1/app/ui/global_widgets/tatacarapembayaranBSI/pembayaran4M.dart';
import 'package:gostradav1/app/ui/global_widgets/tatacarapembayaranBSI/pembayaranATMBSI.dart';
import 'package:gostradav1/app/ui/global_widgets/tatacarapembayaranBSI/pembayaranBSIMobile.dart';
import 'package:gostradav1/app/ui/global_widgets/tatacarapembayaranBSI/pembayaranteller.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class VABsiv2 extends StatefulWidget {
  @override
  State<VABsiv2> createState() => _VABsiv2State();
}

class _VABsiv2State extends State<VABsiv2> {
  DetailTransaksiController c = Get.put(DetailTransaksiController());

  late FToast ftoast;

  bool visible = false;
  bool vis1 = false;
  bool vis2 = false;
  bool vis3 = false;

  String nva = "8077082228199185";

  @override
  void initState() {
    ftoast = FToast();
    ftoast.init(context);
    super.initState();
  }

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
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: DataColors.primary700),
          ),
          leading: Builder(
            builder: (BuildContext context) {
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
                          child: Image.asset('assets/images/BSI.png'),
                        ),
                      ),
                      SizedBox(
                        height: 2.sp,
                      ),
                      Center(
                        child: Text(
                          "Bank Syariah Indonesia(BSI)",
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
                              await Clipboard.setData(ClipboardData(text: nva));
                              // Fluttertoast.showToast(msg: "Berhasil Disalin", );
                              ftoast.showToast(
                                  child: Container(
                                    padding: EdgeInsets.all(5.sp),
                                    height: 5.h,
                                    width: 100.w,
                                    child: Material(
                                      borderRadius: BorderRadius.circular(2.sp),
                                      color: DataColors.blusky,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.info_outline_rounded,
                                            color: DataColors.primary600,
                                            size: 10.sp,
                                          ),
                                          Text(
                                            "Copied to Clipboard",
                                            style: TextStyle(
                                                color: DataColors.primary600,
                                                fontSize: 10.sp),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  gravity: ToastGravity.TOP);
                            },
                            child: Text(
                              "SALIN",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w700,
                                  color: DataColors.primary700),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.sp,
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(top: 3.sp, right: 2.sp, left: 5.sp),
                        height: 4.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: DataColors.blusky,
                          borderRadius: BorderRadius.circular(5.sp),
                        ),
                        child: Text(
                          nva,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: DataColors.primary700),
                        ),
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
                            borderRadius: BorderRadius.circular(5.sp),
                          ),
                          child: Center(
                              child: Text(
                            "Rp 10.000.000",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: DataColors.blusky),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 2.h,
                  color: DataColors.Neutral200,
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 10.sp, right: 10.sp, top: 10.sp, bottom: 10.sp),
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
                        "Kamis, 20 Jun 2023 15.30 WIB",
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            color: DataColors.primary700),
                      ),
                      SizedBox(
                        height: 2.sp,
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
                                      "Pembayaran melalui BSI Mobile & BSI NET",
                                      style: TextStyle(
                                          color: DataColors.primary700,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.bold),
                                    )),
                                IconButton(
                                  onPressed: () {
                                    visible = c.onclick(visible);
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
                                  visible: visible,
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
                                            bottomRight:
                                                Radius.circular(5.sp))),
                                    child: PembayaranBSIMobile(),
                                  ),
                                );
                              },
                            )
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
                                      "Pembayaran melalui ATM BSI",
                                      style: TextStyle(
                                          color: DataColors.primary700,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.bold),
                                    )),
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
                                )
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
                                            bottomRight:
                                                Radius.circular(5.sp))),
                                    child: PembayaranATMBSI(),
                                  ),
                                );
                              },
                            )
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
                                      "Pembayaran di TELLER seluruh Cabang BSI",
                                      style: TextStyle(
                                          color: DataColors.primary700,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.bold),
                                    )),
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
                                )
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
                                            bottomRight:
                                                Radius.circular(5.sp))),
                                    child: PembayaranTeller(),
                                  ),
                                );
                              },
                            )
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
                                      "Pembayaran dari ATM atau dari \n4 M-BANKING Bank lain",
                                      style: TextStyle(
                                          color: DataColors.primary700,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.bold),
                                    )),
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
                                )
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
                                            bottomRight:
                                                Radius.circular(5.sp))),
                                    child: Pembayaran4M(),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
