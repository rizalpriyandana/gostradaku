import 'dart:io';

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
import 'opendiscussion.dart';
import 'package:badges/badges.dart';

class MonitoringSkripsiPage extends StatefulWidget {
  @override
  State<MonitoringSkripsiPage> createState() => _MonitoringSkripsiPageState();
}

class _MonitoringSkripsiPageState extends State<MonitoringSkripsiPage> {
  @override
  HelpdeskController controller = Get.put(HelpdeskController());

  TextEditingController txt = TextEditingController();

  final box = GetStorage();
  String? id_dosen;
  @override
  Widget build(BuildContext context) {
    FocusNode _focusNode = FocusNode();
    var datadosen = Get.arguments;
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
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
        title: FutureBuilder<dynamic>(
            future: controller.profilebar(data["nim"]),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                id_dosen = snapshot.data.data.id;
                return Row(
                  children: [
                    Container(
                      height: 30.sp,
                      width: 30.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              snapshot.data.data.photo),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                    Expanded(
                      child: Text(
                        snapshot.data.data.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12.sp),
                      ),
                    ),
                  ],
                );
              } else {
                return Text(
                  "Belum menerima bimbingan skripsi",
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
                );
              }
            }),
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
                return HelpdeskController.to.profilebar(data["nim"]);
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
                              reply: _.messageListdosenpembimbing[index].reply,
                              Content:
                                  _.messageListdosenpembimbing[index].content,
                              datetime:
                                  _.messageListdosenpembimbing[index].dateChat!,
                              dosen: _.messageListdosenpembimbing[index].dosen,
                              imageUrl:
                                  _.messageListdosenpembimbing[index].uploads,
                              id_admin:
                                  _.messageListdosenpembimbing[index].idAdmin,
                              id_pesan:
                                  _.messageListdosenpembimbing[index].idPesan,
                              nim: _.messageListdosenpembimbing[index].nim,
                            )
                          : userchat(
                              reply: _.messageListdosenpembimbing[index].reply,
                              imageUrl:
                                  _.messageListdosenpembimbing[index].uploads,
                              Content:
                                  _.messageListdosenpembimbing[index].content,
                              isread:
                                  _.messageListdosenpembimbing[index].adminRead,
                              datetime:
                                  _.messageListdosenpembimbing[index].dateChat!,
                              id_admin:
                                  _.messageListdosenpembimbing[index].idAdmin,
                              id_pesan:
                                  _.messageListdosenpembimbing[index].idPesan,
                              nim: _.messageListdosenpembimbing[index].nim,
                            );
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
                          controller.inputchatdosenpembimbing(
                              data["nim"], id_dosen!, txt.text, image);
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

class adminchat extends StatefulWidget {
  final String Content;
  final String id_admin;
  final String nim;
  final String id_pesan;
  final DateTime datetime;
  final String dosen;
  final String imageUrl;
  final String reply;
  adminchat({
    Key? key,
    required this.reply,
    required this.Content,
    required this.datetime,
    required this.dosen,
    required this.imageUrl,
    required this.id_admin,
    required this.nim,
    required this.id_pesan,
  }) : super(key: key);

  @override
  State<adminchat> createState() => _adminchatState();
}

class _adminchatState extends State<adminchat> {
  HelpdeskController controller = Get.put(HelpdeskController());
  TextEditingController txt = TextEditingController();
  File? image;
  @override
  Widget build(BuildContext context) {
    Future pickImage() async {
      try {
        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) return;
        final imageTemp = File(image.path);
        setState(() => this.image = imageTemp);
      } on PlatformException catch (e) {}
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0.sp, bottom: 10.sp),
              child: InkWell(
                onLongPress: () {
                  if (widget.reply != "0") {
                    Get.to(OpenDiscussPage(),
                        arguments: [widget.id_pesan, widget.id_admin]);
                  } else {
                    Get.defaultDialog(
                        title: "${widget.Content}",
                        titleStyle: TextStyle(
                          color: DataColors.primary,
                        ),
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (widget.imageUrl == "")
                                ? Container()
                                : Center(
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(PhotoPage(
                                          img: widget.imageUrl,
                                        ));
                                      },
                                      child: SizedBox(
                                          width: 100.sp,
                                          height: 100.sp,
                                          child: CachedNetworkImage(
                                              imageUrl: widget.imageUrl)),
                                    ),
                                  ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: DataColors.Neutral100,
                                  borderRadius: BorderRadius.circular(12)),
                              child: TextField(
                                controller: txt,
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
                                                  color: Colors.white,
                                                  fontSize: 8.sp),
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
                                        controller.inputchatdiscuss(
                                            widget.nim,
                                            widget.id_admin,
                                            widget.id_pesan,
                                            txt.text,
                                            image);
                                        txt.text = "";
                                        Get.off(OpenDiscussPage(), arguments: [
                                          widget.id_pesan,
                                          widget.id_admin
                                        ]);
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
                          ],
                        ));
                  }
                },
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
                      (widget.imageUrl == "")
                          ? Container()
                          : InkWell(
                              onTap: () {
                                Get.to(PhotoPage(
                                  img: widget.imageUrl,
                                ));
                              },
                              child: SizedBox(
                                  width: 100.sp,
                                  height: 100.sp,
                                  child: CachedNetworkImage(
                                      imageUrl: widget.imageUrl)),
                            ),
                      (widget.Content == "")
                          ? Container()
                          : Text(
                              widget.Content,
                              style: TextStyle(
                                  color: DataColors.primary600,
                                  fontSize: 12.sp),
                            ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            (widget.reply == "0")
                                ? Container()
                                : Row(
                                    children: [
                                      Text(widget.reply,
                                          style: TextStyle(
                                              color: DataColors.primary,
                                              fontSize: 9.sp)),
                                      Icon(Icons.reply,
                                          color: DataColors.primary,
                                          size: 14.sp),
                                      SizedBox(
                                        width: 2,
                                      ),
                                    ],
                                  ),
                            Text(DateFormat('kk:mm').format(widget.datetime),
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: DataColors.primary, fontSize: 9.sp)),
                          ],
                        ),
                      )
                    ],
                  ),
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

