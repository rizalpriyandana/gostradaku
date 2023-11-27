import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/library/library_c.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:sizer/sizer.dart';

class Booking extends StatefulWidget {


  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  LibraryController lc = Get.find<LibraryController>();
  final box = GetStorage();
  late Map data = box.read("dataUser") as Map<String, dynamic>;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DataColors.white,
        elevation: 0,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 0.sp),
          child: Text(
            "Booking Book",
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: DataColors.primary800),
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(top: 11.sp, left: 10.sp),
          child: GestureDetector(
            onTap: () {
              lc.allbook(data['nim']);
              Get.back();
            },
            child: FaIcon(
              FontAwesomeIcons.angleLeft,
              color: DataColors.primary800,
              size: 18.sp,
            ),
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 100.w,
          height: 20.h,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage('assets/images/datatidakada.png'),
                height: 110.sp,
              ),
              Text(
                "Belum Ada Data",
                style: TextStyle(color: DataColors.Neutral300),
              )
            ],
          ),
        ),
      ),
    );
  }
}
