import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/yudisium_c.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import '../../../theme/color.dart';

class YudisumPage extends StatelessWidget {
  final box = GetStorage();
  YudisiumController controller = Get.put(YudisiumController());
  @override
  Widget build(BuildContext context) {
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Yudisium',
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
          future: controller.cekyudis(data["nim"]),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasData) {
                  return (snapshot.data.status == "0")
                      ? Center(
                          child: Text(
                          "Pengajuan Yudisium Sedang Diproses",
                          style: TextStyle(
                              color: DataColors.primary700,
                              fontWeight: FontWeight.w600),
                        ))
                      : (snapshot.data.status == "2")
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Mahasiswa Dapat Mengajukan Yudisium",
                                    style: TextStyle(
                                        color: DataColors.primary700,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 20.sp,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Get.defaultDialog(
                                            onConfirm: () => controller
                                                .ajukanyudis(data["nim"]),
                                            onCancel: () =>
                                                Navigator.pop(context),
                                            middleText:
                                                "Anda yakin ingin mengajukan yudisium?");
                                      },
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.sp,
                                              horizontal: 30.sp),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.sp),
                                              border: Border.all(
                                                  color: DataColors.primary,
                                                  width: 1.sp)),
                                          child: Text(
                                            "Pengajuan Yudisium",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: DataColors.primary),
                                          )))
                                ],
                              ),
                            )
                          : (snapshot.data.status == "3")
                              ? Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Center(
                                    child: Text(
                                      "Mahasiswa belum memenuhi SKS, pengajuan belum bisa dilakukan",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: DataColors.primary700,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              : SingleChildScrollView(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2.h, horizontal: 5.w),
                                  child: Container(
                                    padding: EdgeInsets.all(10.sp),
                                    decoration: BoxDecoration(
                                        color: DataColors.primary100,
                                        borderRadius:
                                            BorderRadius.circular(12.sp),
                                        border: Border.all(
                                            color: DataColors.primary700)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                            child: Text(
                                          "Data Yudisium",
                                          style: TextStyle(
                                              fontSize: 13.sp,
                                              color: DataColors.primary600,
                                              fontWeight: FontWeight.w600),
                                        )),
                                        Text(
                                          "Nim",
                                          style: header(),
                                        ),
                                        SizedBox(
                                          height: 5.sp,
                                        ),
                                        Containerprofile(
                                            snapshot.data.yudisium[0].nim),
                                        SizedBox(
                                          height: 20.sp,
                                        ),
                                        Text(
                                          "Nama",
                                          style: header(),
                                        ),
                                        SizedBox(
                                          height: 5.sp,
                                        ),
                                        Containerprofile(
                                            snapshot.data.yudisium[0].namaMhs),
                                        SizedBox(
                                          height: 20.sp,
                                        ),
                                        Text(
                                          "Fakultas",
                                          style: header(),
                                        ),
                                        SizedBox(
                                          height: 5.sp,
                                        ),
                                        Containerprofile(
                                            snapshot.data.yudisium[0].fakultas),
                                        SizedBox(
                                          height: 20.sp,
                                        ),
                                        Text(
                                          "Program Studi",
                                          style: header(),
                                        ),
                                        SizedBox(
                                          height: 5.sp,
                                        ),
                                        Containerprofile(
                                            snapshot.data.yudisium[0].prodi),
                                        SizedBox(
                                          height: 20.sp,
                                        ),
                                        Text(
                                          "No SK",
                                          style: header(),
                                        ),
                                        SizedBox(
                                          height: 5.sp,
                                        ),
                                        Containerprofile(
                                            snapshot.data.yudisium[0].noSk),
                                        SizedBox(
                                          height: 20.sp,
                                        ),
                                        Text(
                                          "No Ijazah",
                                          style: header(),
                                        ),
                                        SizedBox(
                                          height: 5.sp,
                                        ),
                                        Containerprofile(
                                            snapshot.data.yudisium[0].noIjazah),
                                        SizedBox(
                                          height: 20.sp,
                                        ),
                                        Text(
                                          "No Transkip",
                                          style: header(),
                                        ),
                                        SizedBox(
                                          height: 5.sp,
                                        ),
                                        Containerprofile(snapshot
                                            .data.yudisium[0].noTranskip),
                                        SizedBox(
                                          height: 20.sp,
                                        ),
                                        Text(
                                          "Judul Skripsi",
                                          style: header(),
                                        ),
                                        SizedBox(
                                          height: 5.sp,
                                        ),
                                        Containerprofile(snapshot
                                            .data.yudisium[0].judulSkripsi),
                                        SizedBox(
                                          height: 20.sp,
                                        ),
                                        Text(
                                          "Tanggal SK",
                                          style: header(),
                                        ),
                                        SizedBox(
                                          height: 5.sp,
                                        ),
                                        Containerprofile(
                                            DateFormat('dd-MM-yyyy').format(
                                                snapshot
                                                    .data.yudisium[0].tglSk)),
                                        SizedBox(
                                          height: 20.sp,
                                        ),
                                        Text(
                                          "Tanggal Yudisium",
                                          style: header(),
                                        ),
                                        SizedBox(
                                          height: 5.sp,
                                        ),
                                        Containerprofile(
                                            DateFormat('dd-MM-yyyy').format(
                                                snapshot.data.yudisium[0]
                                                    .dateYudisium)),
                                        SizedBox(
                                          height: 20.sp,
                                        ),
                                      ],
                                    ),
                                  ));
                } else {
                  return Container();
                }
            }
          }),
    );
  }

  Container Containerprofile(String content) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
        width: 90.w,
        decoration: BoxDecoration(
            color: DataColors.primary200,
            borderRadius: BorderRadius.circular(8.sp)),
        child: Text(
          content,
          style: TextStyle(fontSize: 11.sp, color: DataColors.primary600),
        ));
  }

  TextStyle header() =>
      TextStyle(color: DataColors.primary700, fontSize: 12.sp);
}
