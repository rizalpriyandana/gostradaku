import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/controllers/notifikasi/notifikasi_c.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:sizer/sizer.dart';

class AllNotifikasi extends StatelessWidget {
 NotifikasiController cn = Get.find<NotifikasiController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.all(0.sp),
          child: Column(
            children: [
              SizedBox(
                height: 15.sp,
              ),
              Padding(
                padding: EdgeInsets.only(right: 230.sp),
                child: Text(
                  "Hari Ini",
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: DataColors.primary800),
                ),
              ),
              SizedBox(
                height: 5.sp,
              ),
              for (int index = 0; index < cn.content.length; index++)
                GestureDetector(
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: "ini index ke$index",
                        toastLength: Toast.LENGTH_SHORT);
                  },
                  child: ContentHariIni(
                      title: cn.content[index].title,
                      subtitle: cn.content[index].subtitle,
                      description: cn.content[index].description,
                      icon: cn.content[index].icon),
                ),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: content.length,
              //     itemBuilder: (context, index) {
              //       IsiContent contents = content[index];
              //       return ContentHariIni(
              //         description: contents.description,
              //         icon: contents.icon,
              //         subtitle: contents.subtitle,
              //         title: contents.title,
              //       );
              //     },
              //   ),
              // ),
              SizedBox(
                height: 5.sp,
              ),
              Padding(
                padding: EdgeInsets.only(right: 220.sp),
                child: Text(
                  "Kemarin",
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: DataColors.primary800),
                ),
              ),
              SizedBox(
                height: 8.sp,
              ),
              for (int index = 0; index < cn.content.length; index++)
                GestureDetector(
                    onTap: () {
                      Fluttertoast.showToast(
                          msg: "ini index ke$index",
                          toastLength: Toast.LENGTH_SHORT);
                    },
                    child: Content2(
                        title: cn.content[index].title,
                        subtitle: cn.content[index].subtitle,
                        description: cn.content[index].description,
                        icon: cn.content[index].icon,
                        time: cn.content[index].time)),
              SizedBox(
                height: 5.sp,
              ),
              Padding(
                padding: EdgeInsets.only(right: 200.sp),
                child: Text(
                  "Minggu Lalu",
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: DataColors.primary800),
                ),
              ),
              SizedBox(
                height: 5.sp,
              ),
              NoContent(),
              SizedBox(
                height: 5.sp,
              ),
              Padding(
                padding: EdgeInsets.only(right: 210.sp),
                child: Text(
                  "Bulan Lalu",
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: DataColors.primary800),
                ),
              ),
              SizedBox(
                height: 5.sp,
              ),
              NoContent(),
              SizedBox(
                height: 5.sp,
              ),
            ],
          )
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Center(
          //       child: Image.asset(
          //         'assets/icon/notification.png',
          //         height: 50.sp,
          //         width: 50.sp,
          //       ),
          //     ),
          //     SizedBox(
          //       height: 10.sp,
          //     ),
          //     Text(
          //       "Belum ada Notifikasi",
          //       style: TextStyle(
          //           fontSize: 14.sp,
          //           fontWeight: FontWeight.bold,
          //           color: DataColors.primary700),
          //     )
          //   ],
          // ),
          ),
    );
  }
}

class NoContent extends StatelessWidget {
  // const NoContent({
  //   Key? key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 85.sp,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            color: DataColors.bluesky,
          ),
          child: Row(
            children: [
              Container(
                height: 85.sp,
                width: 10.sp,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.sp),
                      topLeft: Radius.circular(10.sp),
                    ),
                    color: DataColors.primary800),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50.sp, right: 5.sp),
                child: Image.asset(
                  'assets/icon/notification.png',
                  height: 30.sp,
                  width: 30.sp,
                ),
              ),
              Text(
                "Tidak ada notifikasi",
                style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: DataColors.primary800),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Content2 extends StatelessWidget {
  String title;
  String subtitle;
  String description;
  String icon;
  String time;

  Content2({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 5.sp,),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 45.sp),
                child: Center(
                  child: Image.asset(
                    icon,
                    height: 40.sp,
                    width: 40.sp,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                          color: DataColors.black),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.normal,
                          color: DataColors.black),
                    ),
                    Container(
                      padding: EdgeInsets.all(0.sp),
                      height: 45.sp,
                      width: 200.sp,
                      child: Text(
                        description,
                        style: TextStyle(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w500,
                            color: DataColors.blues),
                      ),
                    ),
                    SizedBox(
                      height: 7.sp,
                    ),
                    Text(
                      time,
                      style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                          color: DataColors.primary800),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.sp, left: 5.sp),
                child: Container(
                  padding: EdgeInsets.all(0.sp),
                  height: 15.sp,
                  width: 15.sp,
                  child: Image.asset("assets/icon/arrowright.png"),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10.sp,
        )
      ],
    );
  }
}

class ContentHariIni extends StatelessWidget {
  String title;
  String subtitle;
  String description;
  String icon;

  ContentHariIni(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.description,
      required this.icon})
      : super(key: key);
  // const ContentHariIni({
  //   Key? key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 87.sp,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            color: DataColors.bluesky,
          ),
          child: Row(
            children: [
              Container(
                height: 87.sp,
                width: 10.sp,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.sp),
                      topLeft: Radius.circular(10.sp),
                    ),
                    color: DataColors.primary800),
              ),
              SizedBox(
                width: 5.sp,
              ),
              Container(
                padding: EdgeInsets.only(left: 0.sp),
                height: 40.sp,
                width: 40.sp,
                child: Center(
                  child: Image.asset(
                    icon,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.sp, left: 5.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 18.sp,
                          width: 95.sp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: DataColors.primary800,
                          ),
                          child: Center(
                            child: Text(
                              title,
                              style: TextStyle(
                                  fontSize: 7.5.sp,
                                  fontWeight: FontWeight.normal,
                                  color: DataColors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 45.sp,
                        ),
                        Text(
                          "Baru Saja",
                          style: TextStyle(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.bold,
                              color: DataColors.blues),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.sp,
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: DataColors.primary800),
                    ),
                    Container(
                      padding: EdgeInsets.all(0.sp),
                      height: 32.sp,
                      width: 180.sp,
                      child: Text(
                        description,
                        style: TextStyle(
                            fontSize: 7.5.sp,
                            fontWeight: FontWeight.normal,
                            color: DataColors.blues),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 12.sp,
              ),
              Container(
                padding: EdgeInsets.all(0.sp),
                height: 15.sp,
                width: 15.sp,
                child: Image.asset("assets/icon/arrowright.png"),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10.sp,
        )
      ],
    );
  }
}


