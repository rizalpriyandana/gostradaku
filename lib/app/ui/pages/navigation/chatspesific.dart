import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/helpdesk_c.dart';
import 'package:sizer/sizer.dart';

import '../../theme/color.dart';

class ChatSpesificPage extends StatelessWidget {
  final box = GetStorage();
  HelpdeskController controller = Get.put(HelpdeskController());

  @override
  Widget build(BuildContext context) {
    var datachat = Get.arguments;
    // print(datachat[0]);
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          datachat[1],
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
        ),
        backgroundColor: Colors.white,
        foregroundColor: DataColors.primary,
        elevation: 0,
        centerTitle: true,
      ),
      body: FutureBuilder<dynamic>(
          future: controller.listdosen(data["nim"], datachat[0]),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: 0,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10.sp,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          color: DataColors.primary100,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [Text("Test")],
                      ),
                    );
                  },
                ),
              );
            } else {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
                child: ListView.separated(
                  itemCount: 2,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10.sp,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          color: DataColors.primary100,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40.sp,
                                width: 40.sp,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/BSI.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.sp,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 40.w,
                                    child: Text(
                                      "IBU SRWITASI sssssssssssssss",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: DataColors.primary600,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.sp,
                                  ),
                                  SizedBox(
                                    width: 40.w,
                                    child: Text(
                                      "Halo apa kabar kamu sayang sekali?",
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
                            children: [
                              Text(
                                "Today",
                                style: TextStyle(
                                    color: DataColors.Neutral400,
                                    fontSize: 10.sp),
                              ),
                              SizedBox(
                                height: 5.sp,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 7.sp),
                                decoration: BoxDecoration(
                                    color: DataColors.primary,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                      fontSize: 10.sp, color: Colors.white),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            }
          }),
    );
  }
}
