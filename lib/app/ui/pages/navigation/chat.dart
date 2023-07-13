import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import '../../../controllers/helpdesk_c.dart';
import '../../theme/color.dart';

class ChatPage extends StatelessWidget {
  HelpdeskController controller = Get.put(HelpdeskController());
  TextEditingController txt = TextEditingController();
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
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
      body: GetBuilder<HelpdeskController>(
        initState: (state) async {
          controller.scrollDown();
          return HelpdeskController.to.readpesan(data["nim"]);
        },
        builder: (_) {
          if (_.messageList.isEmpty) {
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
              itemCount: _.messageList.length,
              itemBuilder: (BuildContext context, int index) {
                return (_.messageList[index].dosen != null)
                    ? adminchat(
                        Content: _.messageList[index].content,
                        isread: _.messageList[index].userRead,
                        datetime: _.messageList[index].dateChat!,
                        dosen: _.messageList[index].dosen!)
                    : userchat(
                        Content: _.messageList[index].content,
                        isread: _.messageList[index].adminRead,
                        datetime: _.messageList[index].dateChat!);
              },
            );
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0.sp, horizontal: 12.sp),
        child: TextField(
          controller: txt,
          style: TextStyle(fontSize: 12.sp),
          decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  if (txt.text == "") {
                  } else {
                    controller.inputchat(data["nim"], txt.text);
                    txt.text = "";
                  }
                },
                icon: Icon(
                  Icons.send,
                  color: DataColors.primary700,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.sp),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0.0),
              ),
              filled: true,
              fillColor: DataColors.Neutral100),
        ),
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
        Padding(
          padding: EdgeInsets.only(left: 20.0.sp),
          child: Text(
            dosen,
            style: TextStyle(color: DataColors.primary),
          ),
        ),
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
