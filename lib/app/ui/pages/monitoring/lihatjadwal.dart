import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/monitoringC.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../theme/color.dart';

class JadwalKuliahPage extends StatelessWidget {
  final box = GetStorage();
  MonitoringController controller = Get.put(MonitoringController());
  @override
  Widget build(BuildContext context) {
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Agenda Kegiatan',
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
          future: controller.GetDetailJadwal(data["nim"]),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                            itemCount: snapshot.data.data.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const ScrollPhysics(),
                            itemBuilder: (BuildContext context, int i) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data.data[i].tahun,
                                    style: TextStyle(
                                        color: DataColors.primary800,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp),
                                  ),
                                  SizedBox(
                                    height: 5.sp,
                                  ),
                                  ListView.builder(
                                    itemCount:
                                        snapshot.data.data[i].data.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    physics: const ScrollPhysics(),
                                    itemBuilder: (BuildContext context, int j) {
                                      return Padding(
                                        padding: EdgeInsets.only(bottom: 15.sp),
                                        child: SizedBox(
                                          child: ListView.builder(
                                              scrollDirection: Axis.vertical,
                                              shrinkWrap: true,
                                              physics: const ScrollPhysics(),
                                              itemCount: snapshot.data.data[i]
                                                  .data[j].data.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int k) {
                                                return Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 3.sp,
                                                                horizontal:
                                                                    5.sp),
                                                        decoration: BoxDecoration(
                                                            color: DataColors
                                                                .primary100,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.sp)),
                                                        child: Text(
                                                            snapshot
                                                                .data
                                                                .data[i]
                                                                .data[j]
                                                                .data[k]
                                                                .labelTanggal,
                                                            style: TextStyle(
                                                                color: DataColors
                                                                    .primary800,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize:
                                                                    12.sp)),
                                                      ),
                                                    ),
                                                    const Spacer(
                                                      flex: 1,
                                                    ),
                                                    Expanded(
                                                      flex: 12,
                                                      child: ListView.builder(
                                                        itemCount: snapshot
                                                            .data
                                                            .data[i]
                                                            .data[j]
                                                            .data[k]
                                                            .data
                                                            .length,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        shrinkWrap: true,
                                                        physics:
                                                            const ScrollPhysics(),
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int l) {
                                                          return Jadwal(
                                                              matkul: snapshot
                                                                  .data
                                                                  .data[i]
                                                                  .data[j]
                                                                  .data[k]
                                                                  .data[l]
                                                                  .matkul,
                                                              codeMk: snapshot
                                                                  .data
                                                                  .data[i]
                                                                  .data[j]
                                                                  .data[k]
                                                                  .data[l]
                                                                  .codeMk,
                                                              materi: snapshot
                                                                  .data
                                                                  .data[i]
                                                                  .data[j]
                                                                  .data[k]
                                                                  .data[l]
                                                                  .materi,
                                                              ruangan: snapshot
                                                                  .data
                                                                  .data[i]
                                                                  .data[j]
                                                                  .data[k]
                                                                  .data[l]
                                                                  .ruangan,
                                                              tanggal: snapshot
                                                                  .data
                                                                  .data[i]
                                                                  .data[j]
                                                                  .data[k]
                                                                  .data[l]
                                                                  .tanggal,
                                                              jam: snapshot
                                                                  .data
                                                                  .data[i]
                                                                  .data[j]
                                                                  .data[k]
                                                                  .data[l]
                                                                  .jam,
                                                              jenisJadwal:
                                                                  snapshot
                                                                      .data
                                                                      .data[i]
                                                                      .data[j]
                                                                      .data[k]
                                                                      .data[l]
                                                                      .tipeKuliah,
                                                              dosen: snapshot
                                                                  .data
                                                                  .data[i]
                                                                  .data[j]
                                                                  .data[k]
                                                                  .data[l]
                                                                  .dosen);

                                                          // return Padding(
                                                          //   padding:
                                                          //       EdgeInsets.only(
                                                          //           bottom:
                                                          //               10.sp),
                                                          //   child: Container(
                                                          //     padding: EdgeInsets
                                                          //         .symmetric(
                                                          //             horizontal:
                                                          //                 10.sp,
                                                          //             vertical:
                                                          //                 15.sp),
                                                          //     decoration: BoxDecoration(
                                                          //         border: Border.all(
                                                          //             color: DataColors
                                                          //                 .primary200),
                                                          //         borderRadius:
                                                          //             BorderRadius
                                                          //                 .circular(
                                                          //                     5.sp)),
                                                          //     child: Column(
                                                          //       crossAxisAlignment:
                                                          //           CrossAxisAlignment
                                                          //               .start,
                                                          //       children: [
                                                          //         Text(
                                                          //           "${snapshot.data.data[i].data[j].data[k].data[l].matkul}",
                                                          //           style: const TextStyle(
                                                          //               fontWeight:
                                                          //                   FontWeight.w600),
                                                          //         ),
                                                          //         SizedBox(
                                                          //           height:
                                                          //               10.sp,
                                                          //         ),
                                                          //         Text(
                                                          //           snapshot
                                                          //               .data
                                                          //               .data[i]
                                                          //               .data[j]
                                                          //               .data[k]
                                                          //               .data[l]
                                                          //               .materi,
                                                          //           style: TextStyle(
                                                          //               fontWeight:
                                                          //                   FontWeight
                                                          //                       .w300,
                                                          //               color: DataColors
                                                          //                   .Neutral300),
                                                          //         ),
                                                          //       ],
                                                          //     ),
                                                          //   ),
                                                          // );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              }),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            }),
                      ],
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
                              image:
                                  AssetImage("assets/images/datatidakada.png"),
                              height: 100.sp,
                            ),
                            Text(
                              "Tidak Ada Jadwal Saat Ini",
                              style: TextStyle(color: DataColors.Neutral300),
                            ),
                          ],
                        )),
                  );
                }
            }
          }),
    );
  }
}

