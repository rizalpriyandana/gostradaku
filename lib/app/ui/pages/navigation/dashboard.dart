// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/auth/auth_c.dart';
import 'package:gostradav1/app/controllers/dashboard/dashboard_c.dart';
import 'package:gostradav1/app/controllers/profile/profile_c.dart';
import 'package:gostradav1/app/routes/rout_name.dart';
import 'package:gostradav1/app/ui/pages/kategori/lainnya/lainnya.dart';
import 'package:gostradav1/app/ui/pages/kategori/lainnya/lainnyav2.dart';
import 'package:gostradav1/app/ui/pages/kategori/nonakademik/wisuda.dart';
import 'package:gostradav1/app/ui/pages/library/library.dart';
import 'package:gostradav1/app/ui/pages/library/libraryv2.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../pengumuman/pengumumanpage.dart';

class DashboardPage extends GetView<DashboardController> {
  final auth = Get.find<AuthController>();
  final c = Get.find<DashboardController>();
  final box = GetStorage();
  // String? message = await check

  @override
  Widget build(BuildContext context) {
    ProfileController cc = Get.put(ProfileController());
    List<ChartData> chartData = [];
    Map data = box.read("dataUser") as Map<String, dynamic>;
    final Size size = MediaQuery.of(context).size;
    return Obx(() => cc.isLoading.isTrue
        ? Scaffold(
            body: Center(
                child: LoadingAnimationWidget.fourRotatingDots(
                    color: DataColors.primary700, size: 40.sp)),
          )
        : Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(0, 50.sp),
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // photo Profile
                    Container(
                      padding: EdgeInsets.only(top: 15.sp),
                      child: Row(
                        children: [
                          Container(
                            height: 35.sp,
                            width: 35.sp,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      cc.datalist[0].data![0].photo),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Hi, " + data['name'],
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                data['nim'],
                                style: TextStyle(fontSize: 11.sp),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.sp),
                      child: InkWell(
                        onTap: () => Get.toNamed(RoutName.notifikasi), // needed
                        child: SvgPicture.asset(
                          'assets/images/dashboard/icon/notif.svg',
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // end icon notif
                  ],
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 7.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15.sp,
                    ),
                    //end Say Hello
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.sp),
                      height: 160,
                      alignment: Alignment.centerLeft,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: DataColors.blusky,
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                            image: AssetImage(
                                'assets/images/dashboard/image01.png'),
                            alignment: Alignment.bottomRight),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selamat Datang',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: DataColors.primary700),
                          ),
                          Text(
                            'di GO-STRADA',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: DataColors.primary700),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 20.sp,
                    ),

