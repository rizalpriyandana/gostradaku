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

class DetailBookPage extends StatefulWidget {
  @override
  State<DetailBookPage> createState() => _DetailBookPageState();
}

class _DetailBookPageState extends State<DetailBookPage> {
  var datas = Get.arguments;
  List<TextEditingController> namebook = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        elevation: 0,
        backgroundColor: DataColors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 10.sp),
            child: Column(
              children: [
                Center(
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    width: 135.sp,
                    height: 200.sp,
                    padding: EdgeInsets.all(0.sp),
                    decoration: BoxDecoration(
                      color: DataColors.Neutral200,
                      border: Border.all(
                        color: DataColors.Neutral200,
                        width: 10,
                      ),
                      borderRadius: BorderRadius.circular(8.sp),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(5.sp),
                      width: 135.sp,
                      height: 200.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.sp),
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/coverbuku/' + datas[0]),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      datas[1], //judul buku
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: DataColors.primary800),
                    ),
                    SizedBox(
                      height: 2.sp,
                    ),
                    Text(
                      datas[2], //nama buku
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: DataColors.primary800),
                    ),
                    SizedBox(
                      height: 2.sp,
                    ),
                    Text(
                      datas[3], //penulis
                      style: TextStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w500,
                          color: DataColors.Neutral300),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    // Center(child: WidgetInfoPages())
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 0.sp),
                              child: WidgetInfoPages(
                                pages: datas[6],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 0.sp),
                              child: WidgetInfoRating(rating: datas[4]),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 0.sp),
                              child: WidgetInfoTahun(tahun: datas[7]),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Padding(
                    //       padding: EdgeInsets.only(left: 20.sp),
                    //       child: RatingBar.builder(
                    //         itemSize: 20.sp,
                    //         initialRating: double.parse(datas[4]),
                    //         minRating: 1,
                    //         direction: Axis.horizontal,
                    //         allowHalfRating: true,
                    //         itemCount: 5,
                    //         itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    //         itemBuilder: (context, _) => const Icon(
                    //           Icons.star,
                    //           color: Colors.amber,
                    //         ),
                    //         onRatingUpdate: (rating) {},
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 2.sp,
                    //     ),
                    //     RichText(
                    //       text: TextSpan(
                    //           text: datas[4],
                    //           style: TextStyle(
                    //               fontSize: 10.sp,
                    //               fontWeight: FontWeight.bold,
                    //               color: DataColors.primary800),
                    //           children: <TextSpan>[
                    //             TextSpan(
                    //                 text: "/5.0",
                    //                 style: TextStyle(
                    //                     fontSize: 10.sp,
                    //                     fontWeight: FontWeight.w200,
                    //                     color: DataColors.Neutral200))
                    //           ]),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
                      child: Text(
                        "Sinopsis",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: DataColors.primary800),
                      ),
                    ),
                    SizedBox(
                      height: 7.sp,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
                      child: Text(
                        datas[5],
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: DataColors.primary800),
                        // textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(
                      height: 25.sp,
                    ),
                  ],
                ),
                // Row(
                //   // mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     GestureDetector(
                //       onTap: () {
                //         Fluttertoast.showToast(
                //             msg: "Open Book", toastLength: Toast.LENGTH_SHORT);
                //       },
                //       child: Padding(
                //         padding: EdgeInsets.only(left: 15.sp),
                //         child: Container(
                //           // padding: EdgeInsets.all(10.sp),
                //           width: 130.sp,
                //           height: 5.5.h,
                //           decoration: BoxDecoration(
                //             color: DataColors.primary800,
                //             borderRadius: BorderRadius.circular(5.sp),
                //           ),
                //           child: Row(
                //             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             // mainAxisSize: MainAxisSize.min,
                //             children: [
                //               Padding(
                //                 padding: EdgeInsets.only(
                //                     right: 5.sp,
                //                     left: 15.sp,
                //                     top: 5.sp,
                //                     bottom: 5.sp),
                //                 child: Image.asset(
                //                   'assets/icon/openbook.png',
                //                   height: 20.sp,
                //                   width: 20.sp,
                //                 ),
                //               ),
                //               Padding(
                //                 padding: EdgeInsets.only(left: 5.sp),
                //                 child: Text(
                //                   "Start Reading",
                //                   style: TextStyle(
                //                       color: DataColors.white,
                //                       fontWeight: FontWeight.w700,
                //                       fontSize: 10.sp),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //     SizedBox(
                //       width: 10.sp,
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         Get.to(FormPeminjaman(), arguments: [
                //           datas[2],
                //           datas[8],
                //           datas[9],
                //         ]);
                //       },
                //       child: Padding(
                //         padding: EdgeInsets.only(right: 15.sp),
                //         child: Container(
                //           // padding: EdgeInsets.all(10.sp),
                //           width: 130.sp,
                //           height: 5.5.h,
                //           decoration: BoxDecoration(
                //             color: DataColors.primary600,
                //             borderRadius: BorderRadius.circular(5.sp),
                //           ),
                //           child: Row(
                //             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             // mainAxisSize: MainAxisSize.min,
                //             children: [
                //               Padding(
                //                 padding: EdgeInsets.only(
                //                     right: 5.sp,
                //                     left: 15.sp,
                //                     top: 5.sp,
                //                     bottom: 5.sp),
                //                 child: Image.asset(
                //                   'assets/icon/borrow.png',
                //                   height: 25.sp,
                //                   width: 25.sp,
                //                 ),
                //               ),
                //               Padding(
                //                 padding: EdgeInsets.only(left: 5.sp),
                //                 child: Text(
                //                   "Borrow Book",
                //                   style: TextStyle(
                //                       color: DataColors.white,
                //                       fontWeight: FontWeight.w700,
                //                       fontSize: 10.sp),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //     // ElevatedButton(
                //     //   onPressed: () {
                //     //     Get.to(FormPeminjaman());
                //     //   },
                //     //   style: ElevatedButton.styleFrom(
                //     //     // side: BorderSide(width: 1.sp, color: DataColors.primary),
                //     //     backgroundColor: DataColors.primary600,
                //     //     // foregroundColor: DataColors.primary700,
                //     //     shape: RoundedRectangleBorder(
                //     //       borderRadius: BorderRadius.circular(5.sp),
                //     //     ),
                //     //     padding: EdgeInsets.only(
                //     //         top: 6.sp, bottom: 6.sp, right: 8.sp),
                //     //   ),
                //     //   child: Row(
                //     //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     //     mainAxisSize: MainAxisSize.min,
                //     //     children: [
                //     //       Padding(
                //     //         padding: EdgeInsets.all(5.0.sp),
                //     //         child: Image.asset(
                //     //           'assets/icon/borrow.png',
                //     //           height: 15.sp,
                //     //           width: 15.sp,
                //     //         ),
                //     //       ),
                //     //       Text(
                //     //         "Borrow Book",
                //     //         style: TextStyle(
                //     //             color: DataColors.white,
                //     //             fontWeight: FontWeight.w700,
                //     //             fontSize: 10.sp),
                //     //       ),
                //     //     ],
                //     //   ),
                //     // ),
                //   ],
                // )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
                      onTap: () {
                        Get.to(FormPeminjaman(), arguments: [
                          datas[2],
                          datas[8],
                          datas[9],
                        ]);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.sp, left: 10.sp, bottom: 10.sp),
                        child: Container(
                          // padding: EdgeInsets.all(10.sp),
                          width: double.infinity,
                          height: 5.5.h,
                          decoration: BoxDecoration(
                            color: DataColors.primary600,
                            borderRadius: BorderRadius.circular(5.sp),
                          ),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    right: 5.sp,
                                    left: 85.sp,
                                    top: 5.sp,
                                    bottom: 5.sp),
                                child: Image.asset(
                                  'assets/icon/borrow.png',
                                  height: 25.sp,
                                  width: 25.sp,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.sp),
                                child: Text(
                                  "Borrow Book",
                                  style: TextStyle(
                                      color: DataColors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10.sp),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
    );
  }
}
