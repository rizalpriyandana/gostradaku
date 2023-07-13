import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/controllers/navigation/botnav_c.dart';
import 'package:gostradav1/app/ui/pages/navigation/chat.dart';
import 'package:gostradav1/app/ui/pages/navigation/chatmain.dart';
import 'package:gostradav1/app/ui/pages/navigation/dashboard.dart';
import 'package:gostradav1/app/ui/pages/navigation/list_chat.dart';
import 'package:gostradav1/app/ui/pages/navigation/monitoring.dart';
import 'package:gostradav1/app/ui/pages/navigation/percakapan.dart';
import 'package:gostradav1/app/ui/pages/navigation/profile.dart';

import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

class BottomNavigationPage extends StatelessWidget {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final List<Widget> pagesList = [
    DashboardPage(),
    MonitoringPage(),
    ChatMainPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    BottomNavigationController botNavController =
        Get.put(BottomNavigationController());
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: botNavController.selectedIdex.value,
          children: pagesList,
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50.sp,
        color: DataColors.primary200,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.transparent,
        key: _bottomNavigationKey,
        items: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Icon(
              Icons.home_rounded,
              size: 17.sp,
              color: DataColors.primary600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ImageIcon(
              AssetImage("assets/icon/botnav/monitoring.png"),
              size: 17.sp,
              color: DataColors.primary600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ImageIcon(
              AssetImage("assets/icon/botnav/chat.png"),
              size: 17.sp,
              color: DataColors.primary600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ImageIcon(
              AssetImage("assets/icon/botnav/person.png"),
              size: 17.sp,
              color: DataColors.primary600,
            ),
          ),
        ],
        onTap: (index) {
          botNavController.tappedIndex(index);
        },
      ),
      // bottomNavigationBar: Obx(
      //   () => Container(
      //     padding: const EdgeInsets.only(top: 10),
      //     decoration: BoxDecoration(
      //         color: HexColor('#3C5595'),
      //         borderRadius: const BorderRadius.only(
      //           topLeft: Radius.circular(10),
      //           topRight: Radius.circular(10),
      //         )),
      //     child: BottomNavigationBar(
      //       backgroundColor: HexColor('#3C5595'),
      //       selectedItemColor: DataColors.blusky,
      //       unselectedItemColor: HexColor('#7D98CE'),
      //       onTap: (index) {
      //         botNavController.tappedIndex(index);
      //       },
      //       currentIndex: botNavController.selectedIdex.value,
      //       elevation: 0,
      //       type: BottomNavigationBarType.fixed,
      //       items: NavList,
      //     ),
      //   ),
      // ),
    );
  }

  //list Bottom Navigation
  List<BottomNavigationBarItem> get NavList {
    return [
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.home_rounded,
          size: 32,
        ),
        label: 'Beranda',
      ),
      const BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/icon/botnav/monitoring.png"),
          size: 32,
        ),
        label: 'Monitoring',
      ),
      const BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/icon/botnav/chat.png"),
          size: 32,
        ),
        label: 'Chat',
      ),
      const BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/icon/botnav/person.png"),
          size: 32,
        ),
        label: 'Profil',
      ),
    ];
  }
}
