// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/routes/rout_name.dart';

//import 'package:gostradav2/app/data/models/softskill/softskill_m.dart';
import 'package:gostradav1/app/ui/pages/kategori/nonakademik/softskill/inputsoftskill.dart';
import 'package:gostradav1/app/ui/theme/color.dart';

import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

import '../../../../../controllers/nonakademik/softskill/softskill_c.dart';

class SoftSkillPage extends StatefulWidget {
  @override
  State<SoftSkillPage> createState() => _SoftSkillPageState();
}

class _SoftSkillPageState extends State<SoftSkillPage> {
  SoftSkillController controller = Get.find<SoftSkillController>();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    Map data = box.read("dataUser") as Map<String, dynamic>;
    // Map datas = box.read("dataSoftSkill") as Map<String, dynamic>;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 40),
        child: AppBar(
          title: Text(
            "Soft Skill",
            style: TextStyle(
                color: DataColors.primary700, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: DataColors.primary700,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Get.toNamed(RoutName.kategorinonakademik);
                },
              );
            },
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder(
          future: controller.listdata(data['nim']),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: DataColors.primary700,
                ),
              );
            } else {
              return Obx(
                () {
                  if (controller.softskilllist.isEmpty) {
                    return Center(
                      child: SizedBox(
                        width: 100.w,
                        height: 20.h,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: const AssetImage(
                                  'assets/images/datatidakada.png'),
                              height: 110.sp,
                            ),
                            Text(
                              "Belum Ada Data",
                              style: TextStyle(color: DataColors.Neutral300),
                            )
                          ],
                        ),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: controller.softskilllist.length,
                      itemBuilder: (context, index) {
                        final datum = controller.softskilllist[index];
                        return ListData(
                            name: datum.data![0].name,
                            periode: datum.data![0].periode,
                            nilaiA: datum.data![0].nilaiAngka,
                            nilaiH: datum.data![0].nilaiHuruf,
                            catatan: datum.data![0].note,
                            onTapEdit: () {
                              Get.toNamed(RoutName.editsoftskill, arguments: [
                                datum.data![0].id,
                                datum.data![0].idPeriode,
                                datum.data![0].name,
                                datum.data![0].periode,
                                datum.data![0].nilaiAngka,
                                datum.data![0].nilaiHuruf,
                                datum.data![0].note,
                                datum.data![0].date.toIso8601String(),
                                datum.data![0].file
                              ]);
                              
                            },
                            onTapHapus: () {
                              Get.defaultDialog(
                                  onConfirm: () =>
                                      controller.delete(datum.data![0].id),
                                  onCancel: () => dispose(),
                                  middleText:
                                      "Apakah anda yakin ingin hapus data?");
                            },
                            onTapLihat: () {
                              if (datum.data![0].file.endsWith('.pdf')) {
                                final fileName =
                                    path.basename(datum.data![0].file);
                                _downloadFile(datum.data![0].file, fileName);
                              } else if (datum.data![0].file.endsWith('.jpg') ||
                                  datum.data![0].file.endsWith('.jpeg') ||
                                  datum.data![0].file.endsWith('.png')) {
                                Get.to(() => Scaffold(
                                      appBar: PreferredSize(
                                        preferredSize: const Size(0, 40),
                                        child: AppBar(
                                          title: Text(
                                            "Lihat Dokumen",
                                            style: TextStyle(
                                                color: DataColors.primary700,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          centerTitle: true,
                                          elevation: 0,
                                          backgroundColor: Colors.white,
                                          foregroundColor:
                                              DataColors.primary700,
                                          leading: Builder(
                                            builder: (BuildContext context) {
                                              return IconButton(
                                                icon: const Icon(
                                                    Icons.arrow_back_ios),
                                                onPressed: () {
                                                  Get.back();
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      body: Padding(
                                        padding: EdgeInsets.all(20.sp),
                                        child: Center(
                                          child: Image.network(
                                              datum.data![0].file),
                                        ),
                                      ),
                                    ));
                              }
                            },
                            status: datum.data![0].labelStatus,
                            statusNote: datum.data![0].noteStatus,
                            admin: datum.data![0].admin,
                            fileUrl: datum.data![0].file,
                            date: datum.data![0].date);
                      },
                    );
                  }
                },
              );
            }
          },
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        margin: EdgeInsets.only(bottom: 10.sp, top: 2.sp),
        color: Colors.transparent,
        child: ElevatedButton(
          onPressed: () {
            Get.to(InputSoftSkillPage());
          },
          style: ElevatedButton.styleFrom(
            side: BorderSide(width: 2.0, color: DataColors.primary),
            backgroundColor: Colors.white,
            foregroundColor: DataColors.primary700,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
          ),
          child: const Text(
            "Tambah Data",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

class ListData extends StatelessWidget {
  SoftSkillController controller = Get.find<SoftSkillController>();
  final box = GetStorage();

  final String name;
  dynamic periode;
  dynamic nilaiA;
  dynamic nilaiH;
  final DateTime date;
  final String catatan;
  final String status;
  final String statusNote;
  final String admin;
  final VoidCallback onTapEdit;
  final VoidCallback onTapHapus;
  final VoidCallback onTapLihat;
  final String? fileUrl;

  ListData({
    Key? key,
    required this.name,
    required this.periode,
    required this.nilaiA,
    required this.nilaiH,
    required this.catatan,
    required this.status,
    required this.statusNote,
    required this.admin,
    required this.date,
    required this.onTapEdit,
    required this.onTapHapus,
    required this.onTapLihat,
    required this.fileUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Map datas = box.read("dataSoftSkill") as Map<String, dynamic>;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: DataColors.primary800, width: 1.5),
          color: DataColors.primary200,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('dd MMMM yyyy').format(date),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: DataColors.primary800,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      (periode != null)
                          ? Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: DataColors.primary700,
                              ),
                              child: Text(
                                periode.toString(),
                                style: TextStyle(
                                  color: DataColors.blusky,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          : Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: DataColors.primary700,
                              ),
                              child: Text(
                                "-",
                                style: TextStyle(
                                  color: DataColors.blusky,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                      SizedBox(
                        width: 5.sp,
                      ),
                      (status == "Disetujui")
                          ? Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: DataColors.primary700,
                              ),
                              child: Text(
                                status,
                                style: TextStyle(
                                  color: DataColors.blusky,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          : Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: DataColors.Neutral200,
                              ),
                              child: Text(
                                status,
                                style: TextStyle(
                                    color: DataColors.primary,
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                      const SizedBox(
                        width: 5,
                      ),
                      status == "Disetujui"
                          ? Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: DataColors.primary700,
                              ),
                              child: Text(
                                "Oleh : $admin",
                                style: TextStyle(
                                  color: DataColors.blusky,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  status == "Pengajuan"
                      ? InkWell(
                          onTap: () {
                            onTapEdit();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.sp),
                              border: Border.all(
                                  color: DataColors.primary, width: 1.sp),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 2.sp, horizontal: 4.sp),
                            child: Text(
                              "Edit",
                              style: TextStyle(
                                  color: DataColors.primary, fontSize: 10.sp),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  const SizedBox(
                    width: 8,
                  ),
                  status == "Pengajuan"
                      ? InkWell(
                          onTap: () {
                            onTapHapus();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.sp),
                              border: Border.all(
                                  color: Colors.redAccent, width: 1.sp),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 2.sp, horizontal: 4.sp),
                            child: Text(
                              "Hapus",
                              style: TextStyle(
                                  color: Colors.redAccent, fontSize: 10.sp),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Divider(
            height: 5,
            thickness: 2,
            indent: 0,
            endIndent: 0,
            color: DataColors.primary700,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: TextStyle(
                color: DataColors.primary800,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600),
          ),
          Text(
            catatan,
            style: TextStyle(
                color: DataColors.primary,
                fontSize: 12.sp,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 5.sp,
          ),
          Row(
            children: [
              nilaiA != null
                  ? Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: DataColors.primary800),
                      child: Text(
                        "Nilai Angka : $nilaiA".toString(),
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: DataColors.skyBlue,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: DataColors.primary800),
                      child: Text(
                        "Nilai Angka : 0",
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: DataColors.skyBlue,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
              SizedBox(
                width: 5.sp,
              ),
              nilaiH != null
                  ? Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: DataColors.primary800),
                      child: Text(
                        "Nilai Huruf : $nilaiH".toString(),
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: DataColors.skyBlue,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: DataColors.primary800),
                      child: Text(
                        "Nlai Huruf : -",
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: DataColors.skyBlue,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
            ],
          ),
          SizedBox(
            height: 5.sp,
          ),
          status == "Disetujui"
              ? Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: DataColors.primary800),
                  child: Text(
                    "Catatan Admin : $statusNote",
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: DataColors.skyBlue,
                        fontWeight: FontWeight.w600),
                  ),
                )
              : const SizedBox.shrink(),
          SizedBox(
            height: 5.sp,
          ),
          Divider(
            height: 5,
            thickness: 2,
            indent: 0,
            endIndent: 0,
            color: DataColors.primary700,
          ),
          SizedBox(
            height: 5.sp,
          ),
          InkWell(
            onTap: () {
              onTapLihat();
              // if (fileUrl!.endsWith('.pdf')) {
              //     Get.to(PDFView(
              //       filePath: fileUrl,
              //     ));
              //   } else if (fileUrl!.endsWith('.jpg') ||
              //       fileUrl!.endsWith('.jpeg') ||
              //       fileUrl!.endsWith('.png')) {
              //     Get.to(() => Scaffold(
              //           appBar: PreferredSize(
              //             preferredSize: const Size(0, 40),
              //             child: AppBar(
              //               title: Text(
              //                 "Lihat Dokumen",
              //                 style: TextStyle(
              //                     color: DataColors.primary700,
              //                     fontWeight: FontWeight.w600),
              //               ),
              //               centerTitle: true,
              //               elevation: 0,
              //               backgroundColor: Colors.white,
              //               foregroundColor: DataColors.primary700,
              //               leading: Builder(
              //                 builder: (BuildContext context) {
              //                   return IconButton(
              //                     icon: const Icon(Icons.arrow_back_ios),
              //                     onPressed: () {
              //                       Get.back();
              //                     },
              //                   );
              //                 },
              //               ),
              //             ),
              //           ),
              //           body: Padding(
              //             padding: EdgeInsets.all(20.sp),
              //             child: Center(
              //               child: Image.network(fileUrl!),
              //             ),
              //           ),
              //         ));
              //   }
            },
            child: Container(
              width: 115.sp,
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: DataColors.primary800),
              child: Row(
                children: [
                  Icon(
                    Icons.remove_red_eye,
                    color: DataColors.skyBlue,
                    size: 14.sp,
                  ),
                  SizedBox(
                    width: 5.sp,
                  ),
                  Text(
                    "Lihat Dokumen",
                    style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: DataColors.skyBlue),
                  )
                ],
              ),
            ),
          ),
          // ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //       side: BorderSide(width: 2.0, color: DataColors.primary),
          //       backgroundColor: DataColors.primary800,
          //       //foregroundColor: DataColors.skyBlue,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(4.0),
          //       ),
          //       padding:
          //           EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
          //     ),
          //     onPressed: () {
          //       if (fileUrl!.endsWith('.pdf')) {
          //         Get.to(PDFView(
          //           filePath: fileUrl,
          //         ));
          //       } else if (fileUrl!.endsWith('.jpg') ||
          //           fileUrl!.endsWith('.jpeg') ||
          //           fileUrl!.endsWith('.png')) {
          //         Get.to(() => Scaffold(
          //               appBar: PreferredSize(
          //                 preferredSize: const Size(0, 40),
          //                 child: AppBar(
          //                   title: Text(
          //                     "Lihat Dokumen",
          //                     style: TextStyle(
          //                         color: DataColors.skyBlue,
          //                         fontWeight: FontWeight.w600),
          //                   ),
          //                   centerTitle: true,
          //                   elevation: 0,
          //                   backgroundColor: Colors.white,
          //                   foregroundColor: DataColors.primary700,
          //                   leading: Builder(
          //                     builder: (BuildContext context) {
          //                       return IconButton(
          //                         icon: const Icon(Icons.arrow_back_ios),
          //                         onPressed: () {
          //                           Get.back();
          //                         },
          //                       );
          //                     },
          //                   ),
          //                 ),
          //               ),
          //               body: Center(  
          //                 child: Image.network(fileUrl!),
          //               ),
          //             ));
          //       }
          //     },
          //     child: Text(
          //       "Lihat Dokumen",
          //       style: TextStyle(fontSize: 10.sp, color: DataColors.primary600),
          //     ))
        ]),
      ),
    );
  }
}

// Future<File> downloadFile(String url, String fileName) async {
//   var httpClient = http.Client();
//   var req = await httpClient.get(Uri.parse(url));
//   var bytes = req.bodyBytes;
//   String dir = (await getExternalStorageDirectory())!.path;
//   File file = File('$dir/$fileName');
//   await file.writeAsBytes(bytes);
//   return file;
// }
Future<File> downloadFile(String url, String fileName) async {
  var httpClient = http.Client();
  var req = await httpClient.get(Uri.parse(url));
  var bytes = req.bodyBytes;
  String dir = (await getApplicationDocumentsDirectory()).path;
  File file = File('$dir/$fileName');
  await file.writeAsBytes(bytes);
  return file;
}

Future<void> _downloadFile(String url, String fileName) async {
  var httpClient = http.Client();
  var req = await httpClient.get(Uri.parse(url));
  var bytes = req.bodyBytes;

  // Get external storage directory
  String savePath = "/storage/emulated/0/Download";
  Directory? externalDir = await getExternalStorageDirectory();
  if (externalDir == null) {
    Fluttertoast.showToast(
      msg: "Gagal mendapatkan direktori penyimpanan eksternal",
      toastLength: Toast.LENGTH_SHORT,
    );
    return;
  }

  // Save file to external storage
  File file = File('$savePath/$fileName');
  await file.writeAsBytes(bytes);

  Get.snackbar(
      "File Berhasil didownload", "Directory $savePath$fileName");
  Get.to(Scaffold(
    appBar: PreferredSize(
      preferredSize: const Size(0, 40),
      child: AppBar(
        title: Text(
          "Lihat Dokumen",
          style: TextStyle(
              color: DataColors.primary700, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: DataColors.primary700,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Get.back();
              },
            );
          },
        ),
      ),
    ),
    body: Padding(
      padding: EdgeInsets.all(20.sp),
      child: Center(
          child: PDFView(
        filePath: file.path,
      )),
    ),
  ));

  // Fluttertoast.showToast(
  //   msg: "File berhasil didownload ke ${externalDir.path}/$fileName",
  //   toastLength: Toast.LENGTH_SHORT,
  // );
}
