import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/ui/pages/library/detailpeminjaman.dart';
import 'package:gostradav1/app/ui/pages/library/library.dart';
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
  TextEditingController labelbook = TextEditingController();
  TextEditingController kategoribook = TextEditingController();

  final FocusNode dateBorrowFocus = FocusNode();

  var dataku = Get.arguments;

  @override
  void initState() {
    namebook.text = dataku[0];
    labelbook.text = dataku[2];
    kategoribook.text = dataku[1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: DataColors.white,
        centerTitle: true,
        title: Text(
          "Form Peminjaman",
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
            Text(
              "Nama Buku",
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
              controller: namebook,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.sp),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: DataColors.Neutral100),
                    borderRadius: BorderRadius.circular(8.sp)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: DataColors.Neutral100),
                    borderRadius: BorderRadius.circular(8.sp)),
                labelStyle:
                    TextStyle(fontSize: 10.sp, fontWeight: FontWeight.normal),
                isDense: true,
                filled: true,
                fillColor: DataColors.Neutral100,
                border: OutlineInputBorder(
                  // borderSide:
                  //     BorderSide(color: DataColors.Neutral100, width: 1.0),
                  borderRadius: BorderRadius.circular(8.sp),
                ),
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Text(
              "Kategori Buku",
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
              controller: kategoribook,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.sp),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: DataColors.Neutral100),
                    borderRadius: BorderRadius.circular(8.sp)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: DataColors.Neutral100),
                    borderRadius: BorderRadius.circular(8.sp)),
                labelStyle:
                    TextStyle(fontSize: 10.sp, fontWeight: FontWeight.normal),
                isDense: true,
                filled: true,
                fillColor: DataColors.Neutral100,
                border: OutlineInputBorder(
                  // borderSide:
                  //     BorderSide(color: DataColors.semigrey, width: 1.0),
                  borderRadius: BorderRadius.circular(8.sp),
                ),
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Text(
              "Nomor Label Buku",
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
              controller: labelbook,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.sp),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: DataColors.Neutral100),
                    borderRadius: BorderRadius.circular(8.sp)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: DataColors.Neutral100),
                    borderRadius: BorderRadius.circular(8.sp)),
                isDense: true,
                filled: true,
                fillColor: DataColors.Neutral100,
                border: OutlineInputBorder(
                  // borderSide:
                  //     BorderSide(color: DataColors.semigrey, width: 1.0),
                  borderRadius: BorderRadius.circular(8.sp),
                ),
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Text(
              "Tanggal Peminjaman",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: DataColors.primary700),
            ),
            SizedBox(
              height: 5.sp,
            ),
            TextFormField(
              focusNode: dateBorrowFocus,
              readOnly: true,
              autocorrect: false,
              controller: dateborrow,
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
                  borderRadius: BorderRadius.circular(8.sp),
                ),
              ),
              textInputAction: TextInputAction.done,
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  dateborrow.text =
                      DateFormat('dd-MM-yyyy').format(picked).toString();
                  DateTime returnDate = picked.add(const Duration(days: 7));
                  datereturn.text = DateFormat('dd-MM-yyy').format(returnDate);
                  FocusScope.of(context).requestFocus(FocusNode());
                }
              },
            ),
            SizedBox(
              height: 10.sp,
            ),
            Text(
              "Tanggal Pengembalian",
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
              controller: datereturn,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.sp),
                isDense: true,
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: DataColors.semigrey, width: 1.0),
                  borderRadius: BorderRadius.circular(8.sp),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: DataColors.semigrey, width: 1.0),
                    borderRadius: BorderRadius.circular(8.sp)),
              ),
              textInputAction: TextInputAction.done,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        margin: EdgeInsets.only(bottom: 10.sp, top: 2.sp),
        child: ElevatedButton(
            onPressed: () {
              if (dateborrow.text.isNotEmpty) {
                Get.to(DetailPeminjamanBuku(), arguments: [
                  dataku[0],
                  dataku[1],
                  dataku[2],
                  dateborrow.text,
                  datereturn.text
                ]);

                Get.snackbar("Success", "Data Peminjaman Berhasil disimpan");
              } else {
                Get.snackbar("Galat", "Silahkan lengkapi formulir");
              }
            },
            style: ElevatedButton.styleFrom(
                side: BorderSide(width: 2.0, color: DataColors.primary),
                backgroundColor: DataColors.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.sp)),
                padding:
                    EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp)),
            child: Text(
              "Simpan Data",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: DataColors.white),
            )),
      ),
    );
  }
}
