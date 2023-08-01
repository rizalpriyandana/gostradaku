import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/routes/rout_name.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:sizer/sizer.dart';

class NonAkademikPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(top: 12.sp),
            child: ResponsiveGridRow(
              children: [
                // ResponsiveGridCol(
                //   xs: 3,
                //   md: 2,
                //   child: InkWell(
                //     //onTap: () => Get.toNamed(RoutName.tagihan),
                //     child: Column(
                //       children: [
                //         Container(
                //             padding: const EdgeInsets.all(15),
                //             decoration: BoxDecoration(
                //                 color: DataColors.primary,
                //                 borderRadius: BorderRadius.circular(30)),
                //             child: SvgPicture.asset(
                //                 'assets/images/dashboard/icon/englishroom.svg',
                //                 color: DataColors.primary100)),
                //         const SizedBox(
                //           height: 5,
                //         ),
                //         Text(
                //           'English Room',
                //           style: TextStyle(
                //               fontSize: 10.sp,
                //               fontWeight: FontWeight.w700,
                //               color: DataColors.primary700),
                //           textAlign: TextAlign.center,
                //         ),
                //         const SizedBox(
                //           height: 15,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // ResponsiveGridCol(
                //   xs: 3,
                //   md: 2,
                //   child: InkWell(
                //     //onTap: () => Get.toNamed(RoutName.riwayatBayar),
                //     child: Column(
                //       children: [
                //         Container(
                //             padding: const EdgeInsets.all(15),
                //             decoration: BoxDecoration(
                //                 color: DataColors.primary,
                //                 borderRadius: BorderRadius.circular(30)),
                //             child: SvgPicture.asset(
                //               'assets/images/dashboard/icon/publicspeaking.svg',
                //               color: DataColors.primary100,
                //             )),
                //         const SizedBox(
                //           height: 5,
                //         ),
                //         Text(
                //           'Public Speaking',
                //           style: TextStyle(
                //               fontSize: 10.sp,
                //               fontWeight: FontWeight.w600,
                //               color: DataColors.primary700),
                //           textAlign: TextAlign.center,
                //         ),
                //         const SizedBox(
                //           height: 15,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                ResponsiveGridCol(
                  xs: 3,
                  md: 2,
                  child: InkWell(
                    onTap: () => Get.toNamed(RoutName.softskill),
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.sp, right: 0.sp),
                      child: Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: DataColors.primary,
                                  borderRadius: BorderRadius.circular(30)),
                              child: SvgPicture.asset(
                                  'assets/images/dashboard/icon/softskill.svg',
                                  color: DataColors.primary100)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Soft Skill',
                            style: TextStyle(
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w700,
                                color: DataColors.primary700),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // ResponsiveGridCol(
                //   xs: 3,
                //   md: 2,
                //   child: InkWell(
                //     //onTap: () => Get.toNamed(RoutName.transkrip),
                //     child: Column(
                //       children: [
                //         Container(
                //             padding: const EdgeInsets.all(15),
                //             decoration: BoxDecoration(
                //                 color: DataColors.primary,
                //                 borderRadius: BorderRadius.circular(30)),
                //             child: SvgPicture.asset(
                //                 'assets/images/dashboard/icon/konsultasidospem.svg',
                //                 color: DataColors.primary100)),
                //         const SizedBox(
                //           height: 5,
                //         ),
                //         Text(
                //           'Konsultasi Dospem',
                //           style: TextStyle(
                //               fontSize: 10.sp,
                //               fontWeight: FontWeight.w700,
                //               color: DataColors.primary700),
                //           textAlign: TextAlign.center,
                //         ),
                //         const SizedBox(
                //           height: 15,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // ResponsiveGridCol(
                //   xs: 3,
                //   md: 2,
                //   child: InkWell(
                //     //onTap: () => Get.toNamed(RoutName.transkrip),
                //     child: Column(
                //       children: [
                //         Container(
                //             padding: const EdgeInsets.all(15),
                //             decoration: BoxDecoration(
                //                 color: DataColors.primary,
                //                 borderRadius: BorderRadius.circular(30)),
                //             child: SvgPicture.asset(
                //                 'assets/images/dashboard/icon/kuliahonline.svg',
                //                 color: DataColors.primary100)),
                //         const SizedBox(
                //           height: 5,
                //         ),
                //         Text(
                //           'Konsultasi Online',
                //           style: TextStyle(
                //               fontSize: 10.sp,
                //               fontWeight: FontWeight.w700,
                //               color: DataColors.primary700),
                //           textAlign: TextAlign.center,
                //         ),
                //         const SizedBox(
                //           height: 15,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
