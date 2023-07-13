import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/tagihan_c.dart';
import 'package:sizer/sizer.dart';

import '../../../theme/color.dart';

class KeringananPage extends StatelessWidget {
  final box = GetStorage();
  TagihanController controller = Get.put(TagihanController());
  @override
  Widget build(BuildContext context) {
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pengajuan Keringanan',
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
          future: controller.pengajuanceksemester(data["nim"]),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasData) {
                  return Container(
                    height: 100.h,
                    width: 100.w,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          (snapshot.data["status"] == "0")
                              ? Text(
                                  "Mahasiswa tidak terdaftar pada keringanan, silahkan menuju kantor keuangan untuk pengajuan keringanan",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: DataColors.primary700,
                                      fontWeight: FontWeight.w600),
                                )
                              : Text("Mahasiswa sudah pengajuan keringanan",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: DataColors.primary700,
                                      fontWeight: FontWeight.w600))
                        ],
                      ),
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
