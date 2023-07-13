// ignore_for_file: unnecessary_new

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/ui/pages/kategori/upload_bukti_bayar/detail/lihatbukti.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import '../../../../../controllers/keuangan/detailtransaksi.dart';
import '../../../../../controllers/uploadbuktip_c.dart';

class DetailPembayaran extends StatelessWidget {
  final box = GetStorage();
  var index = Get.arguments;
  String? code;
  String? nim;
  UploadBuktiController c = Get.put(UploadBuktiController());
  bool vis = false;
  DetailTransaksiController controller = Get.put(DetailTransaksiController());
  @override
  Widget build(BuildContext context) {
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Pembayaran',
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
      body: FutureBuilder<dynamic>(
          future: c.UBB(data['nim']),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasData) {
                  final formatCurrency =
                      new NumberFormat.simpleCurrency(locale: 'id_ID');
                  nim = data['nim'];
                  code = snapshot.data.data[index].codeTrans;
                  print("INI" + snapshot.data.data[index].isConfirm);
                  return SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: HexColor("#B6B6B6"), width: 1.sp)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10.sp,
                                  ),
                                  (snapshot.data.data[index].isConfirm == "1")
                                      ? Icon(
                                          Icons.check_circle,
                                          color: DataColors.primary800,
                                          size: 100,
                                        )
                                      : (snapshot.data.data[index].isConfirm ==
                                              "0")
                                          ? Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.green),
                                              child: Icon(
                                                Icons.question_mark_rounded,
                                                color: Colors.white,
                                                size: 100,
                                              ),
                                            )
                                          : Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.red),
                                              child: Icon(
                                                Icons.close_rounded,
                                                color: Colors.white,
                                                size: 100,
                                              ),
                                            ),
                                  SizedBox(
                                    height: 10.sp,
                                  ),
                                  Text(
                                    (snapshot.data.data[index].isConfirm == "1")
                                        ? "Telah dikonfirmasi"
                                        : (snapshot.data.data[index]
                                                    .isConfirm ==
                                                "0")
                                            ? "Belum dikonfirmasi"
                                            : "Telah Ditolak",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: DataColors.primary800,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 5.sp,
                                  ),
                                  Text(
                                      "${DateFormat('dd MMMM yyyy').format(snapshot.data.data[index].dibuat)} | ${DateFormat('Hm').format(snapshot.data.data[index].dibuat)}",
                                      style: TextStyle(
                                          color: DataColors.Neutral300,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10.sp)),
                                  SizedBox(
                                    height: 5.sp,
                                  ),
                                  Text(
                                      "Kode transaksi : ${snapshot.data.data[index].codeTrans}",
                                      style: TextStyle(
                                          color: HexColor("#757575"),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10.sp)),
                                  SizedBox(
                                    height: 5.sp,
                                  ),
                                ],
                              ),
                            ),
                            DottedLine(
                              direction: Axis.horizontal,
                              lineLength: double.infinity,
                              lineThickness: 1.0,
                              dashLength: 6.0,
                              dashColor: HexColor("#DADADA"),
                              dashRadius: 0.0,
                              dashGapLength: 4.0,
                              dashGapColor: Colors.transparent,
                              dashGapRadius: 0.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Informasi",
                                          style: TextStyle(
                                              color: DataColors.primary700,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 10.sp)),
                                      IconButton(
                                          onPressed: () {
                                            vis = controller.onclick(vis);
                                          },
                                          icon:
                                              const Icon(Icons.arrow_drop_down))
                                    ],
                                  ),
                                  GetBuilder<DetailTransaksiController>(
                                    init: DetailTransaksiController(),
                                    initState: (_) {},
                                    builder: (_) {
                                      return Visibility(
                                        visible: vis,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  height: 5.sp,
                                                ),
                                                Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      "NIM",
                                                      style: TextStyle(
                                                          color: DataColors
                                                              .primary900,
                                                          fontSize: 10.sp),
                                                    )),
                                                const Spacer(
                                                  flex: 1,
                                                ),
                                                Text(
                                                    snapshot
                                                        .data.data[index].nim,
                                                    style: TextStyle(
                                                        color: DataColors
                                                            .primary900,
                                                        fontSize: 10.sp)),
                                                SizedBox(
                                                  height: 10.sp,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  height: 10.sp,
                                                ),
                                                Text(
                                                  "Nama Mahasiswa",
                                                  style: TextStyle(
                                                      color:
                                                          DataColors.primary900,
                                                      fontSize: 10.sp),
                                                ),
                                                const Spacer(
                                                  flex: 1,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                      snapshot.data.data[index]
                                                          .name,
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: TextStyle(
                                                          color: DataColors
                                                              .primary900,
                                                          fontSize: 10.sp)),
                                                ),
                                                SizedBox(
                                                  height: 10.sp,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  height: 10.sp,
                                                ),
                                                Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      "Bukti Bayar",
                                                      style: TextStyle(
                                                          color: DataColors
                                                              .primary900,
                                                          fontSize: 10.sp),
                                                    )),
                                                const Spacer(
                                                  flex: 1,
                                                ),
                                                Text(
                                                    (snapshot.data.data[index]
                                                                .uploads ==
                                                            null)
                                                        ? "Tidak ada"
                                                        : "IMG",
                                                    style: TextStyle(
                                                        color: DataColors
                                                            .primary900,
                                                        fontSize: 10.sp)),
                                                SizedBox(
                                                  height: 10.sp,
                                                ),
                                              ],
                                            ),
                                            (snapshot.data.data[index]
                                                        .isConfirm ==
                                                    "2")
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: 10.sp,
                                                      ),
                                                      Text(
                                                        "Alasan ditolak",
                                                        style: TextStyle(
                                                            color: DataColors
                                                                .primary900,
                                                            fontSize: 10.sp),
                                                      ),
                                                      const Spacer(
                                                        flex: 1,
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Text(
                                                            snapshot
                                                                .data
                                                                .data[index]
                                                                .noteReject,
                                                            textAlign:
                                                                TextAlign.right,
                                                            style: TextStyle(
                                                                color: DataColors
                                                                    .primary900,
                                                                fontSize:
                                                                    10.sp)),
                                                      ),
                                                      SizedBox(
                                                        height: 10.sp,
                                                      ),
                                                    ],
                                                  )
                                                : Container(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 10.sp,
                                                ),
                                                Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      "Note",
                                                      style: TextStyle(
                                                          color: DataColors
                                                              .primary900,
                                                          fontSize: 10.sp),
                                                    )),
                                                const Spacer(
                                                  flex: 1,
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                      snapshot.data.data[index]
                                                          .note,
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: TextStyle(
                                                          color: DataColors
                                                              .primary900,
                                                          fontSize: 10.sp)),
                                                ),
                                                SizedBox(
                                                  height: 10.sp,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            DottedLine(
                              direction: Axis.horizontal,
                              lineLength: double.infinity,
                              lineThickness: 1.0,
                              dashLength: 6.0,
                              dashColor: HexColor("#DADADA"),
                              dashRadius: 0.0,
                              dashGapLength: 4.0,
                              dashGapColor: Colors.transparent,
                              dashGapRadius: 0.0,
                            ),
                            SizedBox(
                              height: 5.sp,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("TOTAL TAGIHAN",
                                      style: TextStyle(
                                          color: DataColors.primary600,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10.sp)),
                                  SizedBox(
                                    height: 5.sp,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Nominal",
                                          style: TextStyle(
                                              color: DataColors.primary900,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 10.sp)),
                                      Text(
                                          formatCurrency.format(int.tryParse(
                                              snapshot
                                                  .data.data[index].nominal)),
                                          style: TextStyle(
                                              color: DataColors.primary600,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 10.sp))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.sp,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ));
                } else {
                  return const Center(child: Text("Tidak Ada Data"));
                }
            }
          }),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        margin: const EdgeInsets.only(bottom: 20),
        child: ElevatedButton(
          onPressed: () {
            Get.to(LihatBuktiPage(), arguments: [nim, code]);
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
            'Lihat Bukti',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
