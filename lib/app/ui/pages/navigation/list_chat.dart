import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/controllers/helpdesk_c.dart';
import 'package:gostradav1/app/ui/pages/navigation/chatspesific.dart';
import 'package:sizer/sizer.dart';

import '../../theme/color.dart';

class ListChatPage extends StatelessWidget {
  HelpdeskController controller = Get.put(HelpdeskController());
  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder<dynamic>(
          future: controller.listchathelpdesk(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                padding:
                    EdgeInsets.symmetric(vertical: 1.h, horizontal: 7.5.sp),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: snapshot.data.total,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10.sp,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Get.to(ChatSpesificPage(), arguments: [
                          snapshot.data.data[index].idPosisi,
                          snapshot.data.data[index].namaPosisi
                        ]);
                      },
                      child: Container(
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                            color: DataColors.primary100,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              snapshot.data.data[index].namaPosisi,
                              style: TextStyle(
                                  color: DataColors.primary600,
                                  fontWeight: FontWeight.w600),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 7.sp),
                              decoration: BoxDecoration(
                                  color: DataColors.primary600,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                "1",
                                style: TextStyle(
                                    fontSize: 10.sp, color: Colors.white),
                              ),
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
          }),
    );
  }
}
