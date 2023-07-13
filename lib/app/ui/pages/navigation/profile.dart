import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/auth/auth_c.dart';
import 'package:gostradav1/app/controllers/profile/profile_c.dart';
import 'package:gostradav1/app/ui/pages/edit_profile/edit_profile.dart';
import 'package:gostradav1/app/ui/theme/color.dart';

class ProfilePage extends StatelessWidget {
  final c = Get.find<AuthController>();
  final x = Get.put(ProfileController());
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    Map data = box.read("dataUser") as Map<String, dynamic>;
    final Size size = MediaQuery.of(context).size;
    var nimmahasiswa;
    return Obx(
      () => x.isLoading.isTrue
          ? Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(DataColors.primary700),
                ),
              ),
            )
          : Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: DataColors.primary700,
                  ),
                ),
                backgroundColor: Colors.white,
                foregroundColor: DataColors.primary700,
                elevation: 0,
                centerTitle: true,
              ),
              body: Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: 25, top: 80, bottom: 20),
                            margin: const EdgeInsets.only(top: 50),
                            width: size.width,
                            decoration: BoxDecoration(
                                color: DataColors.semigrey,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nama",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: DataColors.primary700,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    x.datalist[0].data![0].nama,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: DataColors.primary,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Nim",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: DataColors.primary700,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    x.datalist[0].data![0].nim,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: DataColors.primary,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Prodi",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: DataColors.primary700,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth: size.width / 1.5,
                                    ),
                                    child: AutoSizeText(
                                      x.datalist[0].data![0].prodi,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: DataColors.primary,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Fakultas",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: DataColors.primary700,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth: size.width / 1.5,
                                    ),
                                    child: AutoSizeText(
                                      x.datalist[0].data![0].fakultas,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: DataColors.primary,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: const Offset(
                                        0, 2), // changes position of shadow
                                  )
                                ],
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        x.datalist[0].data![0].photo),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListView(
                        primary: false,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        children: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {
                              Get.to(EditProfilePage(), arguments: [
                                x.datalist[0].data![0].nama,
                                x.datalist[0].data![0].fakultas,
                                x.datalist[0].data![0].prodi,
                                x.datalist[0].data![0].gender,
                                x.datalist[0].data![0].nim,
                                x.datalist[0].data![0].photo,
                                x.datalist[0].data![0].id,
                              ]);
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Edit Biodata",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: DataColors.primary700,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: DataColors.semigrey,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.black26,
                            height: 10,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Pengaturan Notifikasi",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: DataColors.primary700,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: DataColors.semigrey,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.black26,
                            height: 20,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                margin: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Get.defaultDialog(
                        onConfirm: () => c.logout(data['nim']),
                        onCancel: () => Navigator.pop(context),
                        middleText: "Apakah anda yakin ingin keluar");
                  },
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(
                      width: 2.0,
                      color: DataColors.primary,
                    ),
                    primary: Colors.white, // background
                    onPrimary: DataColors.primary700, // foreground
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(14.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  child: const Text(
                    'Keluar',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
    );
  }
}
