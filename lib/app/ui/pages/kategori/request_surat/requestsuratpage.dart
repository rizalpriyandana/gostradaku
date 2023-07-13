import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/ui/pages/kategori/request_surat/datarequest.dart';
import 'package:gostradav1/app/ui/pages/kategori/request_surat/historyrequest.dart';
import 'package:sizer/sizer.dart';

import '../../../theme/color.dart';

class RequestSuratPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
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
            title: Text(
              "Request Surat",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
            foregroundColor: DataColors.primary700,
            automaticallyImplyLeading: true,
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: TabBar(
              indicatorColor: DataColors.primary700,
              tabs: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Data Request",
                    style: TextStyle(
                        color: DataColors.primary700,
                        fontWeight: FontWeight.w600,
                        fontSize: 10.sp),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "History",
                    style: TextStyle(
                        color: DataColors.primary700,
                        fontWeight: FontWeight.w600,
                        fontSize: 10.sp),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [DataRequestPage(), HistoryRequestPage()],
          ),
        ),
      ),
    );
  }
}
