import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/ui/pages/kategori/pengajuankeringanan/pengajuanpage.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:sizer/sizer.dart';

import '../../../../routes/rout_name.dart';

class KategoriPage extends StatelessWidget {
  const KategoriPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Keuangan',
          style: TextStyle(
              color: DataColors.primary700, fontWeight: FontWeight.w600),
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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                xs: 3,
                md: 2,
                child: InkWell(
                  onTap: () => Get.toNamed(RoutName.tagihan),
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: DataColors.blusky,
                              borderRadius: BorderRadius.circular(30)),
                          child: SvgPicture.asset(
                              'assets/images/dashboard/icon/tagihan.svg')),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Tagihan',
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
                  onTap: () => Get.toNamed(RoutName.riwayatBayar),
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: DataColors.blusky,
                              borderRadius: BorderRadius.circular(30)),
                          child: SvgPicture.asset(
                              'assets/images/dashboard/icon/riwayatbayar.svg')),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Riwayat Bayar',
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
                  onTap: () => Get.toNamed(RoutName.uploadBuktiBayar),
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: DataColors.blusky,
                              borderRadius: BorderRadius.circular(30)),
                          child: SvgPicture.asset(
                              'assets/images/dashboard/icon/uploadbuktibayar.svg')),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Upload Bukti Bayar',
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
                  onTap: () => Get.to(KeringananPage()),
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
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Pengajuan Keringanan',
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
            ],
          ),
        ]),
      ),
    );
  }
}
