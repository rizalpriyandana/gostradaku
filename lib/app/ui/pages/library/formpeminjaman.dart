import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/library/library_c.dart';
import 'package:gostradav1/app/ui/pages/library/detailpeminjaman.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class FormPeminjaman extends StatefulWidget {
  @override
  State<FormPeminjaman> createState() => _FormPeminjamanState();
}

class _FormPeminjamanState extends State<FormPeminjaman> {
  TextEditingController dateborrow = TextEditingController();
  TextEditingController datereturn = TextEditingController();
  TextEditingController namebook = TextEditingController();
  TextEditingController itemcodeku = TextEditingController();
  TextEditingController kategoribook = TextEditingController();
  LibraryController lc = Get.find<LibraryController>();

  final FocusNode dateBorrowFocus = FocusNode();

  List<String> availableItem = Get.arguments[0];
  String? selectedValue;
  var dataku = Get.arguments;
  List<String> itemcode = [];
  bool isDropdown = false;
  final box = GetStorage();
  var index;

  @override
  void initState() {
    DateTime currentDate = DateTime.now();
    dateborrow.text = DateFormat('dd-MM-yyyy').format(currentDate);
    DateTime returnDate = currentDate.add(const Duration(days: 7));
    datereturn.text = DateFormat('dd-MM-yyyy').format(returnDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map data = box.read("dataUser") as Map<String, dynamic>;
    itemcodeku.text = availableItem[0];
    Widget widget;
    if (availableItem.length == 1) {
      isDropdown = false;
    } else {
      isDropdown = true;
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: DataColors.white,
        centerTitle: true,
        title: Text(
          "Form Booking",
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: DataColors.primary700),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: DataColors.primary700,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isDropdown
                ? widget = Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(
                          "Exemplar",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: DataColors.primary700),
                        ),
                        SizedBox(
                          height: 5.sp,
                        ),
                        CustomDropdownButton2(
                          buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.sp),
                              border: Border.all(
                                  color: DataColors.Neutral200, width: 1.5)),
                          buttonWidth: 90.w,
                          buttonHeight: 6.h,
                          buttonPadding: EdgeInsets.all(10.sp),
                          dropdownWidth: 90.w,
                          hint: 'Pilih Exemplar',
                          value: selectedValue,
                          dropdownItems: availableItem
                              .map((String itemCode) => itemCode)
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                        ),
                      ])
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Exemplar",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: DataColors.primary700),
                      ),
                      SizedBox(
                        height: 5.sp,
                      ),
                      TextFormField(
                        readOnly: true,
                        autocorrect: false,
                        controller: itemcodeku,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10.sp),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: DataColors.Neutral100),
                              borderRadius: BorderRadius.circular(5.sp)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: DataColors.Neutral100),
                              borderRadius: BorderRadius.circular(5.sp)),
                          labelStyle: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.normal),
                          isDense: true,
                          filled: true,
                          fillColor: DataColors.Neutral100,
                          border: OutlineInputBorder(
                            // borderSide:
                            //     BorderSide(color: DataColors.Neutral100, width: 1.0),
                            borderRadius: BorderRadius.circular(5.sp),
                          ),
                        ),
                      )
                    ],
                  ),
            SizedBox(
              height: 10.sp,
            ),
            Text(
              "*Silahkan pilih eksemplar buku yang akan anda pinjam, jika anda tidak tahu atau lupa dengan eksemplar buku silahkan pilih yang mana saja",
              style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: DataColors.primary800),
            ),
            // SizedBox(
            //   height: 5.sp,
            // ),
            // TextFormField(
            //   readOnly: true,
            //   autocorrect: false,
            //   initialValue: Get.arguments[1],
            //   textInputAction: TextInputAction.done,
            //   keyboardType: TextInputType.text,
            //   decoration: InputDecoration(
            //     contentPadding: EdgeInsets.all(10.sp),
            //     focusedBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color: DataColors.Neutral100),
            //         borderRadius: BorderRadius.circular(8.sp)),
            //     enabledBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color: DataColors.Neutral100),
            //         borderRadius: BorderRadius.circular(8.sp)),
            //     labelStyle:
            //         TextStyle(fontSize: 10.sp, fontWeight: FontWeight.normal),
            //     isDense: true,
            //     filled: true,
            //     fillColor: DataColors.Neutral100,
            //     border: OutlineInputBorder(
            //       // borderSide:
            //       //     BorderSide(color: DataColors.semigrey, width: 1.0),
            //       borderRadius: BorderRadius.circular(8.sp),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 10.sp,
            // ),
            // Text(
            //   "Tanggal Peminjaman",
            //   style: TextStyle(
            //       fontSize: 12.sp,
            //       fontWeight: FontWeight.bold,
            //       color: DataColors.primary700),
            // ),
            // SizedBox(
            //   height: 5.sp,
            // ),
            // TextFormField(
            //   focusNode: dateBorrowFocus,
            //   readOnly: true,
            //   autocorrect: false,
            //   controller: dateborrow,
            //   decoration: InputDecoration(
            //     contentPadding: EdgeInsets.all(10.sp),
            //     focusedBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color: DataColors.Neutral100),
            //         borderRadius: BorderRadius.circular(8.sp)),
            //     enabledBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color: DataColors.Neutral100),
            //         borderRadius: BorderRadius.circular(8.sp)),
            //     labelStyle:
            //         TextStyle(fontSize: 10.sp, fontWeight: FontWeight.normal),
            //     isDense: true,
            //     filled: true,
            //     fillColor: DataColors.Neutral100,
            //     border: OutlineInputBorder(
            //       // borderSide:
            //       //     BorderSide(color: DataColors.Neutral100, width: 1.0),
            //       borderRadius: BorderRadius.circular(8.sp),
            //     ),
            //   ),
            //   textInputAction: TextInputAction.done,
            //   // onTap: () async {
            //   //   DateTime? picked = await showDatePicker(
            //   //     context: context,
            //   //     initialDate: DateTime.now(),
            //   //     firstDate: DateTime(1900),
            //   //     lastDate: DateTime(2100),
            //   //   );
            //   //   if (picked != null) {
            //   //     dateborrow.text =
            //   //         DateFormat('dd-MM-yyyy').format(picked).toString();
            //   //     DateTime returnDate = picked.add(const Duration(days: 7));
            //   //     datereturn.text = DateFormat('dd-MM-yyy').format(returnDate);
            //   //     FocusScope.of(context).requestFocus(FocusNode());
            //   //   }
            //   // },
            // ),
            // SizedBox(
            //   height: 10.sp,
            // ),
            // Text(
            //   "Tanggal Pengembalian",
            //   style: TextStyle(
            //       fontSize: 12.sp,
            //       fontWeight: FontWeight.bold,
            //       color: DataColors.primary700),
            // ),
            // SizedBox(
            //   height: 5.sp,
            // ),
            // TextFormField(
            //   readOnly: true,
            //   autocorrect: false,
            //   controller: datereturn,
            //   decoration: InputDecoration(
            //     contentPadding: EdgeInsets.all(10.sp),
            //     focusedBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color: DataColors.Neutral100),
            //         borderRadius: BorderRadius.circular(8.sp)),
            //     enabledBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color: DataColors.Neutral100),
            //         borderRadius: BorderRadius.circular(8.sp)),
            //     labelStyle:
            //         TextStyle(fontSize: 10.sp, fontWeight: FontWeight.normal),
            //     isDense: true,
            //     filled: true,
            //     fillColor: DataColors.Neutral100,
            //     border: OutlineInputBorder(
            //       // borderSide:
            //       //     BorderSide(color: DataColors.Neutral100, width: 1.0),
            //       borderRadius: BorderRadius.circular(8.sp),
            //     ),
            //   ),
            //   textInputAction: TextInputAction.done,
            // ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        margin: EdgeInsets.only(bottom: 10.sp, top: 2.sp),
        child: ElevatedButton(
            onPressed: () {
              // DateTime tanggalPinjam =
              //     DateFormat('dd-MM-yyyy').parse(dateborrow.text);
              // DateTime tanggalKembali =
              //     DateFormat('dd-MM-yyyy').parse(datereturn.text);
              // String tanggalpinjam =
              //     DateFormat('yyyy-MM-dd').format(tanggalPinjam);
              // String tanggalkembali =
              //     DateFormat('yyyy-MM-dd').format(tanggalKembali);

              if (isDropdown) {
                lc.addqueue(dataku[1], data['nim'], selectedValue.toString());
              } else {
                lc.addqueue(dataku[1], data['nim'], itemcodeku.text);
              }
            },
            style: ElevatedButton.styleFrom(
                side: BorderSide(width: 2.0, color: DataColors.primary),
                backgroundColor: DataColors.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.sp)),
                padding:
                    EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp)),
            child: Obx(
              () => lc.loadingdata.isTrue
                  ? const SizedBox(
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : Text(
                      "Simpan Data",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: DataColors.white),
                    ),
            )),
      ),
    );
  }
}
