import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/monitoringC.dart';
import '../../theme/color.dart';

class SubmitAbsensiPage extends StatelessWidget {
  MonitoringController controller = Get.put(MonitoringController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Absensi Kuliah',
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
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.sp),
                width: 100.w,
                color: DataColors.primary100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.sp),
                        decoration: BoxDecoration(
                            color: DataColors.primary800,
                            borderRadius: BorderRadius.circular(8.sp)),
                        child: Column(
                          children: [
                            Text(
                              "14/16",
                              style: TextStyle(
                                  color: DataColors.primary100,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text("2022",
                                style: TextStyle(
                                    color: DataColors.primary100,
                                    fontWeight: FontWeight.w800))
                          ],
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Biologi Umum",
                            style: TextStyle(
                                color: DataColors.primary800,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 5.sp,
                          ),
                          Text("Regular Class Session",
                              style: TextStyle(
                                  color: DataColors.primary600,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11.sp)),
                          Text("10.20-12.00 WIB",
                              style: TextStyle(
                                  color: DataColors.primary400,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.sp))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: Icon(
                      Icons.info_outline,
                      color: DataColors.primary400,
                    ),
                  ),
                  Text(
                    "Silahkan absen sesuai jadwal mata kuliah",
                    style: TextStyle(
                        color: DataColors.primary, fontWeight: FontWeight.w400),
                  )
                ],
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 50.sp),
                  child: CachedNetworkImage(
                    imageUrl: "http://via.placeholder.com/350x150",
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 70.w,
                  child: Text(
                    "Dihimbau untuk scan QRCode sesuai akun masing masing",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: DataColors.Neutral400,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