class Jadwal extends StatelessWidget {
  final String matkul;
  final String codeMk;
  final String materi;
  final String ruangan;
  final DateTime tanggal;
  final String jam;
  final String jenisJadwal;
  final String dosen;
  const Jadwal({
    Key? key,
    required this.matkul,
    required this.codeMk,
    required this.materi,
    required this.ruangan,
    required this.tanggal,
    required this.jam,
    required this.jenisJadwal,
    required this.dosen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Container(
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
            color: DataColors.primary100,
            borderRadius: BorderRadius.circular(8.sp)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 10,
                child: SizedBox(
                  child: Text(
                    matkul,
                    overflow: TextOverflow.ellipsis,
                    style: (TextStyle(
                        fontSize: 11.sp,
                        color: DataColors.primary,
                        fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 3,
                child: Container(
                    padding: EdgeInsets.all(2.sp),
                    decoration: BoxDecoration(
                        color: (jenisJadwal != "1")
                            ? HexColor("#B57903")
                            : HexColor("#007582"),
                        borderRadius: BorderRadius.circular(4.sp)),
                    child: Text((jenisJadwal != "1") ? "Offline" : "Online",
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: DataColors.primary100,
                            fontWeight: FontWeight.w600))),
              )
            ],
          ),
          SizedBox(
            height: 5.sp,
          ),
          Container(
              padding: EdgeInsets.all(4.sp),
              decoration: BoxDecoration(
                  color: DataColors.primary400,
                  borderRadius: BorderRadius.circular(4.sp)),
              child: Text(
                  DateFormat("EEEE, d MMMM yyyy", "id_ID").format(tanggal),
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: DataColors.primary100,
                      fontWeight: FontWeight.w600))),
          SizedBox(
            height: 2.sp,
          ),
          Row(
            children: [
              Text(jam,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: DataColors.primary700,
                      fontWeight: FontWeight.w500)),
              Text(" | "),
              Row(
                children: [
                  Icon(
                    Icons.room,
                    color: DataColors.primary,
                    size: 12.sp,
                  ),
                  Text(ruangan,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: HexColor("#007582"),
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 2.sp,
          ),
          Text(codeMk,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 12.sp,
                  color: DataColors.primary400,
                  fontWeight: FontWeight.w500)),
          SizedBox(
            height: 2.sp,
          ),
          Text(dosen,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 12.sp,
                  color: DataColors.primary600,
                  fontWeight: FontWeight.w600)),
          SizedBox(
            height: 2.sp,
          ),
          Text("Materi : " + materi,
              style: TextStyle(
                  fontSize: 12.sp,
                  color: DataColors.primary700,
                  fontWeight: FontWeight.w500)),
        ]),
      ),
    );
  }
}
