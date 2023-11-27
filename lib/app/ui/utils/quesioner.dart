import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/quesioner_c.dart';
import 'package:sizer/sizer.dart';
import '../theme/color.dart';
import 'package:collection/collection.dart';

class QuisionerPage extends StatefulWidget {
  @override
  State<QuisionerPage> createState() => _MyPageState();
}

class _MyPageState extends State<QuisionerPage> {
  final box = GetStorage();
  var datakhs = Get.arguments;
  QuesionerController controller = Get.put(QuesionerController());
  List<String> test = ["testa", "testb", "testc", "testd"];
  List<String> value = ["a", "b", "c", "d", "e"];
  int groupValue = -1;
  @override
  Widget build(BuildContext context) {
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Quesioner'),
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
      ),
      body: FutureBuilder<dynamic>(
          future: controller.quesioner(data["nim"], datakhs[1], datakhs[0]),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 7.5.w, vertical: 2.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.separated(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: controller.soal.length,
                          separatorBuilder: (BuildContext context, int i) {
                            return Container(
                              height: 0.5.sp,
                              color: DataColors.Neutral400,
                            );
                          },
                          itemBuilder: (BuildContext context, int j) {
                            List<String> jawaban = [];
                            List<String> bobot = [];
                            jawaban.add(
                                snapshot.data.quisoner![0].data![j].jawaban1);
                            jawaban.add(
                                snapshot.data.quisoner![0].data![j].jawaban2);
                            jawaban.add(
                                snapshot.data.quisoner![0].data![j].jawaban3);
                            jawaban.add(
                                snapshot.data.quisoner![0].data![j].jawaban4);
                            jawaban.add(
                                snapshot.data.quisoner![0].data![j].jawaban5);
                            bobot.add(
                                snapshot.data.quisoner![0].data![j].bobot1);
                            bobot.add(
                                snapshot.data.quisoner![0].data![j].bobot2);
                            bobot.add(
                                snapshot.data.quisoner![0].data![j].bobot3);
                            bobot.add(
                                snapshot.data.quisoner![0].data![j].bobot4);
                            bobot.add(
                                snapshot.data.quisoner![0].data![j].bobot5);

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "${j + 1}. " +
                                        snapshot.data.quisoner![0].data![j]
                                            .pertanyaan,
                                    style: TextStyle(
                                        color: DataColors.primary700,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp),
                                  ),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  itemCount: 5,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListTile(
                                      title: Text(
                                        jawaban[index],
                                        style: TextStyle(
                                            color: DataColors.primary),
                                      ),
                                      leading: Obx(() => Radio(
                                            value: jawaban[index],
                                            groupValue: controller.soal[j],
                                            onChanged: (Object? value) {
                                              controller.input(
                                                  value, j, bobot, index);
                                            },
                                          )),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                        Center(
                          child: Container(
                            width: 90.w,
                            margin: const EdgeInsets.only(bottom: 20, top: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                Get.defaultDialog(
                                    onConfirm: () =>
                                        controller.inputjawabanmaster(
                                            data["nim"],
                                            snapshot.data.idPeriode,
                                            snapshot.data.quisoner[0].idDosen,
                                            snapshot.data.quisoner[0].codeMk,
                                            (controller.totalbobot.sum)
                                                .toString(),
                                            snapshot.data.idQuiz,
                                            snapshot.data.idKhs,
                                            snapshot.data.idProdi),
                                    middleText: "Konfirmasi Jawaban?");
                              },
                              style: ElevatedButton.styleFrom(
                                side: BorderSide(
                                  width: 2.0,
                                  color: DataColors.primary,
                                ),
                                primary: DataColors.primary, // background
                                onPrimary: Colors.white, // foreground
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14.0),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.sp, horizontal: 10.sp),
                              ),
                              child: const Text(
                                'Submit',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
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
                              "Tidak Ada Quesioner Saat Ini",
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
