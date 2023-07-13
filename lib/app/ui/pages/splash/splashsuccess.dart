import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/routes/rout_name.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:sizer/sizer.dart';

class SplashSuccessPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashSuccessPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () => Get.toNamed(RoutName.root));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 30.h, bottom: 30.sp),
                child: Container(
                  height: 30.w,
                  width: 30.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/Confirmed.png'),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
            Center(
              child: Text(
                'Berhasil! \nSurat anda sudah diajukan',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: DataColors.primary700,
                    fontWeight: FontWeight.w600,
                    fontSize: 10.sp,
                    decoration: TextDecoration.none),
              ),
            ),
          ]),
    );
  }
}
