import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sizer/sizer.dart';

import '../../../../controllers/pengajuan_skripsi_c.dart';
import '../../../theme/color.dart';

class ListDospemPage extends StatelessWidget {
  SkripsiController controller = Get.put(SkripsiController());
  TextEditingController searchC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<dynamic>(
          future: controller.getdosenskripsi(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasData) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.sp),
                            topRight: Radius.circular(30.sp))),
                    child: Column(
                      children: [
                        Container(
                          height: 4.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 7.5.w, vertical: 8.sp),
                          child: Container(
                            decoration: BoxDecoration(
                                color: HexColor("#F6FAFF"),
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: TextField(
                                controller: searchC,
                                onChanged: (text) {
                                  controller.search(text);
                                  controller.usingsearch.value = true;
                                  if (text == "") {
                                    controller.usingsearch.value = false;
                                  }
                                  controller.up();
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Search...",
                                    hintStyle:
                                        TextStyle(color: DataColors.primary400),
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Iconify(
                                        Carbon.search,
                                        color: DataColors.primary,
                                        size: 10.sp,
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () => Expanded(
                            child: SingleChildScrollView(
                              controller: ModalScrollController.of(context),
                              child: Column(
                                children: [
                                  (controller.usingsearch == true)
                                      ? GetBuilder<SkripsiController>(
                                          initState: (_) {},
                                          builder: (_) {
                                            return FutureBuilder<dynamic>(
                                                future: controller
                                                    .search(searchC.text),
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasData) {
                                                    return ListView.separated(
                                                      shrinkWrap: true,
                                                      physics: ScrollPhysics(),
                                                      itemCount:
                                                          snapshot.data.total,
                                                      separatorBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return Container(
                                                          color: DataColors
                                                              .Neutral200,
                                                          height: 0.5.sp,
                                                        );
                                                      },
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return InkWell(
                                                          onTap: () {
                                                            controller.pilih
                                                                    .value =
                                                                snapshot
                                                                    .data
                                                                    .data[index]
                                                                    .dosen;
                                                            Navigator.pop(
                                                                context);
                                                            controller.id_dosen
                                                                    .value =
                                                                snapshot
                                                                    .data
                                                                    .data[index]
                                                                    .idDosen;
                                                            print(controller
                                                                .id_dosen
                                                                .value);
                                                          },
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        7.5.w,
                                                                    vertical:
                                                                        2.h),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  flex: 10,
                                                                  child: Text(
                                                                    snapshot
                                                                        .data
                                                                        .data[
                                                                            index]
                                                                        .dosen,
                                                                    style: TextStyle(
                                                                        color: DataColors
                                                                            .primary800,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "${snapshot.data.data[index].counter} Mhs",
                                                                  style: TextStyle(
                                                                      color: DataColors
                                                                          .Neutral400,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  } else {
                                                    return Container();
                                                  }
                                                });
                                          })
                                      : ListView.separated(
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
                                                controller.pilih.value =
                                                    snapshot
                                                        .data.data[index].dosen;
                                                Navigator.pop(context);
                                                controller.id_dosen.value =
                                                    snapshot.data.data[index]
                                                        .idDosen;
                                                print(
                                                    controller.id_dosen.value);
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 7.5.w,
                                                    vertical: 2.h),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      flex: 10,
                                                      child: Text(
                                                        snapshot.data
                                                            .data[index].dosen,
                                                        style: TextStyle(
                                                            color: DataColors
                                                                .primary800,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ),
                                                    Text(
                                                      "${snapshot.data.data[index].counter} Mhs",
                                                      style: TextStyle(
                                                          color: DataColors
                                                              .Neutral400,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                  SizedBox(
                                    height: 20.sp,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
            }
          }),
    );
  }
}
