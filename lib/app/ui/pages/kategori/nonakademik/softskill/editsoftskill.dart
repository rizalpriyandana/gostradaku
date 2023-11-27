import 'dart:io';

import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/nonakademik/softskill/softskill_c.dart';
import 'package:gostradav1/app/ui/global_widgets/dateformfield.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:sizer/sizer.dart';

class EditSoftSkillPage extends StatefulWidget {
  @override
  State<EditSoftSkillPage> createState() => _EditSoftSkillPageState();
}

class _EditSoftSkillPageState extends State<EditSoftSkillPage> {
  SoftSkillController controller = Get.find<SoftSkillController>();

  final DateTime _selectedDate = DateTime.now();
  TextEditingController dateinput = TextEditingController();
  TextEditingController namakegiatan = TextEditingController();
  TextEditingController catatan = TextEditingController();
  TextEditingController nilaiangka = TextEditingController();
  TextEditingController nilaihuruf = TextEditingController();
  String? selectedValue1;
  String? selectedidperiode;
  String selectedValue2 = "text";
  var index;
  final box = GetStorage();
  var datas = Get.arguments;

  @override
  void initState() {
    dateinput.text =
        DateFormat('dd-MM-yyyy').format(DateTime.parse(datas[7])).toString();
    namakegiatan.text = datas[2];
    catatan.text = datas[6];
    controller.filePath.value = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 50),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: DataColors.primary700,
          centerTitle: true,
          title: Text(
            "Soft Skill",
            style: TextStyle(
                color: DataColors.primary700, fontWeight: FontWeight.w600),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_ios));
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 12.sp, right: 12.sp, top: 15.sp),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: 15.sp,
                  // ),
                  // Align(
                  //   alignment: Alignment.topCenter,
                  //   child: Text(
                  //     "Input Soft Skill Mahasiswa",
                  //     style: TextStyle(
                  //         color: DataColors.primary700,
                  //         fontWeight: FontWeight.w700,
                  //         fontSize: 14.sp),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 30.sp,
                  // ),
                  Text(
                    "Periode",
                    style: TextStyle(
                        color: DataColors.primary700,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp),
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  FutureBuilder<dynamic>(
                    future: controller.getperiode(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return CustomDropdownButton2(
                          buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.sp),
                              border: Border.all(
                                  color: DataColors.semigrey, width: 1.5)),
                          buttonWidth: 90.w,
                          buttonHeight: 6.h,
                          buttonPadding: EdgeInsets.all(10.sp),
                          dropdownWidth: 90.w,
                          hint: 'Pilih Periode',
                          value: datas[3],
                          dropdownItems: controller.periode,
                          onChanged: (value) {
                            setState(() {
                              index = controller.periode.indexOf(value!);
                              selectedValue1 = value;
                            });
                          },
                        );
                      } else {
                        return const Text("Tidak ada data periode");
                      }
                    },
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  Text(
                    "Tanggal",
                    style: TextStyle(
                        color: DataColors.primary700,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp),
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  TextFormField(
                    readOnly: true,
                    autocorrect: false,
                    controller: dateinput,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.sp),
                      isDense: true,
                      hintText: 'Pilih Tanggal',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: DataColors.semigrey, width: 1.0),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                    onTap: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.parse(datas[7]),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) {
                        dateinput.text =
                            DateFormat('dd-MM-yyyy').format(picked).toString();
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                  //const DatePickerFormField(),
                  SizedBox(
                    height: 5.sp,
                  ),
                  Text(
                    "Nama Kegiatan",
                    style: TextStyle(
                        color: DataColors.primary700,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp),
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  TextFormField(
                    autocorrect: false,
                    controller: namakegiatan,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.sp),
                      isDense: true,
                      hintText: 'Nama Kegiatan',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: DataColors.semigrey, width: 1.0),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),

                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nilai Angka",
                            style: TextStyle(
                                color: DataColors.primary700,
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 5.sp,
                          ),
                          SizedBox(
                            //height: 68.sp,
                            width: 128.sp,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              autocorrect: false,
                              controller: nilaiangka,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10.sp),
                                isDense: true,
                                hintText: 'Input Nilai Angka',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: DataColors.semigrey, width: 1.0),
                                  borderRadius: BorderRadius.circular(14.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nilai Huruf",
                            style: TextStyle(
                                color: DataColors.primary700,
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 5.sp,
                          ),
                          SizedBox(
                            //height: 68.sp,
                            width: 128.sp,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              autocorrect: false,
                              controller: nilaihuruf,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10.sp),
                                isDense: true,
                                hintText: 'Input Nilai Huruf',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: DataColors.semigrey, width: 1.0),
                                  borderRadius: BorderRadius.circular(14.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  Text(
                    "Catatan",
                    style: TextStyle(
                        color: DataColors.primary700,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp),
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  TextFormField(
                    autocorrect: false,
                    controller: catatan,
                    maxLines: 5,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Catatan',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      contentPadding: EdgeInsets.all(10.sp),
                      isDense: true,
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: DataColors.semigrey, width: 1.0),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  Text(
                    "Piagam/Sertifikat",
                    style: TextStyle(
                        color: DataColors.primary700,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp),
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: DataColors.semigrey),
                    onPressed: () => addFiles(),
                    child: datas[8] != null
                        ? const Text(
                            "Change File",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          )
                        : const Text(
                            "Choose File",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 7.9.sp),
            child: Row(
              children: [
                datas[8] == null
                    ? const SizedBox.shrink()
                    : datas[8].endsWith('.pdf')
                        ? Padding(
                            padding: EdgeInsets.only(right: 8.sp),
                            child: Image.asset("assets/icon/pdf.png"),
                          )
                        : datas[8].endsWith('.jpg') ||
                                datas[8].endsWith('.png') ||
                                datas[8].endsWith('.jpeg')
                            ? Padding(
                                padding: EdgeInsets.only(right: 8.sp),
                                child: Image.asset("assets/images/image.png"),
                              )
                            : const SizedBox.shrink(),
                datas[8] == null
                    ? Padding(
                        padding: EdgeInsets.only(left: 3.sp),
                        child: Text(
                          "No chosen file",
                          style: TextStyle(
                              color: DataColors.primary600,
                              fontWeight: FontWeight.w700,
                              fontSize: 10.sp),
                        ),
                      )
                    : Text(
                        path.basename(datas[8]),
                        style: TextStyle(
                            color: DataColors.primary600,
                            fontWeight: FontWeight.w700,
                            fontSize: 10.sp),
                      ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.sp),
        margin: EdgeInsets.only(bottom: 10.sp, top: 2.sp),
        child: ElevatedButton(
          onPressed: () {
            String namaKegiatan = namakegiatan.text.trim();
            String tanggal = dateinput.text.trim();
            String note = catatan.text.trim();
            String nilaiA = nilaiangka.text.trim();
            String nilaiH = nilaihuruf.text.trim();

            if (namaKegiatan.isNotEmpty && index == null) {
              controller.updatedata(datas[0], data['nim'], datas[1].toString(),
                  namaKegiatan, tanggal, note, nilaiA, nilaiH, files);
            } else if (namaKegiatan.isNotEmpty && index != null) {
              controller.updatedata(
                  datas[0],
                  data['nim'],
                  controller.idperiode[index],
                  namaKegiatan,
                  tanggal,
                  note,
                  nilaiA,
                  nilaiH,
                  files);
            } else {
              Get.snackbar('Galat', 'Gagal mengupdate');
            }
          },
          style: ElevatedButton.styleFrom(
            side: BorderSide(width: 2.0, color: DataColors.primary),
            backgroundColor: DataColors.primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
          ),
          child: const Text(
            "Simpan Data",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }

  File? files;

  Future addFiles() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
      );
      if (result == null) return;
      final file = File(result.files.single.path!);
      setState(() => files = file);
    } catch (e) {
      // handle the exception accordingly
    }
  }
}
