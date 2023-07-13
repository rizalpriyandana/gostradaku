// ignore_for_file: unnecessary_new

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/penawaran_c.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:sizer/sizer.dart';

class PenawaranKrsPage extends StatelessWidget {
  @override
  final box = GetStorage();

  PenawaranKrsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController txt = TextEditingController();
    Map data = box.read("dataUser") as Map<String, dynamic>;
    String? semester;
    PenawaramKRSController controller = Get.put(PenawaramKRSController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Penawaran KRS',
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
          future: controller.getmhs(data["nim"]),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasData) {
                  semester = snapshot.data.semester;
                  return FutureBuilder<dynamic>(
                      future: controller.getsks(
                          data["nim"], snapshot.data.semester),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return const Center(
                                child: CircularProgressIndicator());
                          default:
                            if (snapshot.hasData) {
                              return Stack(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20, horizontal: 20),
                                            height: 100,
                                            width: 100.w,
                                            decoration: BoxDecoration(
                                              color: DataColors.blusky,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  spreadRadius: 2,
                                                  blurRadius: 2,
                                                  offset: const Offset(0,
                                                      2), // changes position of shadow
                                                )
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ConstrainedBox(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 50.w,
                                                  ),
                                                  child: AutoSizeText(
                                                    "Total SKS yang diambil",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color:
                                                          DataColors.primary700,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "${snapshot.data.totalSks} SKS",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color:
                                                        DataColors.primary700,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 40,
                                          ),
                                          Text(
                                            'Daftar Penawaran KRS',
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
                                            itemCount:
                                                snapshot.data.data.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Container(
                                                width: 100.w,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
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
                                                        ConstrainedBox(
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 50.w,
                                                          ),
                                                          child: AutoSizeText(
                                                            snapshot
                                                                .data
                                                                .data[index]
                                                                .name,
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: DataColors
                                                                  .primary700,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              snapshot
                                                                      .data
                                                                      .data[
                                                                          index]
                                                                      .bobot +
                                                                  " SKS",
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: DataColors
                                                                    .primary,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              snapshot
                                                                  .data
                                                                  .data[index]
                                                                  .codeMk,
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: DataColors
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text(
                                                          'Kelas',
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: DataColors
                                                                .primary700,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
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
                                                          child: const Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              "",
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                            separatorBuilder:
                                                (BuildContext context,
                                                        int index) =>
                                                    const Divider(
                                              thickness: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 20),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (semester == null) {
                                                Get.snackbar(
                                                    'Hi', 'Semester Tidak Ada');
                                              } else {
                                                Get.defaultDialog(
                                                    title: '',
                                                    content: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        TextField(
                                                          controller: txt,
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          maxLines: 1,
                                                          decoration: InputDecoration(
                                                              labelText:
                                                                  'Alasan Penolakan',
                                                              hintMaxLines: 1,
                                                              border: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .green,
                                                                      width:
                                                                          4.0))),
                                                        ),
                                                        SizedBox(
                                                          height: 30.0,
                                                        ),
                                                        InkWell(
                                                            onTap: () {
                                                              controller.Submit(
                                                                  data["nim"],
                                                                  semester!,
                                                                  "no",
                                                                  txt.text);
                                                            },
                                                            child: Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(10
                                                                            .sp),
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .red,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.sp)),
                                                                child: Text(
                                                                  "Tolak Penawaran",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                )))
                                                      ],
                                                    ),
                                                    radius: 10.0);
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              side: const BorderSide(
                                                width: 2.0,
                                                color: Colors.red,
                                              ),
                                              primary:
                                                  Colors.white, // background
                                              onPrimary:
                                                  Colors.red, // foreground
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        14.0),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 10),
                                            ),
                                            child: const Text(
                                              'Tolak Tawaran',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 20),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (semester == null) {
                                                Get.snackbar(
                                                    'Hi', 'Semester Tidak Ada');
                                              } else {
                                                Get.defaultDialog(
                                                    onConfirm: () =>
                                                        controller.Submit(
                                                            data["nim"],
                                                            semester!,
                                                            "yes",
                                                            ""),
                                                    middleText:
                                                        "Apakah Kamu Yakin?");
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              side: BorderSide(
                                                width: 2.0,
                                                color: Colors.green,
                                              ),
                                              primary:
                                                  Colors.white, // background
                                              onPrimary: DataColors
                                                  .primary700, // foreground
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        14.0),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 10),
                                            ),
                                            child: const Text(
                                              'Terima Penawaran',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.green),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return const Text(" loading");
                            }
                        }
                      });
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
                              "Tidak Ada Penawaran KRS Saat Ini",
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
