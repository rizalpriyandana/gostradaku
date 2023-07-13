import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/nonakademik/softskill/softskill_c.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:sizer/sizer.dart';

class WisudaPage extends StatefulWidget {
  @override
  State<WisudaPage> createState() => _WisudaPageState();
}

class _WisudaPageState extends State<WisudaPage> {
  SoftSkillController controller = Get.find<SoftSkillController>();
  final box = GetStorage();
  String? _downloadedFilePath;

  @override
  Widget build(BuildContext context) {
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DataColors.white,
        elevation: 0,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 15.sp),
          child: Text(
            "Wisuda",
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: DataColors.primary800),
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(top: 13.sp),
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
      body: FutureBuilder(
          future: controller.myqr(data['nim'], "M"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Tampilkan widget loading atau indikator lainnya
              return Center(
                child: CircularProgressIndicator(
                  color: DataColors.primary700,
                ),
              );
            } else if (controller.pathurlpdf.isNotEmpty) {
              return FutureBuilder(
                future: _downloadFile(controller.pathurlpdf, "my_pdf_file.pdf"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Tampilkan widget loading atau indikator lainnya
                    return Center(
                      child: CircularProgressIndicator(
                        color: DataColors.primary700,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    // Tampilkan pesan kesalahan jika terjadi error saat mengunduh
                    return Text("Gagal mengunduh file");
                  } else {
                    // Dapatkan hasil dari _downloadFile

                    if (_downloadedFilePath != null) {
                      // Tampilkan UI dengan menggunakan downloadedFilePath
                      return Padding(
                        padding: EdgeInsets.only(bottom: 130.sp),
                        child: Column(
                          children: [
                            Container(
                              height: 250.sp,
                              width: double.infinity,
                              padding: EdgeInsets.all(15.sp),
                              child: PDFView(filePath: _downloadedFilePath!),
                            ),
                            Text("data")
                          ],
                        ),
                      );
                    } else {
                      // Tampilkan pesan kesalahan jika downloadedFilePath null
                      return Text("Gagal mengunduh file pdf");
                    }
                  }
                },
              );
            } else {
              // Snapshot tidak memiliki data, tampilkan pesan kesalahan
              return Text("Gagal mendapatkan data");
            }
          }),
    );
  }

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
    _downloadedFilePath = file.path;
  }
}
