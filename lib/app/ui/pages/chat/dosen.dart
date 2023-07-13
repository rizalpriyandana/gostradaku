import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/data/models/chat_m.dart';
import 'package:gostradav1/app/ui/pages/chat/chatdosen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/helpdesk_c.dart';
import '../../theme/color.dart';


class DosenPage extends StatelessWidget {
  TextEditingController txt = TextEditingController();
  HelpdeskController controller = Get.put(HelpdeskController());
  List<ChatModel> person = [];
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    FocusNode _focusNode = FocusNode();
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dosen',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: DataColors.primary600,
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
          future: controller.getdosen(data["nim"], "1"),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasData) {
                  return Container(
                    height: 100.h,
                    child: Column(
                      children: [
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
                                controller: txt,
                                focusNode: _focusNode,
                                onChanged: (text) {
                                  controller.search(data["nim"], text);
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
                            // child: Row(
                            //   mainAxisAlignment:
                            //       MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(
                            //       "Search ...",
                            //       style:
                            //           TextStyle(color: DataColors.primary400),
                            //     ),
                            //     Iconify(
                            //       Carbon.search,
                            //       color: DataColors.primary,
                            //     )
                            //   ],
                            // ),
                          ),
                        ),
                        Obx(() => Expanded(
                              flex: 9,
                              child: SingleChildScrollView(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 7.w, vertical: 2.h),
                                child: Column(
                                  children: [
                                    (controller.usingsearch == true)
                                        ? GetBuilder<HelpdeskController>(
                                            initState: (_) {},
                                            builder: (_) {
                                              return FutureBuilder(
                                                future: controller.search(
                                                    data["nim"], txt.text),
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasData) {
                                                    return ListView.separated(
                                                      itemCount: controller
                                                          .dosen[0]
                                                          .data!
                                                          .length,
                                                      shrinkWrap: true,
                                                      physics: ScrollPhysics(),
                                                      separatorBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return SizedBox();
                                                      },
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        print(controller
                                                            .dosen[0].total);
                                                        return InkWell(
                                                          onTap: () {
                                                            controller.delete();
                                                            Get.to(
                                                                ChatDosenPage(),
                                                                arguments: [
                                                                  controller
                                                                      .dosen[0]
                                                                      .data![
                                                                          index]
                                                                      .id,
                                                                  controller
                                                                      .dosen[0]
                                                                      .data![
                                                                          index]
                                                                      .photo,
                                                                  controller
                                                                      .dosen[0]
                                                                      .data![
                                                                          index]
                                                                      .dosen
                                                                ]);
                                                          },
                                                          onLongPress: () {},
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10.sp),
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(3),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12)),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            40.sp,
                                                                        width: 40
                                                                            .sp,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(16),
                                                                          image:
                                                                              DecorationImage(
                                                                            image:
                                                                                CachedNetworkImageProvider("https://i.scdn.co/image/ab6761610000e5eb006ff3c0136a71bfb9928d34"),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width: 10
                                                                            .sp,
                                                                      ),
                                                                      Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                50.w,
                                                                            child:
                                                                                Text(
                                                                              controller.dosen[0].data![index].dosen,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              style: TextStyle(color: DataColors.primary600, fontWeight: FontWeight.w600, fontSize: 12.sp, overflow: TextOverflow.ellipsis),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                5.sp,
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                50.w,
                                                                            child:
                                                                                Text(
                                                                              controller.dosen[0].data![index].chat,
                                                                              maxLines: 1,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              style: TextStyle(color: DataColors.Neutral400, fontSize: 10.sp),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Text(
                                                                        controller
                                                                            .dosen[0]
                                                                            .data![index]
                                                                            .dateChat,
                                                                        style: TextStyle(
                                                                            color:
                                                                                DataColors.Neutral400,
                                                                            fontSize: 9.sp),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10.sp,
                                                                      ),
                                                                      (controller.dosen[0].data![index].counter ==
                                                                              "0")
                                                                          ? Container(
                                                                              height: 10.sp,
                                                                            )
                                                                          : Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 7.sp),
                                                                              decoration: BoxDecoration(color: DataColors.primary600, borderRadius: BorderRadius.circular(12)),
                                                                              child: Text(
                                                                                controller.dosen[0].data![index].counter,
                                                                                style: TextStyle(fontSize: 10.sp, color: Colors.white),
                                                                              ),
                                                                            )
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  } else {
                                                    return Container();
                                                  }
                                                },
                                              );
                                            })
                                        : ListView.separated(
                                            itemCount: snapshot.data.total,
                                            shrinkWrap: true,
                                            physics: ScrollPhysics(),
                                            separatorBuilder:
                                                (BuildContext context,
                                                    int index) {
                                              return SizedBox();
                                            },
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return InkWell(
                                                onTap: () {
                                                  Get.to(ChatDosenPage(),
                                                      arguments: [
                                                        snapshot.data
                                                            .data[index].id,
                                                        snapshot.data
                                                            .data[index].photo,
                                                        snapshot.data
                                                            .data[index].dosen
                                                      ]);
                                                },
                                                onLongPress: () {},
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10.sp),
                                                  child: Container(
                                                    padding: EdgeInsets.all(3),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              height: 40.sp,
                                                              width: 40.sp,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16),
                                                                image:
                                                                    DecorationImage(
                                                                  image: CachedNetworkImageProvider(
                                                                      snapshot
                                                                          .data
                                                                          .data[
                                                                              index]
                                                                          .photo),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10.sp,
                                                            ),
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                  width: 50.w,
                                                                  child: Text(
                                                                    snapshot
                                                                        .data
                                                                        .data[
                                                                            index]
                                                                        .dosen,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: TextStyle(
                                                                        color: DataColors
                                                                            .primary600,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontSize: 12
                                                                            .sp,
                                                                        overflow:
                                                                            TextOverflow.ellipsis),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 5.sp,
                                                                ),
                                                                SizedBox(
                                                                  width: 50.w,
                                                                  child: Text(
                                                                    snapshot
                                                                        .data
                                                                        .data[
                                                                            index]
                                                                        .chat,
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: TextStyle(
                                                                        color: DataColors
                                                                            .Neutral400,
                                                                        fontSize:
                                                                            10.sp),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              snapshot
                                                                  .data
                                                                  .data[index]
                                                                  .dateChat,
                                                              style: TextStyle(
                                                                  color: DataColors
                                                                      .Neutral400,
                                                                  fontSize:
                                                                      9.sp),
                                                            ),
                                                            SizedBox(
                                                              height: 10.sp,
                                                            ),
                                                            (snapshot
                                                                        .data
                                                                        .data[
                                                                            index]
                                                                        .counter ==
                                                                    "0")
                                                                ? Container(
                                                                    height:
                                                                        10.sp,
                                                                  )
                                                                : Container(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            7.sp),
                                                                    decoration: BoxDecoration(
                                                                        color: DataColors
                                                                            .primary600,
                                                                        borderRadius:
                                                                            BorderRadius.circular(12)),
                                                                    child: Text(
                                                                      snapshot
                                                                          .data
                                                                          .data[
                                                                              index]
                                                                          .counter,
                                                                      style: TextStyle(
                                                                          fontSize: 10
                                                                              .sp,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                  ],
                                ),
                              ),
                            )),
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
