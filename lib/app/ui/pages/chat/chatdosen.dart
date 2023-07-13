import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import '../../../controllers/helpdesk_c.dart';
import '../../theme/color.dart';

class ChatDosenPage extends StatelessWidget {
  HelpdeskController controller = Get.put(HelpdeskController());
  TextEditingController txt = TextEditingController();
  final box = GetStorage();
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
        title: Row(
          children: [
            Container(
              height: 30.sp,
              width: 30.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(datadosen[1]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 10.sp,
            ),
            Expanded(
              child: Text(
                datadosen[2],
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
              ),
            ),
          ],
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
                    .readpesandosen(data["nim"], datadosen[0]);
              },
              builder: (_) {
                if (_.messageListdosen.isEmpty) {
                  return Center(
                      child: Text(
                    "Belum ada chat",
                    style: TextStyle(color: DataColors.primary400),
                  ));
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    controller: HelpdeskController.to.scrollController,
                    physics: const ScrollPhysics(),
                    itemCount: _.messageListdosen.length,
                    itemBuilder: (BuildContext context, int index) {
                      return (_.messageListdosen[index].sender != "2")
                          ? adminchat(
                              Content: _.messageListdosen[index].content,
                              isread: _.messageListdosen[index].userRead,
                              datetime: _.messageListdosen[index].dateChat!,
                              dosen: _.messageListdosen[index].dosen!)
                          : userchat(
                              Content: _.messageListdosen[index].content,
                              isread: _.messageListdosen[index].adminRead,
                              datetime: _.messageListdosen[index].dateChat!);
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
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (txt.text == "") {
                        } else {
                          controller.inputchatdosen(
                              data["nim"], datadosen[0], txt.text);
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
}

class adminchat extends StatelessWidget {
  final String Content;
  final String isread;
  final DateTime datetime;
  final String dosen;
  const adminchat({
    Key? key,
    required this.Content,
    required this.isread,
    required this.datetime,
    required this.dosen,
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
                    Text(
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
  const userchat({
    Key? key,
    required this.Content,
    required this.isread,
    required this.datetime,
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
                Text(
                  Content,
                  style:
                      TextStyle(color: DataColors.primary600, fontSize: 12.sp),
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
