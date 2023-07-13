
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/ui/pages/chat/chatpegawai.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/helpdesk_c.dart';
import '../../theme/color.dart';

class PegawaiPage extends StatelessWidget {
  HelpdeskController controller = Get.put(HelpdeskController());

  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pegawai',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
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
        elevation: 0,
        centerTitle: true,
      ),
      body: FutureBuilder<dynamic>(
          future: controller.getkaryawan(data["nim"], "0"),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 7.5.w),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: snapshot.data.total,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox();
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 40.sp,
                                      width: 40.sp,
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: DataColors.primary100,
                                        borderRadius: BorderRadius.circular(16),
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
                                                    BorderRadius.circular(12)),
                                            child: Text(
                                              snapshot.data.data[index].counter,
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
                        );
                      },
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
