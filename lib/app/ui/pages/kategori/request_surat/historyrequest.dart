import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/request_surat_c.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

import 'detail_surat/detail_surat.dart';

class HistoryRequestPage extends StatelessWidget {
  RequestSuratController controller = Get.put(RequestSuratController());
  @override
  final box = GetStorage();
  Widget build(BuildContext context) {
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
      body: FutureBuilder<dynamic>(
          future: controller.historysurat(data["nim"]),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 5.w),
                child: ListView.separated(
                  itemCount: snapshot.data.total,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10.sp,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.5.w),
                      child: InkWell(
                        onTap: () {
                          Get.to(DetailSuratPage(), arguments: [
                            snapshot.data.data[index].nomorSurat,
                            snapshot.data.data[index].statusSurat
                          ]);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.sp),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: DataColors.primary200, width: 1.sp),
                              borderRadius: BorderRadius.circular(12.sp)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(4.sp),
                                        decoration: BoxDecoration(
                                            color: DataColors.primary100,
                                            borderRadius:
                                                BorderRadius.circular(4.sp)),
                                        child: Text(
                                          snapshot.data.data[index].nomorSurat,
                                          style: TextStyle(
                                              color: DataColors.primary600,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 10.sp),
                                        )),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 10.sp,
                                      color: DataColors.primary600,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10.sp,
                                ),
                                SizedBox(
                                  width: 60.w,
                                  child: Text(
                                    snapshot.data.data[index].surat,
                                    style: TextStyle(
                                        color: DataColors.primary400,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13.sp),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.sp,
                                ),
                                (snapshot.data.data[index].statusSurat == "0")
                                    ? Row(
                                        children: [
                                          Icon(
                                            Icons.hourglass_bottom,
                                            color: HexColor("#E8C35F"),
                                            size: 13.sp,
                                          ),
                                          SizedBox(
                                            width: 5.sp,
                                          ),
                                          Text(
                                            "Menunggu konfirmasi",
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                color: HexColor("#E8C35F")),
                                          ),
                                        ],
                                      )
                                    : (snapshot.data.data[index].statusSurat ==
                                            "1")
                                        ? Row(
                                            children: [
                                              Icon(
                                                Icons.check_circle,
                                                color: HexColor("#66C155"),
                                                size: 13.sp,
                                              ),
                                              SizedBox(
                                                width: 5.sp,
                                              ),
                                              Text(
                                                "Berhasil dikonfirmasi",
                                                style: TextStyle(
                                                    fontSize: 10.sp,
                                                    color: HexColor("#66C155")),
                                              ),
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              Icon(
                                                Icons.cancel,
                                                color: HexColor("#A0321E"),
                                                size: 13.sp,
                                              ),
                                              SizedBox(
                                                width: 5.sp,
                                              ),
                                              Text(
                                                "Ditolak",
                                                style: TextStyle(
                                                    fontSize: 10.sp,
                                                    color: HexColor("#A0321E")),
                                              ),
                                            ],
                                          )
                              ]),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return SizedBox(
                width: 100.w,
                height: 100.h,
                child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("assets/images/datatidakada.png"),
                          height: 100.sp,
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),
                        Text(
                          "Tidak Ada Riwayat Saat Ini",
                          style: TextStyle(color: DataColors.Neutral300),
                        ),
                      ],
                    )),
              );
            }
          }),
    );
  }
}
