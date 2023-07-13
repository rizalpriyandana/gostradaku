import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/request_surat_c.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:intl/intl.dart';

class DataRequestPage extends StatelessWidget {
  List<TextEditingController> controllers = [];
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    Map data = box.read("dataUser") as Map<String, dynamic>;
    RequestSuratController controller = Get.put(RequestSuratController());
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 7.5.w, vertical: 5.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Perihal",
              style: TextStyle(
                  color: DataColors.primary800, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5.sp,
            ),
            InkWell(
              onTap: () {
                showMaterialModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return FutureBuilder<dynamic>(
                        future: controller.getSurat(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return const Center(
                                  child: CircularProgressIndicator());
                            default:
                              if (snapshot.hasData) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30.sp),
                                          topRight: Radius.circular(30.sp))),
                                  child: SingleChildScrollView(
                                    controller:
                                        ModalScrollController.of(context),
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 10.sp),
                                          color: HexColor("#E8E8E8"),
                                          height: 3.sp,
                                          width: 10.w,
                                        ),
                                        ListView.separated(
                                          shrinkWrap: true,
                                          physics: ScrollPhysics(),
                                          itemCount: snapshot.data.total,
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return Container(
                                              color: DataColors.Neutral200,
                                              height: 0.5.sp,
                                            );
                                          },
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return InkWell(
                                              onTap: () {
                                                controller.txt.value = snapshot
                                                    .data
                                                    .data[index]
                                                    .jenisSurat;
                                                Navigator.pop(context);
                                                controller.idJenisSurat.value =
                                                    snapshot.data.data[index]
                                                        .idJenisSurat;
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 7.5.w,
                                                    vertical: 2.h),
                                                child: Text(
                                                  snapshot.data.data[index]
                                                      .jenisSurat,
                                                  style: TextStyle(
                                                      color:
                                                          DataColors.primary800,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return Text("Data Kosong");
                              }
                          }
                        });
                  },
                );
              },
              child: Container(
                padding:
                    EdgeInsets.symmetric(vertical: 6.sp, horizontal: 10.sp),
                decoration: ShapeDecoration(
                    shape: StadiumBorder(), color: HexColor("#F3F3F3")),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() => SizedBox(
                          width: 70.w,
                          child: Text(
                            controller.txt.value,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: HexColor("#757575")),
                          ),
                        )),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Obx(() => FutureBuilder<dynamic>(
                future: controller
                    .generateinputsurat(controller.idJenisSurat.value),
                builder: (context, snapshot) {
                  controllers.clear();
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const Center(child: CircularProgressIndicator());
                    default:
                      if (snapshot.hasData) {
                        for (var i = 0; i < snapshot.data.total; i++) {
                          controllers.add(TextEditingController());
                        }
                        return Column(
                          children: [
                            ListView.separated(
                              itemCount: snapshot.data.total,
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(height: 10.sp);
                              },
                              itemBuilder: (BuildContext context, int index) {
                                String? sentence = toBeginningOfSentenceCase(
                                    snapshot.data.data[index].key);

                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      sentence!,
                                      style: TextStyle(
                                          color: DataColors.primary800,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 5.sp,
                                    ),
                                    TextFormField(
                                      autocorrect: false,
                                      controller: controllers[index],
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10.0.sp),
                                        isDense: true,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: DataColors.primary,
                                              width: 1.0),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            SizedBox(
                              height: 30.sp,
                            ),
                            Center(
                              child: Container(
                                width: 90.w,
                                margin:
                                    const EdgeInsets.only(bottom: 20, top: 20),
                                child: ElevatedButton(
                                  onPressed: () {
                                    print("ini total nya" +
                                        snapshot.data.total.toString());
                                    print("Ini Jumlah Controller" +
                                        controllers.length.toString());
                                    Map<String, String> map = {};
                                    map["id_jenis_surat"] =
                                        controller.idJenisSurat.value;
                                    map["nim"] = data['nim'];

                                    for (var i = 0;
                                        i < snapshot.data.data.length;
                                        i++) {
                                      map[snapshot.data.data[i].key] =
                                          controllers[i].text;
                                    }
                                    controller.sendsurat(map);
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
                                    'Ajukan',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Container();
                      }
                  }
                })),
          ],
        ),
      ),
    );
  }
}
