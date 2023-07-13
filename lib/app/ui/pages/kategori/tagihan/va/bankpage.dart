import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/routes/rout_name.dart';
import 'package:sizer/sizer.dart';

import '../../../../../controllers/keuangan/detailtransaksi.dart';
import '../../../../../controllers/tagihan_c.dart';
import '../../../../theme/color.dart';

class BankPage extends StatelessWidget {
  TagihanController controller = Get.put(TagihanController());
  DetailTransaksiController c = Get.put(DetailTransaksiController());
  @override
  Widget build(BuildContext context) {
    bool isvisible = false;
    bool isvisible1 = false;
    var index = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transfer Bank',
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          FutureBuilder<dynamic>(
              future: controller.DataBank(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());
                  default:
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10.sp),
                            height: 1.5.sp,
                            width: 100.w,
                            color: DataColors.Neutral200,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 20.sp, right: 10.sp),
                                  height: 30.sp,
                                  width: 30.sp,
                                  child: Image(
                                    image: CachedNetworkImageProvider(
                                        snapshot.data.data[index].img),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data.data[index].name,
                                    style: TextStyle(
                                        color: DataColors.primary800,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    "a.n. ${snapshot.data.data[index].atasnama}",
                                    style: TextStyle(
                                        color: DataColors.primary800,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 23.w, top: 10.sp, bottom: 10.sp),
                            height: 1.5.sp,
                            width: 100.w,
                            color: DataColors.Neutral200,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 23.w),
                            child: Text(
                              "Nomor Rekening",
                              style: TextStyle(
                                  color: DataColors.primary800,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 23.w, right: 10.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  snapshot.data.data[index].norek,
                                  style: TextStyle(
                                      color: DataColors.primary,
                                      fontWeight: FontWeight.w600),
                                ),
                                InkWell(
                                  onTap: () {
                                    Clipboard.setData(
                                        const ClipboardData(text: " "));
                                    Get.snackbar('Hi', 'Nomor berhasil dicopy');
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "SALIN",
                                      style: TextStyle(
                                          color: DataColors.primary,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const Text("Masih Memuat");
                    }
                }
              }),
          Container(
            margin: EdgeInsets.only(bottom: 10.sp, top: 10.sp),
            height: 1.5.sp,
            width: 100.w,
            color: DataColors.Neutral200,
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Text(
                  "Setelah Melakukan Pembayaran Silahkan Untuk Ke Menu Upload Bukti Bayar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: DataColors.primary400,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      Get.toNamed(RoutName.uploadBuktiBayar);
                    },
                    child: Container(
                        padding: EdgeInsets.all(12.sp),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.sp),
                            border: Border.all(color: DataColors.primary400)),
                        child: const Text("Upload Bukti Bayar"))),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10.sp),
            height: 20.sp,
            width: 100.w,
            color: DataColors.Neutral200,
          ),
          InkWell(
            onTap: () {
              isvisible = c.onclick(isvisible);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 5.w, top: 20.sp, bottom: 20.sp),
                  child: Text(
                    "Petunjuk Transfer mBanking",
                    style: TextStyle(
                        color: DataColors.primary900,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 15.sp,
                    color: DataColors.primary800,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 1.5.sp,
            width: 100.w,
            color: DataColors.Neutral200,
          ),
          GetBuilder<DetailTransaksiController>(
            init: DetailTransaksiController(),
            initState: (_) {},
            builder: (_) {
              return Visibility(
                visible: isvisible,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 5.w, right: 5.w, bottom: 5.w, top: 10.sp),
                      child: Text(
                        (index == 1)
                            ? "1. Pilih menu transfer \n2. Klik tambah daftar baru \n3. Pilih Bank BRI \n4. Masukkan nomor rekening BRI yang dituju \n5. Klik Lanjutkan \n6. Masukkan Nominal \n7. Klik Transfer \n8. Pastikan Bank yang dituju adalah Bank Rakyat Indonesia dan rekening anda sudah benar. \n9. Terakhir masukkan pin BRImo "
                            : "1. Pilih Transfer Rekening BSI \n2. Pilih Rekening Debit anda yang terdaftar \n3. Pilih Tujuan Transfer - Rekening BSI Orang Lain \n4. Masukkan No. Rekening Tujuan \n5. Masukkan Nominal \n6. Masukkan Keterangan (Optional) \n7. Periksa informasi yang tertera di layar. \n8. Pastikan  Bank yang dituju adalah Bank Syariah Indonesia dan rekening anda sudah benar. \n9. Pilih OK ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            height: 1.3.sp, color: DataColors.Neutral400),
                      ),
                    ),
                    Container(
                      height: 1.5.sp,
                      width: 100.w,
                      color: DataColors.Neutral200,
                    ),
                  ],
                ),
              );
            },
          ),
          InkWell(
            onTap: () {
              isvisible1 = c.onclick(isvisible1);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 5.w, top: 20.sp, bottom: 20.sp),
                  child: Text(
                    "Petunjuk Transfer ATM",
                    style: TextStyle(
                        color: DataColors.primary900,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 15.sp,
                    color: DataColors.primary800,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 1.5.sp,
            width: 100.w,
            color: DataColors.Neutral200,
          ),
          GetBuilder<DetailTransaksiController>(
            init: DetailTransaksiController(),
            initState: (_) {},
            builder: (_) {
              return Visibility(
                visible: isvisible1,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 5.w, right: 5.w, bottom: 5.w),
                      child: Text(
                        (index == 1)
                            ? "1. Pilih menu transaksi lainnya \n2. Klik menu transfer \n3. Masukkan kode +002 nomor rekening BRI \n4. Masukkan nominal transfer \n5. Klik benar saat konfirmasi \n6. Masukkan nomor referensi \n7. Klik ya \n8. Pilih rekening Tabungan atau Giro. \n9. Tunggu bukti transfer BRI muncul "
                            : "1. Pilih menu utama \n2. Selanjutnya pilih menu transfer \n3. Pilih rekening BSI lainnya \n4. Masukkan nomor rekening BSI yang dituju \n5. Muncul informasi singkat, pilih lanjutkan \n6. Masukkan nominal transfer \n7. Klik ya. \n8. Periksa kembali apakah sudah benar, pilih ya untuk melanjutkan. \n9. Tunggu transaksi sampai selesai ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            height: 1.3.sp, color: DataColors.Neutral400),
                      ),
                    ),
                    Container(
                      height: 1.5.sp,
                      width: 100.w,
                      color: DataColors.Neutral200,
                    ),
                  ],
                ),
              );
            },
          ),
        ]),
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        margin: const EdgeInsets.only(bottom: 20, top: 10),
        child: ElevatedButton(
          onPressed: () {
            Get.offAllNamed(RoutName.root);
          },
          style: ElevatedButton.styleFrom(
            primary: DataColors.primary, // background
            onPrimary: Colors.white, // foreground
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
          child: const Text(
            'OK',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
