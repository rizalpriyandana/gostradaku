import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:gostradav1/app/controllers/krs/krs_c.dart';
import 'package:gostradav1/app/routes/rout_name.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

class KhsPage extends StatelessWidget {
  KrsController controller = Get.put(KrsController());
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
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
          'Data KHS',
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
          future: controller.masterkhs(data["nim"]),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasData) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: GetBuilder<KrsController>(
                        builder: (cont) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'KHS Terakhir',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: DataColors.primary700,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),

                              // box info khs terakhir

                              InkWell(
                                onTap: () {
                                  Get.toNamed(RoutName.detailkhs,
                                      arguments: snapshot.data.activeSemester);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  height: 143,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                    color: DataColors.blusky,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.15),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: 20,
                                        child: Opacity(
                                          opacity: 0.5,
                                          child: SvgPicture.asset(
                                            'assets/images/khs/khs.svg',
                                            height: 140,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 40),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  snapshot.data.activePeriode,
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        DataColors.primary700,
                                                  ),
                                                ),
                                                Text(
                                                  (int.parse(snapshot.data
                                                                  .activeSemester!) %
                                                              2 ==
                                                          0)
                                                      ? "Genap"
                                                      : "Gasal",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        DataColors.primary700,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  ("(Semester " +
                                                      snapshot
                                                          .data.activeSemester +
                                                      ")"),
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: HexColor('#3C5595'),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '${snapshot.data.ipActive}/4.00',
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        DataColors.primary700,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'INDEKS PRESTASI SEMESTER',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: DataColors.skyBlue,
                                                      letterSpacing: 1.0),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              // end box info khs Aktif

                              const SizedBox(
                                height: 30,
                              ),

                              //detail periode dan semester
                              Text(
                                'Periode dan semester',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: DataColors.primary700,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),

                              ListView.builder(
                                primary: false,
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(8),
                                itemCount: snapshot.data.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      // cont.semester = c.dataMasterKhs
                                      //     .semester['data'][index]['semester'];
                                      // cont.nim = c.dataMasterKhs.nim;
                                      Get.toNamed(RoutName.detailkhs,
                                          arguments: snapshot
                                              .data.data[index].semester);
                                    },
                                    child: Container(
                                      height: 120,
                                      width: size.width,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 15),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            spreadRadius: 2,
                                            blurRadius: 2,
                                            offset: const Offset(0,
                                                2), // changes position of shadow
                                          )
                                        ],
                                      ),
                                      child: Stack(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    snapshot.data.data[index]
                                                        .periode,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          DataColors.primary700,
                                                    ),
                                                  ),
                                                  Text(
                                                    (int.parse(snapshot
                                                                    .data
                                                                    .data[index]
                                                                    .semester!) %
                                                                2 ==
                                                            0)
                                                        ? "Genap"
                                                        : "Gasal",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          DataColors.primary700,
                                                    ),
                                                  ),
                                                  Text(
                                                    "(Semester  " +
                                                        snapshot
                                                            .data
                                                            .data[index]
                                                            .semester +
                                                        ")",
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color:
                                                          HexColor('#3C5595'),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    '${snapshot.data.data[index].ip}/4.00',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          DataColors.primary700,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'INDEKS PRESTASI SEMESTER',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            DataColors.skyBlue,
                                                        letterSpacing: 1.0),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          const Align(
                                            alignment: Alignment.bottomRight,
                                            child: Icon(
                                              Icons.arrow_forward_ios_sharp,
                                              size: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
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
    );
  }
}
