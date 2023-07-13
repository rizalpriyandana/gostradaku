// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:gostradav1/app/controllers/auth/auth_c.dart';
import 'package:gostradav1/app/ui/pages/login/lupapassword.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatelessWidget {
  final c = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 5.h,
          ),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                    image: AssetImage('assets/images/logo/iikstrada.png')),

                SizedBox(
                  height: 40.sp,
                ),

                Container(
                  child: Text(
                    'Silahkan Login',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                SizedBox(
                  height: 30.sp,
                ),

                // form nim
                TextFormField(
                  autocorrect: false,
                  controller: c.nimC,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(14.0.sp),
                    isDense: true,
                    hintText: 'Nomor Induk Mahasiswa (NIM)',
                    hintStyle: TextStyle(
                      color: Colors.grey, // <-- Change this
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                          color: DataColors.semigrey, width: 1.0),
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                  ),
                ),
                // end form nim
                SizedBox(
                  height: 25.sp,
                ),

                // form password

                TextFormField(
                  autocorrect: false,
                  obscureText: c.isVisible.value,
                  controller: c.passC,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(14.0),
                    isDense: true,
                    hintText: 'Kata Sandi',
                    hintStyle: TextStyle(
                      color: Colors.grey, // <-- Change this
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                    suffixIcon: IconButton(
                        color: Colors.grey,
                        splashRadius: 1,
                        icon: Icon(c.isVisible.value == false
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        onPressed: () {
                          c.isVisible.toggle();
                        }),
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                          color: DataColors.semigrey, width: 1.0),
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                  ),
                ),

                //end form password

                SizedBox(
                  height: 10.sp,
                ),
                // error message
                Visibility(
                  visible: c.errorMsg.value,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "*Username atau password salah ",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                // end forgot password

                // Forgont password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      Get.to(LupaPasswordPage());
                    },
                    child: const Text(
                      "Lupa Kata Sandi?",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                // end forgot password

                SizedBox(
                  height: 40.sp,
                ),

                // button login
                SizedBox(
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: () => c.login(c.nimC.text, c.passC.text),
                    style: ElevatedButton.styleFrom(
                      primary: DataColors.primary,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(14.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: c.isLoading.isTrue
                          ? const SizedBox(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : const Text(
                              'Masuk',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                    ),
                  ),
                )
                // end button login
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
