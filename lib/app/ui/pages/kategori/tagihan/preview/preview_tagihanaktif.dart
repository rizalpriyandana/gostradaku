import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/controllers/tagihan_c.dart';
import 'package:gostradav1/app/routes/rout_name.dart';
import 'package:gostradav1/app/ui/pages/kategori/tagihan/va/bankpage.dart';
import 'package:gostradav1/app/ui/pages/kategori/tagihan/va/va.dart';
import 'package:gostradav1/app/ui/pages/kategori/tagihan/va/vabni.dart';
import 'package:gostradav1/app/ui/pages/kategori/tagihan/va/vabniv2.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:sizer/sizer.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../../controllers/keuangan/detailtransaksi.dart';
import '../../../../theme/color.dart';
import 'package:intl/intl.dart';

import '../va/vabsi.dart';

class PreviewTagihanAktifPage extends StatefulWidget {
  @override
  State<PreviewTagihanAktifPage> createState() =>
      _PreviewTagihanAktifPageState();
}

class _PreviewTagihanAktifPageState extends State<PreviewTagihanAktifPage> {
  @override
  Widget build(BuildContext context) {
    final formatNominal = NumberFormat.decimalPattern('id');
    var array = Get.arguments;
    bool isvisible = false;

    DetailTransaksiController c = Get.put(DetailTransaksiController());
    TagihanController controller = Get.put(TagihanController());
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Preview Tagihan',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Colors.white,
          foregroundColor: DataColors.primary700,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                    Icons.arrow_back_ios), // Put icon of your preference.
                onPressed: () {
                  Get.back();
                },
              );
            },
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 10.sp,
              ),
              Container(
                padding: EdgeInsets.all(5.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: DataColors.blusky),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 2.sp),
                      child: Icon(
                        Icons.info_outline,
                        color: DataColors.primary600,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5.sp),
                      width: 80.w,
                      child: Text(
                        "Kode transaksi dapat dilihat pada bagian bawah barcode atau qrcode, kode tersebut yang akan menjadi acuan pembayaran",
                        style: TextStyle(color: DataColors.primary600),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              // Container(
              //   margin: EdgeInsets.only(bottom: 10.sp),
              //   height: 1.5.sp,
              //   width: 100.w,
              //   color: DataColors.Neutral200,
              // ),
              // Row(
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: ImageIcon(
              //         const AssetImage("assets/images/money.png"),
              //         color: DataColors.primary400,
              //         size: 30.sp,
              //       ),
              //     ),
              //     Text(
              //       "Pembayaran Offline",
              //       style: TextStyle(
              //           color: DataColors.primary800,
              //           fontWeight: FontWeight.w600),
              //     ),
              //   ],
              // ),
              // Container(
              //   margin: EdgeInsets.symmetric(vertical: 10.sp),
              //   height: 1.5.sp,
              //   width: 100.w,
              //   color: DataColors.Neutral200,
              // ),
              Column(
                children: [
                  // Padding(
                  //   padding: EdgeInsets.symmetric(vertical: 0.sp),
                  //   child: Center(
                  //     child: QrImage(
                  //       data: array[0].toString(),
                  //       version: QrVersions.auto,
                  //       size: 200.0,
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.sp),
                    child: Text(
                      array[0],
                      style: TextStyle(
                          color: DataColors.primary700,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(5.sp),
                height: 8.h,
                // margin: const EdgeInsets.only(bottom: 20, top: 20),
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(VABniv2());
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: DataColors.primary700,
                      backgroundColor: Colors.white,
                      side: BorderSide(
                        width: 2.0,
                        color: DataColors.primary,
                      ), // foreground
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.sp),
                          child: Image.asset('assets/images/BNI.png'),
                        ),
                        SizedBox(
                          width: 5.sp,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 5.sp),
                          child: Text(
                            "Pembayaran Via Virtual Account BNI",
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    )),
              ),
              SizedBox(height: 5.sp),
              Container(
                padding: EdgeInsets.all(5.sp),
                height: 8.h,
                // margin: const EdgeInsets.only(bottom: 20, top: 20),
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(Vabsi());
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: DataColors.primary700,
                      backgroundColor: Colors.white,
                      side: BorderSide(
                        width: 2.0,
                        color: DataColors.primary,
                      ), // foreground
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.sp),
                          child: Image.asset('assets/images/BSI.png'),
                        ),
                        SizedBox(
                          width: 5.sp,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 5.sp),
                          child: Text(
                            "Pembayaran Via Virtual Account BSI",
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Text(
                "Detail Tagihan",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: DataColors.primary700),
              ),
              SizedBox(
                height: 5.sp,
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
                          "Jenis Tagihan",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: DataColors.primary600),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 5.sp),
                          child: Text(
                            formatNominal.format(int.parse(array[1])),
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: DataColors.primary600),
                          ),
                        ),
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
                          "Total Tagihan",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: DataColors.primary600),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 5.sp),
                          child: Text(
                            formatNominal.format(int.parse(array[1])),
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

              // Container(
              //   margin: EdgeInsets.only(top: 10.sp),
              //   height: 1.5.sp,
              //   width: 100.w,
              //   color: DataColors.Neutral200,
              // ),
              // InkWell(
              //   onTap: () {
              //     int val = int.tryParse(array[1]) ?? array[1];
              //     Get.to(VAPage(), arguments: [array[0], val]);
              //   },
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(vertical: 10.sp),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Row(
              //           children: [
              //             Padding(
              //               padding: const EdgeInsets.all(8.0),
              //               child: ImageIcon(
              //                 const AssetImage("assets/images/va.png"),
              //                 color: DataColors.primary400,
              //                 size: 30.sp,
              //               ),
              //             ),
              //             Text(
              //               "Virtual Account (Cek Otomatis)",
              //               style: TextStyle(
              //                   color: DataColors.primary800,
              //                   fontWeight: FontWeight.w600),
              //             )
              //           ],
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Icon(
              //             Icons.arrow_forward_ios_outlined,
              //             size: 15.sp,
              //             color: DataColors.primary800,
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // Container(
              //   height: 1.5.sp,
              //   width: 100.w,
              //   color: DataColors.Neutral200,
              // ),
              // InkWell(
              //   onTap: () {
              //     isvisible = c.onclick(isvisible);
              //   },
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(vertical: 10.sp),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Row(
              //           children: [
              //             Padding(
              //               padding: const EdgeInsets.all(8.0),
              //               child: ImageIcon(
              //                 const AssetImage("assets/images/tf.png"),
              //                 color: DataColors.primary400,
              //                 size: 30.sp,
              //               ),
              //             ),
              //             Text(
              //               "Transfer Bank",
              //               style: TextStyle(
              //                   color: DataColors.primary800,
              //                   fontWeight: FontWeight.w600),
              //             )
              //           ],
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Icon(
              //             Icons.arrow_forward_ios_outlined,
              //             size: 15.sp,
              //             color: DataColors.primary800,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Container(
              //   height: 1.5.sp,
              //   width: 100.w,
              //   color: DataColors.Neutral200,
              // ),
              GetBuilder<DetailTransaksiController>(
                init: DetailTransaksiController(),
                initState: (_) {},
                builder: (_) {
                  return FutureBuilder<dynamic>(
                      future: controller.DataBank(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Visibility(
                            visible: isvisible,
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount: snapshot.data.data.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Container(
                                  height: 1.5.sp,
                                  width: 100.w,
                                  color: DataColors.Neutral200,
                                );
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(BankPage(), arguments: index);
                                  },
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.sp),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 20.sp, right: 10.sp),
                                                height: 30.sp,
                                                width: 30.sp,
                                                child: Image(
                                                  image:
                                                      CachedNetworkImageProvider(
                                                          snapshot.data
                                                              .data[index].img),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              snapshot
                                                  .data.data[index].nameBank,
                                              style: TextStyle(
                                                  color: DataColors.primary800,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                        return Container();
                      });
                },
              ),
            ]),
          ),
        ));
  }
}
