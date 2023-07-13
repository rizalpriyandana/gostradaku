import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/ui/pages/chat/dosen.dart';
import 'package:gostradav1/app/ui/pages/chat/pegawai.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/clarity.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../../controllers/helpdesk_c.dart';
import '../../theme/color.dart';
import '../chat/chatdosen.dart';
import '../chat/chatpegawai.dart';

class ChatMainPage extends StatefulWidget {
  @override
  State<ChatMainPage> createState() => _ChatMainPageState();
}

class _ChatMainPageState extends State<ChatMainPage> {
  HelpdeskController controller = Get.put(HelpdeskController());

  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        backgroundColor: DataColors.primary600,
        animatedIcon: AnimatedIcons.add_event,
        children: [
          SpeedDialChild(
              child: Iconify(
                Ph.chalkboard_teacher_light,
                color: DataColors.primary600,
              ),
              onTap: () {
                Get.to(DosenPage());
              },
              label: "Dosen",
              labelStyle: TextStyle(
                  color: DataColors.primary, fontWeight: FontWeight.w600)),
          SpeedDialChild(
              onTap: () {
                Get.to(PegawaiPage());
              },
              child: Iconify(
                Clarity.employee_group_line,
                color: DataColors.primary600,
              ),
              label: "Pegawai",
              labelStyle: TextStyle(
                  color: DataColors.primary, fontWeight: FontWeight.w600)),
        ],
      ),
      appBar: AppBar(
        title: Text(
          'Help Desk',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
        ),
        backgroundColor: Colors.white,
        foregroundColor: DataColors.primary,
        elevation: 0,
        centerTitle: true,
      ),
      body: FutureBuilder<dynamic>(
          future: controller.getchat(data["nim"]),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 7.5.w),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: snapshot.data.total,
                  separatorBuilder: (BuildContext context, int index) {
                    return Container();
                  },
                  itemBuilder: (BuildContext context, int index) {
                    print(snapshot.data.data[index].idPosisi);
                    return (snapshot.data.data[index].idPosisi != "")
                        ? InkWell(
                            onTap: () {
                              controller.delete();
                              Get.to(ChatPegawaiPage(), arguments: [
                                snapshot.data.data[index].idPosisi,
                                snapshot.data.data[index].namaPosisi
                              ]);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 12.sp),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 40.sp,
                                        width: 40.sp,
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: DataColors.primary100,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Iconify(
                                          Mdi.account,
                                          color: DataColors.primary,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.sp,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 50.w,
                                            child: Text(
                                              snapshot
                                                  .data.data[index].namaPosisi,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: DataColors.primary600,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.sp,
                                          ),
                                          SizedBox(
                                            width: 50.w,
                                            child: Text(
                                              snapshot.data.data[index].chat,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: DataColors.Neutral400,
                                                  fontSize: 10.sp),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        snapshot.data.data[index].dateChat,
                                        style: TextStyle(
                                            color: DataColors.Neutral400,
                                            fontSize: 9.sp),
                                      ),
                                      SizedBox(
                                        height: 10.sp,
                                      ),
                                      (snapshot.data.data[index].counter == "0")
                                          ? Container(
                                              height: 10.sp,
                                            )
                                          : Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 7.sp),
                                              decoration: BoxDecoration(
                                                  color: DataColors.primary600,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: Text(
                                                snapshot
                                                    .data.data[index].counter,
                                                style: TextStyle(
                                                    fontSize: 10.sp,
                                                    color: Colors.white),
                                              ),
                                            ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              Get.to(ChatDosenPage(), arguments: [
                                snapshot.data.data[index].idAdmin,
                                snapshot.data.data[index].photo,
                                snapshot.data.data[index].dosen
                              ]);
                            },
                            onLongPress: () {},
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.sp),
                              child: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 40.sp,
                                          width: 40.sp,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  snapshot
                                                      .data.data[index].photo),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.sp,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 50.w,
                                              child: Text(
                                                snapshot.data.data[index].dosen,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color:
                                                        DataColors.primary600,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12.sp,
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
                                                snapshot.data.data[index].chat,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color:
                                                        DataColors.Neutral400,
                                                    fontSize: 10.sp),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          snapshot.data.data[index].dateChat,
                                          style: TextStyle(
                                              color: DataColors.Neutral400,
                                              fontSize: 9.sp),
                                        ),
                                        SizedBox(
                                          height: 10.sp,
                                        ),
                                        (snapshot.data.data[index].counter ==
                                                "0")
                                            ? Container(
                                                height: 10.sp,
                                              )
                                            : Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 7.sp),
                                                decoration: BoxDecoration(
                                                    color:
                                                        DataColors.primary600,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                child: Text(
                                                  snapshot
                                                      .data.data[index].counter,
                                                  style: TextStyle(
                                                      fontSize: 10.sp,
                                                      color: Colors.white),
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
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
