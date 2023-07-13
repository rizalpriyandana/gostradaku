import 'dart:io';

import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/ui/pages/kategori/monitoringskripsi/lihatfoto.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import '../../../../controllers/helpdesk_c.dart';
import '../../../theme/color.dart';

class OpenDiscussPage extends StatefulWidget {
  @override
  State<OpenDiscussPage> createState() => _MonitoringSkripsiPageState();
}

class _MonitoringSkripsiPageState extends State<OpenDiscussPage> {
  HelpdeskController controller = Get.put(HelpdeskController());

  TextEditingController txt = TextEditingController();

  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    FocusNode _focusNode = FocusNode();
    var datapesan = Get.arguments;
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                  Icons.arrow_back_ios), // Put icon of your preference.
              onPressed: () {
                controller.readpesandosenpembimbing(data["nim"], datapesan[1]);
                Get.back();
              },
            );
          },
        ),
        title: Text(
          "Open Discuss",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
        ),
        backgroundColor: Colors.white,
        foregroundColor: DataColors.primary,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<HelpdeskController>(
              initState: (state) async {
                controller.scrollDown();
                return HelpdeskController.to
                    .readpesandiscuss(data["nim"], datapesan[0]);
              },
              builder: (_) {
                if (_.messageListdosenpembimbing.isEmpty) {
                  return Center(
                      child: Text(
                    "Belum ada Chat",
                    style: TextStyle(color: DataColors.primary400),
                  ));
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    controller: HelpdeskController.to.scrollController,
                    physics: const ScrollPhysics(),
                    itemCount: _.messageListdosenpembimbing.length,
                    itemBuilder: (BuildContext context, int index) {
                      return (_.messageListdosenpembimbing[index].sender != "2")
                          ? adminchat(
                              Content:
                                  _.messageListdosenpembimbing[index].content,
                              datetime:
                                  _.messageListdosenpembimbing[index].dateChat!,
                              dosen: _.messageListdosenpembimbing[index].dosen,
                              imageUrl:
                                  _.messageListdosenpembimbing[index].uploads,
                            )
                          : userchat(
                              imageUrl:
                                  _.messageListdosenpembimbing[index].uploads,
                              Content:
                                  _.messageListdosenpembimbing[index].content,
                              isread:
                                  _.messageListdosenpembimbing[index].adminRead,
                              datetime: _
                                  .messageListdosenpembimbing[index].dateChat!);
                    },
                  );
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.sp, horizontal: 12.sp),
            child: Container(
              decoration: BoxDecoration(
                  color: DataColors.Neutral100,
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.only(left: 12.0.sp),
                child: TextField(
                  controller: txt,
                  focusNode: _focusNode,
                  style: TextStyle(fontSize: 12.sp),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: IconButton(
                      onPressed: () {
                        pickImage();
                      },
                      icon: (image == null)
                          ? Icon(
                              Icons.add_a_photo,
                              color: DataColors.primary700,
                            )
                          : Badge(
                              badgeContent: Text(
                                '1',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 8.sp),
                              ),
                              child: Icon(
                                Icons.add_a_photo,
                                color: DataColors.primary700,
                              ),
                            ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (image != null || txt.text != "") {
                          controller.inputchatdiscuss(data["nim"], datapesan[1],
                              datapesan[0], txt.text, image);
                          txt.text = "";
                        }
                      },
                      icon: Icon(
                        Icons.send,
                        color: DataColors.primary700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {}
  }
}

class adminchat extends StatelessWidget {
  final String Content;

  final DateTime datetime;
  final String dosen;
  final String imageUrl;
  const adminchat({
    Key? key,
    required this.Content,
    required this.datetime,
    required this.dosen,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0.sp, bottom: 10.sp),
              child: Container(
                padding: EdgeInsets.all(8.sp),
                decoration: BoxDecoration(
                    color: DataColors.Neutral200,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    (imageUrl == "")
                        ? Container()
                        : InkWell(
                            onTap: () {
                              Get.to(PhotoPage(
                                img: imageUrl,
                              ));
                            },
                            child: SizedBox(
                                width: 100.sp,
                                height: 100.sp,
                                child: CachedNetworkImage(imageUrl: imageUrl)),
                          ),
                    (Content == "")
                        ? Container()
                        : Text(
                            Content,
                            style: TextStyle(
                                color: DataColors.primary600, fontSize: 12.sp),
                          ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(DateFormat('kk:mm').format(datetime),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: DataColors.primary, fontSize: 9.sp)),
                    )
                  ],
                ),
              ),
            ),
            const Spacer()
          ],
        ),
      ],
    );
  }
}

class userchat extends StatelessWidget {
  final String Content;
  final String isread;
  final DateTime datetime;
  final String imageUrl;
  const userchat({
    Key? key,
    required this.Content,
    required this.isread,
    required this.datetime,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(right: 20.0.sp, bottom: 10.sp),
          child: Container(
            padding: EdgeInsets.all(8.sp),
            decoration: BoxDecoration(
                color: DataColors.primary200,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                (imageUrl == "")
                    ? Container()
                    : InkWell(
                        onTap: () {
                          Get.to(PhotoPage(
                            img: imageUrl,
                          ));
                        },
                        child: SizedBox(
                            width: 100.sp,
                            height: 100.sp,
                            child: CachedNetworkImage(imageUrl: imageUrl)),
                      ),
                (Content == "")
                    ? Container()
                    : Text(
                        Content,
                        style: TextStyle(
                            color: DataColors.primary600, fontSize: 12.sp),
                      ),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: (isread == "1") ? HexColor("536FAE") : Colors.grey,
                      size: 10.sp,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 2.sp),
                      child: Text(DateFormat('kk:mm').format(datetime),
                          style: TextStyle(
                              color: DataColors.primary, fontSize: 9.sp)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
