import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/controllers/profile/profile_c.dart';

import 'package:sizer/sizer.dart';

import '../../theme/color.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    final TextEditingController passwordlamaC = TextEditingController();
    final TextEditingController passbaruC = TextEditingController();
    final TextEditingController ulangipassbaruC = TextEditingController();
    ProfileController controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: CircleAvatar(
                radius: 40.sp,
                backgroundImage: NetworkImage(data[5]),
                backgroundColor: Colors.transparent,
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Text(
              "Nama",
              style: header(),
            ),
            SizedBox(
              height: 5.sp,
            ),
            Containerprofile(data[0]),
            SizedBox(
              height: 20.sp,
            ),
            Text(
              "Fakultas",
              style: header(),
            ),
            SizedBox(
              height: 5.sp,
            ),
            Containerprofile(data[1]),
            SizedBox(
              height: 20.sp,
            ),
            Text(
              "Program Studi",
              style: header(),
            ),
            SizedBox(
              height: 5.sp,
            ),
            Containerprofile(data[2]),
            SizedBox(
              height: 20.sp,
            ),
            Text(
              "Jenis Kelamin",
              style: header(),
            ),
            SizedBox(
              height: 5.sp,
            ),
            Containerprofile((data[3] == "L") ? "Laki-Laki" : "Perempuan"),
            SizedBox(
              height: 20.sp,
            ),
            Text(
              "Username",
              style: header(),
            ),
            SizedBox(
              height: 5.sp,
            ),
            Containerprofile(data[4]),
            SizedBox(
              height: 20.sp,
            ),
            Text(
              "Password Lama",
              style: header(),
            ),
            SizedBox(
              height: 5.sp,
            ),
            TextFormField(
              autocorrect: false,
              controller: passwordlamaC,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(14.0.sp),
                isDense: true,
                hintText: 'Masukkan password anda yg lama',
                hintStyle: TextStyle(
                  color: Colors.grey, // <-- Change this
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
            ),
            SizedBox(
              height: 20.sp,
            ),
            Text(
              "Password Baru",
              style: header(),
            ),
            SizedBox(
              height: 5.sp,
            ),
            TextFormField(
              autocorrect: false,
              controller: passbaruC,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(14.0.sp),
                isDense: true,
                hintText: 'Masukkan password anda yang baru',
                hintStyle: TextStyle(
                  color: Colors.grey, // <-- Change this
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
            ),
            SizedBox(
              height: 20.sp,
            ),
            Text(
              "Verifikasi Password",
              style: header(),
            ),
            SizedBox(
              height: 5.sp,
            ),
            TextFormField(
              autocorrect: false,
              controller: ulangipassbaruC,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(14.0.sp),
                isDense: true,
                hintText: 'Masukkan kembali password anda yang baru',
                hintStyle: TextStyle(
                  color: Colors.grey, // <-- Change this
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
            ),
            SizedBox(
              height: 10.sp,
            ),
            Center(
              child: Container(
                width: 90.w,
                margin: const EdgeInsets.only(bottom: 20, top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    controller.ganti_password(
                        data[6],
                        data[4],
                        data[4],
                        passwordlamaC.text,
                        passbaruC.text,
                        ulangipassbaruC.text);
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
                    padding: EdgeInsets.symmetric(
                        vertical: 10.sp, horizontal: 10.sp),
                  ),
                  child: const Text(
                    'Simpan',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
          ]),
        ),
      ),
    );
  }

  Container Containerprofile(String content) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
        width: 90.w,
        decoration: BoxDecoration(
            color: DataColors.Neutral100,
            borderRadius: BorderRadius.circular(8.sp)),
        child: Text(
          content,
          style: TextStyle(fontSize: 11.sp, color: DataColors.Neutral400),
        ));
  }

  TextStyle header() =>
      TextStyle(color: DataColors.primary700, fontSize: 12.sp);
}
