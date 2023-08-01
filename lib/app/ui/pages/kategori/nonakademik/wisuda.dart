import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/auth/auth_c.dart';
import 'package:gostradav1/app/controllers/nonakademik/softskill/softskill_c.dart';
import 'package:gostradav1/app/routes/rout_name.dart';
import 'package:gostradav1/app/ui/pages/kategori/nonakademik/lihatundagan.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:sizer/sizer.dart';

import '../../../../controllers/wisuda_c.dart';

class WisudaPage extends StatefulWidget {
  @override
  State<WisudaPage> createState() => _WisudaPageState();
}

class _WisudaPageState extends State<WisudaPage> {
  AuthController controller = Get.find<AuthController>();
  WisudaController c = Get.put(WisudaController());
  final box = GetStorage();
  String? _downloadedFilePath;
  String datanim = "";

  // @override
  // void initState(){
  //   controller.myqrmhs(datanim, "M");
  //   controller.myqrortu(datanim, "O");
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    Map data = box.read("dataUser") as Map<String, dynamic>;
    datanim = data['nim'];
    return Obx(
      () => c.isLoading.isTrue
          ? Scaffold(
              appBar: AppBar(
                backgroundColor: DataColors.white,
                elevation: 0,
                centerTitle: true,
                title: Padding(
                  padding: EdgeInsets.only(top: 0.sp),
                  child: Text(
                    "Wisuda",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: DataColors.primary800),
                  ),
                ),
                leading: Padding(
                  padding: EdgeInsets.only(top: 0.sp),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: DataColors.primary800,
                    ),
                  ),
                ),
              ),
              body: Center(
                  child: LoadingAnimationWidget.fourRotatingDots(
                      color: DataColors.primary700, size: 40.sp)),
            )
          : Scaffold(
              appBar: AppBar(
                backgroundColor: DataColors.white,
                elevation: 0,
                centerTitle: true,
                title: Padding(
                  padding: EdgeInsets.only(top: 0.sp),
                  child: Text(
                    "Wisuda",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: DataColors.primary800),
                  ),
                ),
                leading: Padding(
                  padding: EdgeInsets.only(top: 0.sp),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: DataColors.primary800,
                    ),
                  ),
                ),
              ),
              body: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: 10.sp, right: 10.sp, top: 20.sp, bottom: 0.sp),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed(RoutName.lihatundagan, arguments: [c.downloadedFilePath, c.pathurlpdfmhs]);
                          },
                          child: Container(
                            padding: EdgeInsets.all(0.sp),
                            height: 100.sp,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.sp),
                                color: DataColors.bluesky),
                            child: Padding(
                              padding: EdgeInsets.only(right: 0.sp),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 12.sp,
                                        right: 10.sp,
                                        bottom: 0.sp),
                                    child: Image.asset(
                                      'assets/icon/invitation.png',
                                      height: 75.sp,
                                      width: 75.sp,
                                      color: DataColors.primary800,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 10.sp, left: 8.sp),
                                    child: Text(
                                      "Undangan Wisuda \nMahasiswa IIK STRADA",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: DataColors.primary800),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(RoutName.lihatundagan,
                          arguments: [c.downloadedFilePath2, c.pathurlpdfortu]);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 10.sp,
                        right: 10.sp,
                        top: 10.sp,
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(0.sp),
                            height: 100.sp,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.sp),
                                color: DataColors.bluesky),
                            child: Padding(
                              padding: EdgeInsets.only(right: 0.sp),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 12.sp,
                                        right: 10.sp,
                                        bottom: 0.sp),
                                    child: Image.asset(
                                      'assets/icon/invitation.png',
                                      height: 75.sp,
                                      width: 75.sp,
                                      color: DataColors.primary800,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 10.sp, left: 8.sp, top: 5.sp),
                                    child: Text(
                                      "Undangan Wisuda \nOrang Tua Mahasiswa \nIIK STRADA",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: DataColors.primary800),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  // Future<File> downloadFile(String url, String fileName) async {
  //   var httpClient = http.Client();
  //   var req = await httpClient.get(Uri.parse(url));
  //   var bytes = req.bodyBytes;
  //   String dir = (await getApplicationDocumentsDirectory()).path;
  //   File file = File('$dir/$fileName');
  //   await file.writeAsBytes(bytes);
  //   return file;
  // }

  // Future<void> _downloadFile(String url, String fileName) async {
  //   var httpClient = http.Client();
  //   var req = await httpClient.get(Uri.parse(url));
  //   var bytes = req.bodyBytes;

  //   // Get external storage directory
  //   String savePath = "/storage/emulated/0/Download";
  //   Directory? externalDir = await getExternalStorageDirectory();
  //   if (externalDir == null) {
  //     Fluttertoast.showToast(
  //       msg: "Gagal mendapatkan direktori penyimpanan eksternal",
  //       toastLength: Toast.LENGTH_SHORT,
  //     );
  //     return;
  //   }

  //   // Save file to external storage
  //   File file = File('$savePath/$fileName');
  //   await file.writeAsBytes(bytes);
  //   _downloadedFilePath = file.path;
  // }
}
