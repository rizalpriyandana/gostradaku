import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/krs/krs_c.dart';
import 'package:gostradav1/app/controllers/transkrip/transkrip_c.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class TranskripPage extends StatelessWidget {
  final x = Get.put(TranskripController());
  KrsController controller = Get.put(KrsController());
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    Map data = box.read("dataUser") as Map<String, dynamic>;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Transkrip Nilai',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: DataColors.primary700,
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
          future: controller.transkipnilai(data["nim"]),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Expanded(
                        flex: 8,
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                              vertical: 1.h, horizontal: 5.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          snapshot.data.totalBobot.toString(),
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w700,
                                            color: DataColors.primary700,
                                          ),
                                        ),
                                        ConstrainedBox(
                                          constraints: BoxConstraints(
                                            maxWidth: 100.w / 4,
                                          ),
                                          child: AutoSizeText(
                                            'Total SKS yang diambil',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w700,
                                              color: HexColor('#7D98CE'),
                                            ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            snapshot.data.ipk,
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w700,
                                              color: DataColors.primary700,
                                            ),
                                          ),
                                          ConstrainedBox(
                                            constraints: BoxConstraints(
                                              maxWidth: 100.w / 4,
                                            ),
                                            child: AutoSizeText(
                                              'Indeks Prestasi Kumulaitif (IPK)',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.w700,
                                                color: HexColor('#7D98CE'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      color: Colors.black26,
                                      height: 80,
                                      width: 1,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 26.w,
                                          child: AutoSizeText(
                                            snapshot.data.prestasi,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w700,
                                              color: DataColors.primary700,
                                            ),
                                          ),
                                        ),
                                        ConstrainedBox(
                                          constraints: BoxConstraints(
                                            maxWidth: 100.w / 4,
                                          ),
                                          child: AutoSizeText(
                                            'Prestasi',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w700,
                                              color: HexColor('#7D98CE'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              ListView.builder(
                                primary: false,
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(8),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    width: size.width,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ListView.builder(
                                            primary: false,
                                            shrinkWrap: true,
                                            padding: const EdgeInsets.all(8),
                                            itemCount:
                                                snapshot.data.data.length,
                                            itemBuilder:
                                                (BuildContext context, int i) {
                                              return Container(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        ConstrainedBox(
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth:
                                                                size.width / 2,
                                                          ),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              AutoSizeText(
                                                                snapshot
                                                                    .data
                                                                    .data[i]
                                                                    .name,
                                                                // x.transkripNilai[index]['name'],
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: DataColors
                                                                      .primary700,
                                                                ),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  AutoSizeText(
                                                                    "Kode Mk " +
                                                                        snapshot
                                                                            .data
                                                                            .data[i]
                                                                            .codeMk,
                                                                    // x.transkripNilai[index]['name'],
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: DataColors
                                                                          .primary600,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        10.sp,
                                                                  ),
                                                                  AutoSizeText(
                                                                    snapshot
                                                                            .data
                                                                            .data[i]
                                                                            .bobot +
                                                                        " SKS ",
                                                                    // x.transkripNilai[index]['name'],
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: DataColors
                                                                          .primary600,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      // padding: EdgeInsets.all(5),
                                                      height: 35,
                                                      width: 35,
                                                      decoration: BoxDecoration(
                                                          color: DataColors
                                                              .primary700,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          (snapshot.data.data[i]
                                                                      .nilaiHuruf ==
                                                                  "")
                                                              ? "-"
                                                              : snapshot
                                                                  .data
                                                                  .data[i]
                                                                  .nilaiHuruf,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              );
                                            }),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20.sp),
                          width: 80.w,
                          child: ElevatedButton(
                            onPressed: () async {
                              ProgressDialog pd =
                                  ProgressDialog(context: context);
                              final directory = await getTemporaryDirectory();
                              controller.downloadtranskip(Dio(), data["nim"],
                                  directory.path + "_Transkip.pdf", pd);
                            },
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(
                                width: 2.0,
                                color: DataColors.primary,
                              ),
                              primary: Colors.white, // background
                              onPrimary: DataColors.primary700, // foreground
                              shape: RoundedRectangleBorder(
                                // ignore: unnecessary_new
                                borderRadius: new BorderRadius.circular(14.0),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                            ),
                            child: const Text(
                              'Unduh Transkrip',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                          // ),
                        ),
                      ),
                    ],
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
                              "Tidak Ada Transkip Saat Ini",
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
