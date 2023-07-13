// ignore_for_file: depend_on_referenced_packages

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:gostradav1/app/controllers/krs/krs_c.dart';

import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:gostradav1/app/ui/utils/quesioner.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class DetailKhsPage extends StatelessWidget {
  KrsController controller = Get.put(KrsController());

  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    var i = Get.arguments;

    final Size size = MediaQuery.of(context).size;
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
        titleSpacing: 0,
        title: Text(
          'Detail KHS',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: DataColors.primary700,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: FutureBuilder<dynamic>(
          future: controller.detailkhs(data["nim"], i.toString()),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasData) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Semester $i",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: DataColors.primary700,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            width: size.width,
                            decoration: BoxDecoration(
                              color: DataColors.blusky,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: const Offset(
                                      0, 2), // changes position of shadow
                                )
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      (snapshot.data.ip == null)
                                          ? "0"
                                          : snapshot.data.ip,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: DataColors.primary700,
                                      ),
                                    ),
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth: size.width / 4,
                                      ),
                                      child: AutoSizeText(
                                        'Indeks Prestasi Semester',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700,
                                          color: HexColor('#7D98CE'),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "IPS",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: HexColor('#7D98CE'),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  color: Colors.black26,
                                  height: 80,
                                  width: 1,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      (snapshot.data.ipk == null)
                                          ? "0"
                                          : snapshot.data.ipk,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: DataColors.primary700,
                                      ),
                                    ),
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth: size.width / 4,
                                      ),
                                      child: AutoSizeText(
                                        'Indeks Prestasi Kumulatif',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700,
                                          color: HexColor('#7D98CE'),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '(IPK)',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: HexColor('#7D98CE'),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  color: Colors.black26,
                                  height: 80,
                                  width: 1,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 6),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        (snapshot.data.totalSks).toString(),
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          color: DataColors.primary700,
                                        ),
                                      ),
                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxWidth: size.width / 4,
                                        ),
                                        child: AutoSizeText(
                                          'Jumlah SKS Semester Ini',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            color: HexColor('#7D98CE'),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Daftar KHS',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: DataColors.primary700,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ListView.separated(
                            primary: false,
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(8),
                            itemCount: snapshot.data.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  if (snapshot.data.data[index].statusQuiz ==
                                      "0") {
                                    Get.to(QuisionerPage(), arguments: [
                                      snapshot.data.data[index].codeMk,
                                      i
                                    ]);
                                  }
                                },
                                child: Container(
                                  width: size.width,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ConstrainedBox(
                                            constraints: BoxConstraints(
                                              maxWidth: size.width / 2,
                                            ),
                                            child: AutoSizeText(
                                              snapshot.data.data[index].name,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: DataColors.primary700,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${snapshot.data.data[index].bobot} SKS",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                  color: DataColors.primary,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "Kode: ${snapshot.data.data[index].codeMk}",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                  color: DataColors.primary,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.sp,
                                              ),
                                              (snapshot.data.data![index]
                                                          .statusQuiz ==
                                                      "0")
                                                  ? Text(
                                                      "Belum Evaluasi",
                                                      style: TextStyle(
                                                          fontSize: 10.sp,
                                                          color: Colors.orange),
                                                    )
                                                  : Text(
                                                      "Sudah Evaluasi",
                                                      style: TextStyle(
                                                          fontSize: 10.sp,
                                                          color: Colors.green),
                                                    )
                                            ],
                                          )
                                        ],
                                      ),
                                      Container(
                                        // padding: EdgeInsets.all(5),
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                            color: DataColors.primary700,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            (snapshot.data.data[index].nilai ==
                                                    "")
                                                ? "-"
                                                : snapshot
                                                    .data.data[index].nilai,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
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
                              "Tidak Ada KHS Saat Ini",
                              style: TextStyle(color: DataColors.Neutral300),
                            ),
                          ],
                        )),
                  );
                }
            }
          }),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        margin: const EdgeInsets.only(bottom: 20),
        child: ElevatedButton(
          onPressed: () async {
            ProgressDialog pd = ProgressDialog(context: context);
            final directory = await getTemporaryDirectory();
            controller.downloadkhs(
                Dio(), data["nim"], i, directory.path + "_KHS.pdf", pd);
            pd.show(max: 100, msg: 'File Downloading...');
          },
          style: ElevatedButton.styleFrom(
            side: BorderSide(
              width: 2.0,
              color: DataColors.primary,
            ),
            primary: Colors.white, // background
            onPrimary: DataColors.primary700, // foreground
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(14.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
          ),
          child: const Text(
            'Unduh KHS',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
