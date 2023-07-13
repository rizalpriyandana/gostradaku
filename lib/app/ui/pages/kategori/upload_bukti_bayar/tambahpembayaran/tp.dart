import 'dart:io';

import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/uploadbuktip_c.dart';
import 'package:gostradav1/app/routes/rout_name.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../../../theme/color.dart';

class TambahPembayaranPage extends StatefulWidget {
  @override
  State<TambahPembayaranPage> createState() => _TambahPembayaranPageState();
}

class _TambahPembayaranPageState extends State<TambahPembayaranPage> {
  dispose() {
    controller.txt.clear();
    super.dispose();
  }

  TextEditingController txt = TextEditingController();
  final box = GetStorage();
  UploadBuktiController controller = Get.put(UploadBuktiController());
  String? selectedidperiode;
  String? selectedValue1;
  String? selec;
  String? selecc;
  int? jumlah;
  String selectedValue2 = "text";
  var index;
  @override
  Widget build(BuildContext context) {
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form Data',
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
      body: SafeArea(
        child: FutureBuilder<dynamic>(
            future: controller.GetTP(data['nim']),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Periode"),
                          SizedBox(
                            height: 5.sp,
                          ),
                          Center(
                            child: CustomDropdownButton2(
                              buttonDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.sp),
                                  color: HexColor("#F3F3F3")),
                              buttonWidth: 90.w,
                              dropdownWidth: 90.w,
                              hint: '',
                              dropdownItems: controller.periode,
                              value: selectedValue1,
                              onChanged: (value) {
                                setState(() {
                                  index = controller.periode.indexOf(value!);

                                  selectedValue1 = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          const Text("Kode Transaksi"),
                          Center(
                            child: CustomDropdownButton2(
                              buttonDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.sp),
                                  color: HexColor("#F3F3F3")),
                              buttonWidth: 90.w,
                              dropdownWidth: 90.w,
                              hint: '',
                              dropdownItems: controller.kode,
                              value: selec,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue2 = value as String;
                                  selec = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          const Text("Nominal"),
                          SizedBox(
                            height: 5.sp,
                          ),
                          FutureBuilder<dynamic>(
                              future: controller.getnominal(selectedValue2),
                              builder: (context, snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting:
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  default:
                                    if (snapshot.hasData) {
                                      jumlah = snapshot.data.total;
                                      return TextField(
                                        controller: controller.txt,
                                        decoration: InputDecoration(
                                          enabled: false,
                                          filled: true,
                                          fillColor: HexColor("#F3F3F3"),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.sp),
                                            borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 2.0),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return TextField(
                                        controller: controller.txt,
                                        decoration: InputDecoration(
                                          enabled: false,
                                          filled: true,
                                          fillColor: HexColor("#F3F3F3"),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.sp),
                                            borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 2.0),
                                          ),
                                        ),
                                      );
                                    }
                                }
                              }),
                          SizedBox(
                            height: 10.sp,
                          ),
                          const Text("Catatan"),
                          SizedBox(
                            height: 5.sp,
                          ),
                          TextField(
                            maxLines: 3,
                            controller: txt,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: HexColor("#F3F3F3"),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.sp),
                                borderSide: const BorderSide(
                                    color: Colors.transparent, width: 2.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          const Text("Bukti Bayar"),
                          SizedBox(
                            height: 5.sp,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                pickImage();
                              },
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.sp, horizontal: 10.sp),
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.sp),
                                      color: Colors.white,
                                      border: Border.all(
                                          color: DataColors.primary)),
                                  child: Center(
                                      child: Text(
                                    (image != null)
                                        ? "Ganti File"
                                        : "Pilih File",
                                    style: TextStyle(
                                        color: DataColors.primary,
                                        fontWeight: FontWeight.w700),
                                  ))),
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          (image == null)
                              ? Text("")
                              : Center(
                                  child: Container(
                                      child: Image.file(
                                    image!,
                                    fit: BoxFit.cover,
                                  )),
                                ),
                        ],
                      ),
                    );
                  } else {
                    return SizedBox(
                      width: 100.w,
                      height: 100.h,
                      child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(
                                    "assets/images/datatidakada.png"),
                                height: 100.sp,
                              ),
                              Text(
                                "Buat Tagihan Terlebih Dahulu",
                                style: TextStyle(color: DataColors.Neutral300),
                              ),
                            ],
                          )),
                    );
                  }
              }
            }),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        margin: const EdgeInsets.only(bottom: 20),
        child: ElevatedButton(
          onPressed: () {
            if (image != null && jumlah != null) {
              controller.postbukti(
                  image,
                  data['nim'],
                  controller.idperiode[index],
                  selectedValue2,
                  jumlah.toString(),
                  txt.text);
              Get.offAllNamed(RoutName.root);
            } else {
              Get.snackbar('Go Strada', 'Mohon Lengkapi Formulir');
            }
          },
          style: ElevatedButton.styleFrom(
            primary: DataColors.primary, // background
            onPrimary: Colors.white, // foreground
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
          ),
          child: const Text(
            'Simpan Data',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }

  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {}
  }
}