                    //Kategori
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Kategori',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: DataColors.primary700,
                          ),
                        ),
                        InkWell(
                          onTap: () => showMaterialModalBottomSheet(
                              context: context,
                              // barrierColor: DataColors.primary,
                              expand: false,
                              bounce: true,
                              builder: (context) => Lainnyav2Page(),
                              enableDrag: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.sp),
                                      topRight: Radius.circular(10.sp)))),
                          child: Container(
                            padding: EdgeInsets.only(left: 0.sp, top: 0.sp),
                            width: 25.w,
                            height: 3.h,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(20.sp),
                            //   color: DataColors.blusky,
                            // ),
                            child: Center(
                              child: Text(
                                'Lihat Semua',
                                style: TextStyle(
                                  fontSize: 9.5.sp,
                                  fontWeight: FontWeight.w600,
                                  color: DataColors.Neutral400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 15.sp,
                    ),
                    FutureBuilder(
                      future: controller.checkwisuda(data['nim']),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                                color: DataColors.primary700),
                          );
                        } else {
                          if (controller.hsmsg ==
                                  "Terdaftar sebagai peserta wisuda" &&
                              controller.hsmsg.isNotEmpty) {
                            return ResponsiveGridRow(
                              children: [
                                ResponsiveGridCol(
                                  xs: 3,
                                  md: 1,
                                  child: InkWell(
                                    onTap: () =>
                                        Get.toNamed(RoutName.kategoriakademik),
                                    child: Column(
                                      children: [
                                        Container(
                                            padding: EdgeInsets.all(8.sp),
                                            decoration: BoxDecoration(
                                                color: DataColors.blusky,
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: SvgPicture.asset(
                                              'assets/images/dashboard/icon/akademik.svg',
                                              height: 25.sp,
                                              width: 25.sp,
                                              color: HexColor("#3C5595"),
                                            )),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Akademik',
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
                                    onTap: () => Get.toNamed(RoutName.kategori),
                                    child: Column(
                                      children: [
                                        Container(
                                            padding: EdgeInsets.all(8.sp),
                                            decoration: BoxDecoration(
                                                color: DataColors.blusky,
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: SvgPicture.asset(
                                              'assets/images/dashboard/icon/keuangan.svg',
                                              height: 25.sp,
                                              width: 25.sp,
                                              color: HexColor("#3C5595"),
                                            )),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Keuangan',
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w700,
                                              color: DataColors.primary700),
                                          textAlign: TextAlign.center,
                                        ),
                                        // const SizedBox(
                                        //   height: 15,
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                                ResponsiveGridCol(
                                  xs: 3,
                                  md: 2,
                                  child: InkWell(
                                    onTap: () => Get.toNamed(
                                        RoutName.kategorinonakademik),
                                    child: Column(
                                      children: [
                                        Container(
                                            padding: EdgeInsets.all(8.sp),
                                            decoration: BoxDecoration(
                                                color: DataColors.blusky,
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: SvgPicture.asset(
                                              'assets/images/dashboard/icon/nonakademik.svg',
                                              height: 25.sp,
                                              width: 25.sp,
                                              color: HexColor("#3C5595"),
                                            )),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Non Akademik',
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
                                    onTap: () => Get.to(WisudaPage()),
                                    child: Column(
                                      children: [
                                        Container(
                                            padding: const EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                                color: DataColors.blusky,
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: SvgPicture.asset(
                                              'assets/images/dashboard/icon/akademik.svg',
                                            )),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Wisuda',
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
                                      Get.to(Libraryv2());
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                            padding: EdgeInsets.all(3.sp),
                                            decoration: BoxDecoration(
                                                color: DataColors.blusky,
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: SvgPicture.asset(
                                              'assets/images/dashboard/icon/library.svg',
                                              color: HexColor("#3C5595"),
                                              height: 35.sp,
                                              width: 35.sp,
                                              fit: BoxFit.fill,
                                            )),
                                        SizedBox(
                                          height: 4.sp,
                                        ),
                                        Text(
                                          'E-Library',
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w700,
                                              color: DataColors.primary700),
                                          textAlign: TextAlign.center,
                                        ),
                                        // SizedBox(
                                        //   height: 15.sp,
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return ResponsiveGridRow(
                              children: [
                                ResponsiveGridCol(
                                  xs: 3,
                                  md: 2,
                                  child: InkWell(
                                    onTap: () =>
                                        Get.toNamed(RoutName.kategoriakademik),
                                    child: Column(
                                      children: [
                                        Container(
                                            padding: EdgeInsets.all(8.sp),
                                            decoration: BoxDecoration(
                                                color: DataColors.blusky,
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: SvgPicture.asset(
                                              'assets/images/dashboard/icon/akademik.svg',
                                              height: 25.sp,
                                              width: 25.sp,
                                              color: HexColor("#3C5595"),
                                            )),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Akademik',
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
                                    onTap: () => Get.toNamed(RoutName.kategori),
                                    child: Column(
                                      children: [
                                        Container(
                                            padding: EdgeInsets.all(8.sp),
                                            decoration: BoxDecoration(
                                                color: DataColors.blusky,
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: SvgPicture.asset(
                                              'assets/images/dashboard/icon/keuangan.svg',
                                              height: 25.sp,
                                              width: 25.sp,
                                              color: HexColor("#3C5595"),
                                            )),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Keuangan',
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w700,
                                              color: DataColors.primary700),
                                          textAlign: TextAlign.center,
                                        ),
                                        // const SizedBox(
                                        //   height: 15,
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                                ResponsiveGridCol(
                                  xs: 3,
                                  md: 2,
                                  child: InkWell(
                                    onTap: () => Get.toNamed(
                                        RoutName.kategorinonakademik),
                                    child: Column(
                                      children: [
                                        Container(
                                            padding: EdgeInsets.all(8.sp),
                                            decoration: BoxDecoration(
                                                color: DataColors.blusky,
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: SvgPicture.asset(
                                              'assets/images/dashboard/icon/nonakademik.svg',
                                              height: 25.sp,
                                              width: 25.sp,
                                              color: HexColor("#3C5595"),
                                            )),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Non Akademik',
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

                                // ResponsiveGridCol(
                                //   xs: 3,
                                //   md: 2,
                                //   child: InkWell(
                                //     onTap: () => Get.to(WisudaPage()),
                                //     child: Column(
                                //       children: [
                                //         Container(
                                //             padding: const EdgeInsets.all(15),
                                //             decoration: BoxDecoration(
                                //                 color: DataColors.blusky,
                                //                 borderRadius:
                                //                     BorderRadius.circular(30)),
                                //             child: SvgPicture.asset(
                                //               'assets/images/dashboard/icon/akademik.svg',
                                //             )),
                                //         const SizedBox(
                                //           height: 5,
                                //         ),
                                //         Text(
                                //           'Wisuda',
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
                                ResponsiveGridCol(
                                  xs: 3,
                                  md: 2,
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(Libraryv2());
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                            padding: EdgeInsets.all(3.sp),
                                            decoration: BoxDecoration(
                                                color: DataColors.blusky,
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: SvgPicture.asset(
                                              'assets/images/dashboard/icon/library.svg',
                                              color: HexColor("#3C5595"),
                                              height: 35.sp,
                                              width: 35.sp,
                                              fit: BoxFit.fill,
                                            )),
                                        SizedBox(
                                          height: 4.sp,
                                        ),
                                        Text(
                                          'E-Library',
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w700,
                                              color: DataColors.primary700),
                                          textAlign: TextAlign.center,
                                        ),
                                        // SizedBox(
                                        //   height: 15.sp,
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                        }
                      },
                    ),

                    //end Kategori

                    SizedBox(
                      height: 7.sp,
                    ),

                    //chart IPK
                    Text(
                      'Chart IPK Mahasiswa',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: DataColors.primary700,
                      ),
                    ),

                    SizedBox(height: 5.sp),

                    FutureBuilder<dynamic>(
                        future: c.getipk(data["nim"]),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return SfCartesianChart(
                                legend: Legend(isVisible: false),
                                tooltipBehavior: c.tooltipBehavior,
                                primaryXAxis: CategoryAxis(
                                    labelIntersectAction:
                                        AxisLabelIntersectAction.multipleRows),
                                primaryYAxis: NumericAxis(
                                    interval: 1,
                                    minimum: 0,
                                    maximum: 4,
                                    decimalPlaces: 4),
                              );
                            default:
                              if (snapshot.hasData) {
                                chartData = snapshot.data;
                                return SfCartesianChart(

                                    // DIsable legend
                                    legend: Legend(isVisible: false),
                                    // Enable tooltip
                                    tooltipBehavior: c.tooltipBehavior,
                                    primaryXAxis: CategoryAxis(
                                        // Axis labels will be placed in multiple rows, if it is intersected
                                        labelIntersectAction:
                                            AxisLabelIntersectAction
                                                .multipleRows),
                                    primaryYAxis: NumericAxis(
                                      interval: 1,
                                      minimum: 0,
                                      maximum: 4,
                                      decimalPlaces: 4,
                                      // majorTickLines: 1,
                                    ),
                                    series: <LineSeries<ChartData, String>>[
                                      LineSeries<ChartData, String>(
                                          dataSource: chartData,
                                          xValueMapper: (ChartData data, _) =>
                                              data.semester,
                                          yValueMapper: (ChartData data, _) =>
                                              double.tryParse(data.ipk) ?? 0,
                                          markerSettings: const MarkerSettings(
                                              isVisible: true),
                                          // Enable data label
                                          dataLabelSettings:
                                              const DataLabelSettings(
                                                  isVisible: true))
                                    ]);
                              } else {
                                return Text(
                                  "Tidak Ada Data IPK",
                                  style: TextStyle(
                                      color: DataColors.primary400,
                                      fontWeight: FontWeight.w600),
                                );
                              }
                          }
                        }),
                    //end chart IPK

                    SizedBox(
                      height: 10.sp,
                    ),

                    // untuk anda
                    Text(
                      'Untuk Anda',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: DataColors.primary700,
                      ),
                    ),

                    SizedBox(
                      height: 10.sp,
                    ),

                    // slider image
                    FutureBuilder<dynamic>(
                        future: c.getpengumuman(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Container(
                                child: CarouselSlider(
                                    items: List.generate(c.urlImage.length,
                                        (index) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return InkWell(
                                            onTap: () {
                                              Get.to(PengumumanPage(),
                                                  arguments: snapshot
                                                      .data.data[index].id);
                                            },
                                            child: AnimatedContainer(
                                              padding: const EdgeInsets.all(15),
                                              duration: const Duration(
                                                  milliseconds: 1000),
                                              width: size.width,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          c.urlImage[index]),
                                                      fit: BoxFit.cover),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: ConstrainedBox(
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: size.width,
                                                      ),
                                                      child: AutoSizeText(
                                                        c.capsSlider[index],
                                                        style: const TextStyle(
                                                          fontSize: 20.0,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: InkWell(
                                                      onTap: () {},
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
                                                        decoration: BoxDecoration(
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.4),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        child: const Icon(
                                                          Icons
                                                              .arrow_forward_ios_rounded,
                                                          color: Colors.white,
                                                          size: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }).toList(),
                                    options: CarouselOptions(
                                      aspectRatio: 2.5,
                                      viewportFraction: 0.8,
                                      initialPage: 0,
                                      enableInfiniteScroll: true,
                                      enlargeCenterPage: true,
                                      pageSnapping: true,
                                      scrollDirection: Axis.horizontal,
                                    )));
                          } else {
                            return Container();
                          }
                        }),
                    // end untuk anda

                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ));
  }
}

class SalesData {
  SalesData(this.semester, this.ipk);
  final String semester;
  final String ipk;
}

class ChartData {
  ChartData(this.semester, this.ipk);
  String semester;
  String ipk;
}
