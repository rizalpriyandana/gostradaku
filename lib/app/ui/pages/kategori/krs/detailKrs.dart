// ignore_for_file: unnecessary_new

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:gostradav1/app/controllers/krs/krs_c.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class DetailKRSPage extends StatelessWidget {
  KrsController c = Get.put(KrsController());

  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    var i = Get.arguments;
    final Size size = MediaQuery.of(context).size;
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
        titleSpacing: 0,
        title: Text(
          'Detail KRS',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: DataColors.primary700,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: FutureBuilder<dynamic>(
          future: c.detailkrs(data["nim"], i),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasData) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            height: 100,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: DataColors.blusky,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: const Offset(
                                      0, 2), // changes position of shadow
                                )
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: size.width / 2,
                                  ),
                                  child: AutoSizeText(
                                    "Total SKS yang diambil",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: DataColors.primary700,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${snapshot.data.totalSks} SKS",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: DataColors.primary700,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Daftar KRS',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: DataColors.primary700,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ListView.separated(
                            primary: false,
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(8),
                            itemCount: snapshot.data.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                width: size.width,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ConstrainedBox(
                                          constraints: BoxConstraints(
                                            maxWidth: size.width / 2,
                                          ),
                                          child: AutoSizeText(
                                            snapshot.data.data[index].name,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: DataColors.primary700,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Kode: ${snapshot.data.data[index].codeMk}",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                                color: DataColors.primary,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'SKS',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                            color: DataColors.primary700,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          // padding: EdgeInsets.all(5),
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                              color: DataColors.primary700,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${snapshot.data.data[index].bobot}",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Text("Tidak Ada Data");
                }
            }
          }),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        margin: const EdgeInsets.only(bottom: 20),
        child: ElevatedButton(
          onPressed: () async {
            ProgressDialog pd = ProgressDialog(context: context);
            final directory = await getTemporaryDirectory();
            c.downloadkrs(
                Dio(), data["nim"], i, directory.path + "_KRS.pdf", pd);
            pd.show(max: 100, msg: 'File Downloading...');
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
            'Unduh KRS',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
