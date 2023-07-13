import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:sizer/sizer.dart';

import '../../../../routes/rout_name.dart';
import '../pengajuankeringanan/pengajuanpage.dart';

class KategoriPage2 extends StatelessWidget {
  const KategoriPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(0.sp),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 2.h,),
          Padding(
            padding: EdgeInsets.only(left: 0.sp, right: 10.sp),
            child: ResponsiveGridRow(
              children: [
                ResponsiveGridCol(
                  xs: 3,
                  md: 2,
                  child: InkWell(
                    onTap: () => Get.toNamed(RoutName.tagihan),
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.sp, right: 0.sp),
                      child: Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: DataColors.blusky,
                                  borderRadius: BorderRadius.circular(30)),
                              child: SvgPicture.asset(
                                  'assets/images/dashboard/icon/tagihan.svg')),
                          SizedBox(
                            height: 6.sp,
                          ),
                          Text(
                            'Tagihan',
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
                ResponsiveGridCol(
                  xs: 3,
                  md: 2,
                  child: InkWell(
                    onTap: () => Get.toNamed(RoutName.riwayatBayar),
                    child: Padding(
                      padding: EdgeInsets.only(left: 6.sp, right: 6.sp),
                      child: Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: DataColors.blusky,
                                  borderRadius: BorderRadius.circular(30)),
                              child: SvgPicture.asset(
                                  'assets/images/dashboard/icon/riwayatbayar.svg')),
                          SizedBox(
                            height: 5.sp,
                          ),
                          Text(
                            'Riwayat Bayar',
                            style: TextStyle(
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w600,
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
                ResponsiveGridCol(
                  xs: 3,
                  md: 2,
                  child: InkWell(
                    onTap: () => Get.toNamed(RoutName.uploadBuktiBayar),
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.sp, right: 10.sp),
                      child: Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: DataColors.blusky,
                                  borderRadius: BorderRadius.circular(30)),
                              child: SvgPicture.asset(
                                  'assets/images/dashboard/icon/uploadbuktibayar.svg')),
                          SizedBox(
                            height: 5.sp,
                          ),
                          Text(
                            'Upload Bukti Bayar',
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
                ResponsiveGridCol(
                  xs: 3,
                  md: 2,
                  child: InkWell(
                    onTap: () => Get.to(KeringananPage()),
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.sp, right: 5.sp),
                      child: Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: DataColors.blusky,
                                  borderRadius: BorderRadius.circular(30)),
                              child: SvgPicture.asset(
                                'assets/images/dashboard/icon/pengajuankeringanan.svg',
                              )),
                          SizedBox(
                            height: 5.sp,
                          ),
                          Text(
                            'Pengajuan Keringanan',
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
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
