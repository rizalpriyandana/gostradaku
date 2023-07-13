import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/routes/rout_name.dart';
import 'package:gostradav1/app/ui/pages/kategori/tagihan/buattagihan.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import '../../../../controllers/tagihan_c.dart';
import '../../../theme/color.dart';

class SemuaTagihanPage extends StatelessWidget {
  final box = GetStorage();
  List<TextEditingController> controllers = [];
  List<TextEditingController> controllers2 = [];
  List<bool> isVisible = [];
  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID');
    TagihanController controller = Get.put(TagihanController());
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tagihan',
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
      body: FutureBuilder(
        future: controller.loadsemuatagihan(data["nim"]),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasData) {
                controllers.clear();
                for (var i = 0; i < snapshot.data.data!.length; i++) {
                  controllers.add(TextEditingController(
                      text: (snapshot.data.data[i].nominal).toString()));
                }
                return GetBuilder<TagihanController>(
                  init: TagihanController(),
                  initState: (_) {
                    controller.loadsemuatagihan(data["nim"]);
                  },
                  builder: (_) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: _.datadatum.length,
                      itemBuilder: (BuildContext context, int index) {
                        // controllers.add(TextEditingController(
                        //     text: (_.datadatum[index].nominal).toString()));
                        controllers2.add(TextEditingController());
                        isVisible.add(false);
                        return InkWell(
                          onTap: () {
                            Get.to(BuatTagihanPage(), arguments: [
                              _.datadatum[index].namaTagihan,
                              _.datadatum[index].labelJenis,
                              _.datadatum[index].nominal,
                              _.datadatum[index].idBiaya,
                              _.datadatum[index].idCredit,
                              ]);
                            // Fluttertoast.showToast(
                            //     msg:
                            //         "${_.datadatum[index].idBiaya} ${_.datadatum[index].idCredit}");
                          },
                          child: AllBill(
                            namaTagihan: _.datadatum[index].namaTagihan,
                            label: _.datadatum[index].labelJenis,
                            nominal: _.datadatum[index].nominal,
                          ),
                        );
                        // Padding(
                        //   padding: EdgeInsets.only(
                        //       bottom: 15.0.sp,
                        //       left: 20.sp,
                        //       right: 20.sp,
                        //       top: 2.sp),
                        //   child: Container(
                        //     padding: EdgeInsets.all(10.sp),
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(8),
                        //       border: Border.all(
                        //           color: DataColors.primary600, width: 1.5),
                        //       color: DataColors.primary200,
                        //     ),
                        //     child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Row(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             Row(
                        //               children: [
                        //                 Text(
                        //                   _.datadatum[index].namaTagihan,
                        //                   style: TextStyle(
                        //                       color: DataColors.primary800),
                        //                 ),
                        // InkWell(
                        //   onTap: () {
                        //     Fluttertoast.showToast(
                        //         msg: _.datadatum[index].idBiaya
                        //                 .toString() +
                        //             _.datadatum[index].idCredit
                        //                 .toString());
                        //   },
                        //                   child: Container(
                        //                     decoration: BoxDecoration(
                        //                       borderRadius:
                        //                           BorderRadius.circular(8.sp),
                        //                       border: Border.all(
                        //                           color: DataColors.primary,
                        //                           width: 1.sp),
                        //                     ),
                        //                     padding: EdgeInsets.symmetric(
                        //                         vertical: 2.sp,
                        //                         horizontal: 4.sp),
                        //                     child: Text(
                        //                       "Edit",
                        //                       style: TextStyle(
                        //                           color: DataColors.primary,
                        //                           fontSize: 10.sp),
                        //                     ),
                        //                   ),
                        //                 )
                        //               ],
                        //             ),
                        //             // InkWell(
                        //             //   onTap: () {
                        //             //     controller.totaltagihan.value = 0;

                        //             //     controllers.removeAt(index);
                        //             //     //controllers[index].dispose();
                        //             //     _.datadatum.removeAt(index);
                        //             //     for (var i = 0;
                        //             //         i < _.datadatum.length;
                        //             //         i++) {
                        //             //       controller.totaltagihan.value +=
                        //             //           int.parse(controllers[i].text);
                        //             //     }
                        //             //     _.update();
                        //             //   },
                        //             //   child: Container(
                        //             //     decoration: BoxDecoration(
                        //             //         borderRadius:
                        //             //             BorderRadius.circular(8.sp),
                        //             //         border: Border.all(
                        //             //             color: Colors.redAccent,
                        //             //             width: 1.sp)),
                        //             //     padding: EdgeInsets.symmetric(
                        //             //         vertical: 2.sp, horizontal: 4.sp),
                        //             //     child: Text(
                        //             //       "Hapus",
                        //             //       style: TextStyle(
                        //             //           color: Colors.redAccent,
                        //             //           fontSize: 10.sp),
                        //             //     ),
                        //             //   ),
                        //             // ),
                        //           ],
                        //         ),
                        //         SizedBox(
                        //           height: 10.sp,
                        //         ),
                        //         Text(_.datadatum[index].labelJenis,
                        //             style:
                        //                 TextStyle(color: DataColors.primary)),
                        //         SizedBox(
                        //           height: 10.sp,
                        //         ),
                        //         Row(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             Container(
                        //               padding: EdgeInsets.symmetric(
                        //                   vertical: 2.sp, horizontal: 4.sp),
                        //               decoration: BoxDecoration(
                        //                   borderRadius:
                        //                       BorderRadius.circular(4.sp),
                        //                   color: DataColors.primary100),
                        //               child: Text(
                        //                   formatCurrency.format(
                        //                       _.datadatum[index].nominal),
                        //                   style: TextStyle(
                        //                       fontSize: 15.sp,
                        //                       color: DataColors.primary600)),
                        //             ),
                        //             SizedBox(
                        //               width: 10.sp,
                        //             ),
                        //             // InkWell(
                        //             //   onTap: () {
                        //             //     isVisible[index] =
                        //             //         controller.toggle(isVisible[index]);
                        //             //   },
                        //             //   child: Container(
                        //             //     decoration: BoxDecoration(
                        //             //         borderRadius:
                        //             //             BorderRadius.circular(8.sp),
                        //             //         border: Border.all(
                        //             //             color: DataColors.primary600,
                        //             //             width: 1.sp)),
                        //             //     padding: EdgeInsets.symmetric(
                        //             //         vertical: 2.sp, horizontal: 4.sp),
                        //             //     child: Text(
                        //             //       "Klik Untuk Cicil",
                        //             //       style: TextStyle(
                        //             //           color: DataColors.primary600,
                        //             //           fontSize: 10.sp),
                        //             //     ),
                        //             //   ),
                        //             // )
                        //           ],
                        //         ),
                        //         GetBuilder<TagihanController>(
                        //           init: TagihanController(),
                        //           initState: (_) {},
                        //           dispose: (state) {},
                        //           builder: (_) {
                        //             return Visibility(
                        //               visible: isVisible[index],
                        //               maintainSize: false,
                        //               child: Container(
                        //                 margin: EdgeInsets.only(top: 20.sp),
                        //                 child: Column(
                        //                   crossAxisAlignment:
                        //                       CrossAxisAlignment.start,
                        //                   children: [
                        //                     Text(
                        //                       "Masukkan Nominal: ",
                        //                       style: TextStyle(
                        //                           color: DataColors.primary800),
                        //                     ),
                        //                     SizedBox(
                        //                       height: 10.sp,
                        //                     ),
                        //                     TextField(
                        //                       onSubmitted: (value) {
                        //                         int val =
                        //                             (int.tryParse(value) ?? 0);
                        //                         int nominal =
                        //                             _.datadatum[index].nominal;
                        //                         controller.totaltagihan.value =
                        //                             0;
                        //                         if (nominal < val) {
                        //                           controllers[index].text =
                        //                               nominal.toString();
                        //                           controllers2[index].text =
                        //                               formatCurrency.format(0);
                        //                         } else {
                        //                           int num = _
                        //                               .datadatum[index].nominal;
                        //                           controllers2[index].text =
                        //                               formatCurrency.format(
                        //                                   ((num) -
                        //                                       int.parse(
                        //                                           value)));
                        //                         }

                        //                         for (var i = 0;
                        //                             i < _.datadatum.length;
                        //                             i++) {
                        //                           controller.totaltagihan
                        //                               .value += int.tryParse(
                        //                                   controllers[i]
                        //                                       .text) ??
                        //                               0;
                        //                         }
                        //                         _.update();
                        //                       },
                        //                       onChanged: (value) {
                        //                         if (value.isEmpty) {
                        //                           value = 0.toString();
                        //                         }
                        //                       },
                        //                       keyboardType:
                        //                           TextInputType.number,
                        //                       inputFormatters: <
                        //                           TextInputFormatter>[
                        //                         FilteringTextInputFormatter
                        //                             .digitsOnly
                        //                       ],
                        //                       controller: controllers[index],
                        //                       decoration: InputDecoration(
                        //                         filled: true,
                        //                         fillColor: Colors.white,
                        //                         enabledBorder:
                        //                             OutlineInputBorder(
                        //                           borderRadius:
                        //                               BorderRadius.circular(
                        //                                   6.sp),
                        //                           borderSide: BorderSide(
                        //                               color:
                        //                                   DataColors.Neutral200,
                        //                               width: 2.0),
                        //                         ),
                        //                       ),
                        //                     ),
                        //                     SizedBox(
                        //                       height: 10.sp,
                        //                     ),
                        //                     TextField(
                        //                       controller: controllers2[index],
                        //                       decoration: InputDecoration(
                        //                         isDense: true,
                        //                         prefixIcon: const Text("Sisa"),
                        //                         enabled: false,
                        //                         enabledBorder:
                        //                             OutlineInputBorder(
                        //                           borderRadius:
                        //                               BorderRadius.circular(
                        //                                   6.sp),
                        //                           borderSide: BorderSide(
                        //                               color:
                        //                                   DataColors.Neutral200,
                        //                               width: 2.0),
                        //                         ),
                        //                       ),
                        //                     )
                        //                   ],
                        //                 ),
                        //               ),
                        //             );
                        //           },
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // );
                      },
                    );
                  },
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
                            image: AssetImage("assets/images/datatidakada.png"),
                            height: 100.sp,
                          ),
                          Text(
                            "Tidak Ada Tagihan Saat Ini",
                            style: TextStyle(color: DataColors.Neutral300),
                          ),
                        ],
                      )),
                );
              }

            // return
            //
          }
        },
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GetBuilder<TagihanController>(builder: (_) {
            return Padding(
              padding: EdgeInsets.only(left: 12.sp, bottom: 15.sp),
              child: Text(
                "Total Tagihan \n ${formatCurrency.format(controller.totaltagihan.value)}",
                style: TextStyle(color: DataColors.primary600, fontSize: 14.sp),
              ),
            );
          }),
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 40),
          //   margin: const EdgeInsets.only(bottom: 20),
          //   child: ElevatedButton(
          //     onPressed: () {
          //       //                required this.bayar,
          //       // required this.idBiaya,
          //       // required this.idCredit,

          //       List<String> bayarlist = [];
          //       List<String> idBiayalist = [];
          //       List<String> idCreditlist = [];
          //       for (var i = 0; i < controller.datadatum.length; i++) {
          //         bayarlist.add(controllers[i].text);
          //         idBiayalist.add((controller.datadatum[i].idBiaya).toString());
          //         idCreditlist
          //             .add((controller.datadatum[i].idCredit).toString());
          //       }
          //       var bayar = bayarlist.join(",");
          //       var idBiaya = idBiayalist.join(",");
          //       var idCredit = idCreditlist.join(",");
          //       controller.confirmtagihan(
          //           data["nim"], idBiaya, idCredit, bayar);
          //     },
          //     style: ElevatedButton.styleFrom(
          //       primary: DataColors.primary, // background
          //       onPrimary: Colors.white, // foreground
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(14.0),
          //       ),
          //       padding:
          //           EdgeInsets.symmetric(vertical: 5.sp, horizontal: 15.sp),
          //     ),
          //     child: Text(
          //       'Konfirmasi',
          //       style: TextStyle(fontWeight: FontWeight.w700, fontSize: 10.sp),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class AllBill extends StatelessWidget {
  final String namaTagihan;
  final String label;
  final int nominal;

  const AllBill({
    Key? key,
    required this.namaTagihan,
    required this.label,
    required this.nominal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency =
        NumberFormat.currency(locale: 'id_ID', decimalDigits: 0, symbol: 'Rp ');
    return Padding(
      padding: EdgeInsets.only(top: 12.sp, right: 20.sp, left: 20.sp),
      child: Container(
        padding: EdgeInsets.only(bottom: 10.sp, top: 10.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.sp),
          border: Border.all(color: DataColors.primary600, width: 1.5),
          color: DataColors.primary200,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.sp),
              child: Text(
                namaTagihan,
                style: TextStyle(
                  color: DataColors.primary700,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 5.sp,
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.sp, left: 10.sp),
              child: Divider(
                height: 5,
                thickness: 2,
                indent: 0,
                endIndent: 0,
                color: DataColors.primary700,
              ),
            ),
            SizedBox(
              height: 5.sp,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.sp),
              child: Text(
                label,
                style: TextStyle(
                    color: DataColors.primary, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 5.sp,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.sp),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 2.sp, horizontal: 4.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.sp),
                    color: DataColors.primary100),
                child: Text(formatCurrency.format(nominal),
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: DataColors.primary600,
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
