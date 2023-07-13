import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/ui/pages/navigation/chat.dart';
import 'package:sizer/sizer.dart';

import '../../theme/color.dart';

class PerkuliahanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Chat',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Colors.white,
          foregroundColor: DataColors.primary700,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(children: [
            TextField(
              style: TextStyle(fontSize: 12.sp),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: DataColors.primary,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.sp),
                    borderSide:
                        const BorderSide(color: Colors.transparent, width: 0.0),
                  ),
                  hintText: 'Cari',
                  hintStyle: TextStyle(
                    color: DataColors.primary,
                  ),
                  filled: true,
                  fillColor: DataColors.Neutral100),
            ),
            SizedBox(
              height: 20.sp,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    // Get.to(ChatPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CircleAvatar(),
                          const Spacer(
                            flex: 1,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Heri Saputro, S.Kep., Ns., M.Kep.",
                                style: TextStyle(
                                    color: DataColors.primary, fontSize: 12.sp),
                              ),
                              SizedBox(
                                height: 10.sp,
                              ),
                              Text(
                                "Ada yang bisa saya bantu? ",
                                style: TextStyle(
                                    color: DataColors.Neutral300,
                                    fontSize: 10.sp),
                              )
                            ],
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          Column(
                            children: [
                              Text(
                                "Hari Ini",
                                style: TextStyle(
                                    color: DataColors.Neutral300,
                                    fontSize: 10.sp),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.sp, horizontal: 10.sp),
                                decoration: BoxDecoration(
                                    color: DataColors.primary100,
                                    borderRadius: BorderRadius.circular(20.sp)),
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                      color: DataColors.primary,
                                      fontSize: 10.sp),
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
          ]),
        ));
  }
}
