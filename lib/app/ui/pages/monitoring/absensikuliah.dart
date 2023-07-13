import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/monitoringC.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import '../../theme/color.dart';

class AbsensiKuliahPage extends StatelessWidget {
  MonitoringController controller = Get.put(MonitoringController());
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    Map data = box.read("dataUser") as Map<String, dynamic>;
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
      body: FutureBuilder<dynamic>(
          future: controller.GetDetailAbsensi(data["nim"]),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                    child: Column(
                      children: [
                        ListView.builder(
                            itemCount: snapshot.data.data.length,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemBuilder: (BuildContext context, int i) {
                              return ListView.builder(
                                itemCount: snapshot.data.data[i].data.length,
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemBuilder: (BuildContext context, int j) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 20.sp),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot
                                              .data.data[i].data[j].bulanTahun,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: DataColors.primary800,
                                              fontSize: 14.sp),
                                        ),
                                        SizedBox(
                                          height: 15.sp,
                                        ),
                                        ListView.builder(
                                          itemCount: snapshot
                                              .data.data[i].data[j].data.length,
                                          shrinkWrap: true,
                                          physics: const ScrollPhysics(),
                                          itemBuilder:
                                              (BuildContext context, int k) {
                                            var status = snapshot.data.data[i]
                                                .data[j].data[k].statusAbsensi;
                                            var statuskelas = snapshot
                                                .data
                                                .data[i]
                                                .data[j]
                                                .data[k]
                                                .statusKelas;
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: 10.sp),
                                              child: InkWell(
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 12.sp,
                                                      horizontal: 12.sp),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          DataColors.primary100,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.sp)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      10.sp),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.sp),
                                                              color: DataColors
                                                                  .primary800),
                                                          child: Column(
                                                            children: [
                                                              SizedBox(
                                                                child: Text(
                                                                  "${snapshot.data.data[i].data[j].data[k].tanggal} \n${snapshot.data.data[i].data[j].data[k].hari}",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      color: DataColors
                                                                          .primary100,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      const Spacer(
                                                        flex: 1,
                                                      ),
                                                      Expanded(
                                                        flex: 10,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              snapshot
                                                                  .data
                                                                  .data[i]
                                                                  .data[j]
                                                                  .data[k]
                                                                  .matkul,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12.sp,
                                                                  color: DataColors
                                                                      .primary800,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                            SizedBox(
                                                                height: 5.sp),
                                                            Text(
                                                                snapshot
                                                                    .data
                                                                    .data[i]
                                                                    .data[j]
                                                                    .data[k]
                                                                    .dosen,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10.sp,
                                                                    color: DataColors
                                                                        .primary,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500)),
                                                            SizedBox(
                                                                height: 5.sp),
                                                            Text(
                                                                "${snapshot.data.data[i].data[j].data[k].startTime}-${snapshot.data.data[i].data[j].data[k].endTime} WIB",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10.sp,
                                                                    color: DataColors
                                                                        .Neutral400,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500)),
                                                            SizedBox(
                                                                height: 5.sp),
                                                            Row(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    (status ==
                                                                            "1")
                                                                        ? Icon(
                                                                            Icons
                                                                                .check_circle,
                                                                            size:
                                                                                10.sp,
                                                                            color: HexColor("2F9927"))
                                                                        : (status == "2")
                                                                            ? Icon(
                                                                                Icons.cancel_presentation_rounded,
                                                                                size: 10.sp,
                                                                                color: Colors.red,
                                                                              )
                                                                            : (status == "3")
                                                                                ? Icon(Icons.pending_actions, color: Colors.yellow, size: 10.sp)
                                                                                : (status == "4")
                                                                                    ? Icon(Icons.local_hospital, color: Colors.blue, size: 10.sp)
                                                                                    : Icon(Icons.question_mark_outlined, color: Colors.grey, size: 10.sp),
                                                                    SizedBox(
                                                                      width:
                                                                          2.sp,
                                                                    ),
                                                                    Text(
                                                                      (status ==
                                                                              "1")
                                                                          ? "Hadir"
                                                                          : (status == "2")
                                                                              ? "Absen"
                                                                              : (status == "3")
                                                                                  ? "izin"
                                                                                  : (status == "4")
                                                                                      ? "sakit"
                                                                                      : "Belum Absen",
                                                                      style: TextStyle(
                                                                          fontSize: 9.sp,
                                                                          color: (status == "1")
                                                                              ? HexColor("2F9927")
                                                                              : (status == "2")
                                                                                  ? Colors.red
                                                                                  : (status == "3")
                                                                                      ? Colors.yellow
                                                                                      : (status == "4")
                                                                                          ? Colors.blue
                                                                                          : Colors.grey),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  width: 10.sp,
                                                                ),
                                                                (statuskelas ==
                                                                        "0")
                                                                    ? Text(
                                                                        "Kelas: On Schedule",
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .green,
                                                                            fontSize: 9
                                                                                .sp))
                                                                    : (statuskelas ==
                                                                            "1")
                                                                        ? Text(
                                                                            "Kelas: Selesai",
                                                                            style:
                                                                                TextStyle(color: Colors.grey, fontSize: 9.sp))
                                                                        : (statuskelas == "2")
                                                                            ? Text("Kelas: Batal", style: TextStyle(color: Colors.red, fontSize: 9.sp))
                                                                            : Text("Kelas: Ganti", style: TextStyle(color: Colors.amber, fontSize: 9.sp))
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            }),
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      "Tidak Ada Absensi",
                      style: TextStyle(color: DataColors.primary600),
                    ),
                  );
                }
            }
          }),
    );
  }
}
