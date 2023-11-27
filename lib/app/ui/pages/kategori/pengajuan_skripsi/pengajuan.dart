import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/pengajuan_skripsi_c.dart';
import 'package:gostradav1/app/ui/pages/kategori/pengajuan_skripsi/listdospem.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:iconify_flutter/icons/ri.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sizer/sizer.dart';

import '../../../theme/color.dart';

class PengajuanSkripsiPage extends StatelessWidget {
  SkripsiController controller = Get.put(SkripsiController());
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  TextEditingController txt3 = TextEditingController();
  TextEditingController txt4 = TextEditingController();

  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pengajuan Judul Skripsi',
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 7.5.w, vertical: 1.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Judul 1",
                      style: TextStyle(
                          color: DataColors.primary600,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 2.sp,
                    ),
                    TextFormField(
                      autocorrect: false,
                      controller: txt1,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(14.0.sp),
                        isDense: true,
                        hintStyle: TextStyle(
                          color: Colors.grey, // <-- Change this
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: DataColors.primary, width: 1.0),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Text("Judul 2",
                        style: TextStyle(
                            color: DataColors.primary600,
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 2.sp,
                    ),
                    TextFormField(
                      autocorrect: false,
                      controller: txt2,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(14.0.sp),
                        isDense: true,
                        hintStyle: TextStyle(
                          color: Colors.grey, // <-- Change this
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: DataColors.primary, width: 1.0),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Text("Judul 3",
                        style: TextStyle(
                            color: DataColors.primary600,
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 2.sp,
                    ),
                    TextFormField(
                      autocorrect: false,
                      controller: txt3,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(14.0.sp),
                        isDense: true,
                        hintStyle: TextStyle(
                          color: Colors.grey, // <-- Change this
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: DataColors.primary, width: 1.0),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Text("Alasan Pengambilan Judul",
                        style: TextStyle(
                            color: DataColors.primary600,
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 2.sp,
                    ),
                    TextFormField(
                      autocorrect: false,
                      controller: txt4,
                      maxLines: 3,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(14.0.sp),
                        isDense: true,
                        hintStyle: TextStyle(
                          color: Colors.grey, // <-- Change this
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: DataColors.primary, width: 1.0),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                      ),
                    ),
                    // end form nim
                    SizedBox(
                      height: 25.sp,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(ListDospemPage());
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: DataColors.Neutral100,
                        ),
                        child: Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.pilih.value,
                                  style:
                                      TextStyle(color: DataColors.Neutral400),
                                ),
                                Iconify(Ri.arrow_drop_down_line)
                              ],
                            )),
                      ),
                    ),
                  ],
                )),
          ),
          Container(
            width: 90.w,
            margin: EdgeInsets.only(bottom: 40.sp),
            child: ElevatedButton(
              onPressed: () {
                if (txt1.text != "" && controller.id_dosen.value != "") {
                  controller.sendpengajuan(
                      data["nim"], txt1.text, txt2.text, txt3.text, txt4.text);
                } else {
                  Get.snackbar('Hi', 'Harap isi judul 1 dan dosen pembimbing');
                }
              },
              style: ElevatedButton.styleFrom(
                side: BorderSide(
                  width: 2.0,
                  color: DataColors.primary,
                ),
                primary: DataColors.primary, // background
                onPrimary: Colors.white, // foreground
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
                padding:
                    EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
              ),
              child: const Text(
                'Ajukan',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
