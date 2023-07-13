import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/ui/pages/monitoring/absensikuliah.dart';
import 'package:gostradav1/app/ui/pages/monitoring/lihatjadwal.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:html/parser.dart';
import '../../../controllers/monitoringC.dart';
import '../../theme/color.dart';
import 'package:intl/intl.dart';

class MonitoringPage extends StatelessWidget {
  MonitoringController controller = Get.put(MonitoringController());
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: DataColors.primary700,
          elevation: 0,
        ),
        body: FutureBuilder<dynamic>(
            future: controller.GetJadwalAbsensi(data["nim"]),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Jadwal perkuliahan",
                                  style: TextStyle(
                                      color: DataColors.primary800,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.sp),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(JadwalKuliahPage());
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 4.sp, vertical: 2.sp),
                                    decoration: BoxDecoration(
                                        color: DataColors.primary,
                                        borderRadius:
                                            BorderRadius.circular(4.sp)),
                                    child: Text("Lihat Jadwal",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 9.sp)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.sp,
                            ),
                            SizedBox(
                              height: 150.sp,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data.jadwalKuliah.total,
                                itemBuilder: (BuildContext context, int index) {
                                  return JadwalHariIni(
                                    matkul: snapshot
                                        .data.jadwalKuliah.data[index].matkul,
                                    codeMk: snapshot
                                        .data.jadwalKuliah.data[index].codeMk,
                                    materi: snapshot
                                        .data.jadwalKuliah.data[index].materi,
                                    ruangan: snapshot
                                        .data.jadwalKuliah.data[index].ruangan,
                                    tanggal: snapshot
                                        .data.jadwalKuliah.data[index].tanggal,
                                    jam: snapshot
                                        .data.jadwalKuliah.data[index].jam,
                                    jenisJadwal: snapshot.data.jadwalKuliah
                                        .data[index].jenisJadwal,
                                    dosen: snapshot
                                        .data.jadwalKuliah.data[index].dosen,
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20.sp,
                            ),
                            SizedBox(
                              height: 20.sp,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Absensi Perkuliahan",
                                    style: TextStyle(
                                        color: DataColors.primary800,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13.sp),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(AbsensiKuliahPage());
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(4.sp),
                                      decoration: BoxDecoration(
                                          color: DataColors.primary,
                                          borderRadius:
                                              BorderRadius.circular(5.sp)),
                                      child: Text(
                                        "Riwayat Kehadiran",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 9.sp),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data.absensi.total,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.sp, vertical: 12.sp),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.sp),
                                          border: Border.all(
                                              color: DataColors.primary200)),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data.absensi.data[index]
                                                  .matkul,
                                              style: TextStyle(
                                                  color: DataColors.primary800,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 10.sp),
                                            ),
                                            SizedBox(
                                              height: 10.sp,
                                            ),
                                            Text(
                                              "${DateFormat('EEEE, d MMM yyyy', "id_ID").format(snapshot.data.absensi.data[index].date)} \n ${snapshot.data.absensi.data[index].jam}",
                                              style: TextStyle(
                                                  color: DataColors.Neutral400,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 10.sp),
                                            ),
                                          ]),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ]),
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
                                image: AssetImage(
                                    "assets/images/datatidakada.png"),
                                height: 100.sp,
                              ),
                              Text(
                                "Tidak Ada Monitoring Saat Ini",
                                style: TextStyle(color: DataColors.Neutral300),
                              ),
                            ],
                          )),
                    );
                  }
              }
            }));
  }
}

class JadwalHariIni extends StatelessWidget {
  final String matkul;
  final String codeMk;
  final String materi;
  final String ruangan;
  final DateTime tanggal;
  final String jam;
  final String jenisJadwal;
  final String dosen;
  const JadwalHariIni({
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
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
            color: DataColors.primary100,
            borderRadius: BorderRadius.circular(8.sp)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              SizedBox(
                width: 200.sp,
                child: Text(
                  matkul,
                  overflow: TextOverflow.ellipsis,
                  style: (TextStyle(
                      fontSize: 11.sp,
                      color: DataColors.primary,
                      fontWeight: FontWeight.w600)),
                ),
              ),
              Text(
                (jenisJadwal == "1") ? "Online" : "Offline",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 10.sp,
                    color: HexColor("#B57903")),
              )
            ],
          ),
          SizedBox(
            height: 2.sp,
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
              Text(ruangan,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor("#007582"),
                      fontWeight: FontWeight.w500)),
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
        ]),
      ),
    );
  }
}

//here goes the function
