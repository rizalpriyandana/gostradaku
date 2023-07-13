import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/controllers/notifikasi/notifikasi_c.dart';
import 'package:gostradav1/app/ui/pages/notifikasi/allnotifikasi.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:sizer/sizer.dart';

class NotifikasiPage extends StatefulWidget {
  @override
  State<NotifikasiPage> createState() => _NotifikasiPageState();
}

class _NotifikasiPageState extends State<NotifikasiPage>
    with TickerProviderStateMixin {
  NotifikasiController cn = Get.find<NotifikasiController>();
  @override
  Widget build(BuildContext context) {
    TabController tc = TabController(length: 5, vsync: this);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifikasi',
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: DataColors.primary700),
        ),
        backgroundColor: DataColors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: DataColors.primary700,
              ), // Put icon of your preference.
              onPressed: () {
                Get.back();
              },
            );
          },
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10.sp),
        child: Column(
          children: [
            Container(
              child: TabBar(
                controller: tc,
                isScrollable: true,
                unselectedLabelColor: DataColors.primary,
                labelPadding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                labelColor: DataColors.primary700,
                indicatorColor: DataColors.primary800,
                tabs: [
                  Tab(
                    child: Text(
                      "Semua",
                      style: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Hari Ini",
                      style: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Kemarin",
                      style: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Minggu Lalu",
                      style: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Bulan Lalu",
                      style: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.sp,
            ),
            Expanded(
              child: TabBarView(controller: tc, children: [
                AllNotifikasi(),
                Padding(
                  padding: EdgeInsets.only( left: 5.sp, top: 39.sp),
                  child: ListView.builder(
                    itemCount: cn.content.length,
                    itemBuilder: (BuildContext context, index) {
                      return ContentHariIni(
                          title: cn.content[index].title,
                          subtitle: cn.content[index].subtitle,
                          description: cn.content[index].description,
                          icon: cn.content[index].icon);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only( left: 5.sp, top: 39.sp),
                  child: ListView.builder(
                    itemCount: cn.content.length,
                    itemBuilder: (BuildContext context, index) {
                      return Content2(
                        title: cn.content[index].title,
                        subtitle: cn.content[index].subtitle,
                        description: cn.content[index].description,
                        icon: cn.content[index].icon,
                        time: cn.content[index].time,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only( left: 5.sp, top: 39.sp),
                  child: NoContent(),
                ),
                Padding(
                  padding: EdgeInsets.only( left: 5.sp, top: 39.sp),
                  child: NoContent(),
                ),
                // Container(
                //   padding: EdgeInsets.all(0.sp),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Center(
                //         child: Image.asset(
                //           'assets/icon/notification.png',
                //           height: 50.sp,
                //           width: 50.sp,
                //         ),
                //       ),
                //       SizedBox(
                //         height: 10.sp,
                //       ),
                //       Text(
                //         "Belum ada Notifikasi",
                //         style: TextStyle(
                //             fontSize: 14.sp,
                //             fontWeight: FontWeight.bold,
                //             color: DataColors.primary700),
                //       )
                //     ],
                //   ),
                // ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
