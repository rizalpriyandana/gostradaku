import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sizer/sizer.dart';
import '../../../controllers/dashboard/dashboard_c.dart';
import '../../theme/color.dart';
import 'package:intl/intl.dart';

class PengumumanPage extends StatelessWidget {
  @override
  DashboardController controller = Get.put(DashboardController());
  Widget build(BuildContext context) {
    var i = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pengumuman',
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
      body: FutureBuilder<dynamic>(
          future: controller.getdetailpengumuman(i),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7.5.w),
                          child: Text(
                            snapshot.data.data.title,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: DataColors.primary800,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 2.sp,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7.5.w),
                          child: Text(
                            DateFormat('dd/MM/yyyy, kk:mm' + " WIB")
                                .format(snapshot.data.data.createdDate),
                            style: TextStyle(
                                color: DataColors.Neutral400,
                                fontWeight: FontWeight.w400,
                                fontSize: 11.sp),
                          ),
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7.5.w),
                          child: Text(
                            snapshot.data.data.content,
                            textAlign: TextAlign.justify,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        SizedBox(
                          height: 50.h,
                          child: PinchZoom(
                            child: CachedNetworkImage(
                              imageUrl: snapshot.data.data.gambar,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      CircularProgressIndicator(
                                          value: downloadProgress.progress),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            resetDuration: const Duration(milliseconds: 100),
                            maxScale: 2.5,
                            onZoomStart: () {
                              print('Start zooming');
                            },
                            onZoomEnd: () {
                              print('Stop zooming');
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Text("");
                }
            }
          }),
    );
  }
}
