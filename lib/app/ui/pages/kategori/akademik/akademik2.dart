import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:gostradav1/app/ui/pages/kategori/khs/khs.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:sizer/sizer.dart';

import '../../../../routes/rout_name.dart';

import '../../scanner/scanner.dart';
import '../monitoringskripsi/monitoringskripsi.dart';
import '../pengajuan_skripsi/pengajuan.dart';
import '../request_surat/requestsuratpage.dart';
import '../yudisium/yudisium.dart';

class AkademikPage2 extends StatelessWidget {
  const AkademikPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0.h),
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
                    onTap: () => Get.toNamed(RoutName.penawaranKrs),
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.sp, right: 0.sp),
                      child: Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: HexColor("#56D9D1"),
                                  borderRadius: BorderRadius.circular(30)),
                              child: SvgPicture.asset(
                                'assets/images/dashboard/icon/penawarankrs.svg',
                                color: DataColors.primary800,
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Penawaran KRS',
                            style: TextStyle(
                                fontSize: 10.sp,
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
                    onTap: () => Get.toNamed(RoutName.krs),
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: HexColor("#56D9D1"),
                                borderRadius: BorderRadius.circular(30)),
                            child: SvgPicture.asset(
                              'assets/images/dashboard/icon/datakrs.svg',
                              color: DataColors.primary800,
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Data KRS',
                          style: TextStyle(
                              fontSize: 10.sp,
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
                ResponsiveGridCol(
                  xs: 3,
                  md: 2,
                  child: InkWell(
                    onTap: () => Get.to(KhsPage()),
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: HexColor("#56D9D1"),
                                borderRadius: BorderRadius.circular(30)),
                            child: SvgPicture.asset(
                              'assets/images/dashboard/icon/datakhs.svg',
                              color: DataColors.primary800,
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Data KHS',
                          style: TextStyle(
                              fontSize: 10.sp,
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
                ResponsiveGridCol(
                  xs: 3,
                  md: 2,
                  child: InkWell(
                    onTap: () => Get.toNamed(RoutName.transkrip),
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: HexColor("#56D9D1"),
                                borderRadius: BorderRadius.circular(30)),
                            child: SvgPicture.asset(
                              'assets/images/dashboard/icon/transkrip.svg',
                              color: DataColors.primary800,
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Transkip Nilai',
                          style: TextStyle(
                              fontSize: 10.sp,
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
                ResponsiveGridCol(
                  xs: 3,
                  md: 2,
                  child: InkWell(
                    onTap: () {
                      Get.to(const QRViewExample());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.sp, right: 0.sp),
                      child: Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: HexColor("#56D9D1"),
                                  borderRadius: BorderRadius.circular(30)),
                              child: SvgPicture.asset(
                                'assets/images/dashboard/icon/absensi.svg',
                                color: DataColors.primary800,
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Absensi',
                            style: TextStyle(
                                fontSize: 10.sp,
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
                    onTap: () => Get.to(YudisumPage()),
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: HexColor("#56D9D1"),
                                borderRadius: BorderRadius.circular(30)),
                            child: SvgPicture.asset(
                              'assets/images/dashboard/icon/daftaryudisium.svg',
                              color: DataColors.primary800,
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Daftar Yudisium',
                          style: TextStyle(
                              fontSize: 10.sp,
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
                ResponsiveGridCol(
                  xs: 3,
                  md: 2,
                  child: InkWell(
                    onTap: () => Get.to(RequestSuratPage()),
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: HexColor("#56D9D1"),
                                borderRadius: BorderRadius.circular(30)),
                            child: SvgPicture.asset(
                              'assets/images/dashboard/icon/requestsurat.svg',
                              color: DataColors.primary800,
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Request Surat',
                          style: TextStyle(
                              fontSize: 10.sp,
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
                ResponsiveGridCol(
                  xs: 3,
                  md: 2,
                  child: InkWell(
                    onTap: () => Get.to(PengajuanSkripsiPage()),
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: HexColor("#56D9D1"),
                                borderRadius: BorderRadius.circular(30)),
                            child: Iconify(
                              Ion.ios_paper_outline,
                              size: 21.sp,
                              color: DataColors.primary700,
                            )),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Pengajuan Skripsi',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700,
                            color: DataColors.primary800,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  xs: 3,
                  md: 2,
                  child: InkWell(
                    onTap: () => Get.to(MonitoringSkripsiPage()),
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.sp, right: 0.sp),
                      child: Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: HexColor("#56D9D1"),
                                  borderRadius: BorderRadius.circular(30)),
                              child: SvgPicture.asset(
                                  'assets/images/dashboard/icon/konsultasidospem.svg')),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Konsultasi Dospem',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w700,
                              color: DataColors.primary800,
                            ),
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