class userchat extends StatefulWidget {
  final String Content;
  final String isread;
  final DateTime datetime;
  final String imageUrl;
  final String nim;
  final String id_admin;
  final String id_pesan;
  final String reply;
  userchat({
    Key? key,
    required this.Content,
    required this.isread,
    required this.datetime,
    required this.imageUrl,
    required this.nim,
    required this.id_admin,
    required this.id_pesan,
    required this.reply,
  }) : super(key: key);

  @override
  State<userchat> createState() => _userchatState();
}

class _userchatState extends State<userchat> {
  TextEditingController txt = TextEditingController();
  File? image;
  HelpdeskController controller = Get.put(HelpdeskController());
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(right: 20.0.sp, bottom: 10.sp),
          child: InkWell(
            onLongPress: () {
              if (widget.reply != "0") {
                Get.to(OpenDiscussPage(),
                    arguments: [widget.id_pesan, widget.id_admin]);
              } else {
                Get.defaultDialog(
                    title: "${widget.Content}",
                    titleStyle: TextStyle(
                      color: DataColors.primary,
                    ),
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        (widget.imageUrl == "")
                            ? Container()
                            : Center(
                                child: InkWell(
                                  onTap: () {
                                    Get.to(PhotoPage(
                                      img: widget.imageUrl,
                                    ));
                                  },
                                  child: SizedBox(
                                      width: 100.sp,
                                      height: 100.sp,
                                      child: CachedNetworkImage(
                                          imageUrl: widget.imageUrl)),
                                ),
                              ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: DataColors.Neutral100,
                              borderRadius: BorderRadius.circular(12)),
                          child: TextField(
                            controller: txt,
                            style: TextStyle(fontSize: 12.sp),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    pickImage();
                                  });
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
                                              color: Colors.white,
                                              fontSize: 8.sp),
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
                                    controller.inputchatdiscuss(
                                        widget.nim,
                                        widget.id_admin,
                                        widget.id_pesan,
                                        txt.text,
                                        image);
                                    txt.text = "";
                                    Get.off(OpenDiscussPage(), arguments: [
                                      widget.id_pesan,
                                      widget.id_admin
                                    ]);
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
                      ],
                    ));
              }
            },
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
                  (widget.imageUrl == "")
                      ? Container()
                      : InkWell(
                          onTap: () {
                            Get.to(PhotoPage(
                              img: widget.imageUrl,
                            ));
                          },
                          child: SizedBox(
                              width: 100.sp,
                              height: 100.sp,
                              child: CachedNetworkImage(
                                  imageUrl: widget.imageUrl)),
                        ),
                  (widget.Content == "")
                      ? Container()
                      : Text(
                          widget.Content,
                          style: TextStyle(
                              color: DataColors.primary600, fontSize: 12.sp),
                        ),
                  Row(
                    children: [
                      (widget.reply == "0")
                          ? Container()
                          : Row(
                              children: [
                                Text(widget.reply,
                                    style: TextStyle(
                                        color: DataColors.primary,
                                        fontSize: 9.sp)),
                                Icon(Icons.reply,
                                    color: DataColors.primary, size: 14.sp),
                              ],
                            ),
                      Icon(
                        Icons.check,
                        color: (widget.isread == "1")
                            ? HexColor("536FAE")
                            : Colors.grey,
                        size: 10.sp,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 2.sp),
                        child: Text(DateFormat('kk:mm').format(widget.datetime),
                            style: TextStyle(
                                color: DataColors.primary, fontSize: 9.sp)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
