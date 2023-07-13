import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/riwayatbayar_C.dart';
import 'package:gostradav1/app/routes/rout_name.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class RiwayatBayarPage extends StatelessWidget {
  final box = GetStorage();
  RiwayatBayarController controller = Get.put(RiwayatBayarController());
  @override
  Widget build(BuildContext context) {
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Riwayat Bayar',
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
          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
          child: FutureBuilder<dynamic>(
              future: controller.RB(data['nim']),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());
                  default:
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: snapshot.data.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return riwayat(
                                status:
                                    snapshot.data.data[index].jenisPembayaran,
                                kode: snapshot.data.data[index].codeTrans,
                                nominal: snapshot.data.data[index].nominal,
                                dibuat: snapshot.data.data[index].dibuat,
                                fakultas: snapshot.data.data[index].fakultas,
                                jenjang: snapshot.data.data[index].jenjang,
                                prodi: snapshot.data.data[index].prodi,
                                index: index,
                              );
                            },
                          ),
                        ],
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
                                  "Tidak Ada Riwayat Bayar Saat Ini",
                                  style:
                                      TextStyle(color: DataColors.Neutral300),
                                ),
                              ],
                            )),
                      );
                    }
                }
              }),
        ));
  }
}

class riwayat extends StatelessWidget {
  final String status;
  final String kode;
  final String nominal;
  final String fakultas;
  final String jenjang;
  final String prodi;
  final DateTime dibuat;
  final int index;
  const riwayat({
    Key? key,
    required this.nominal,
    required this.status,
    required this.kode,
    required this.fakultas,
    required this.jenjang,
    required this.prodi,
    required this.dibuat,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.currency(locale: 'id_ID', decimalDigits: 0, symbol: 'Rp');
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: HexColor("#F3F3F3"), width: 2)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('dd MMMM yyyy').format(dibuat),
                      style: TextStyle(
                        color: DataColors.primary800,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      DateFormat('Hms').format(dibuat),
                      style: TextStyle(
                        color: DataColors.primary,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Pembayaran",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: DataColors.primary800,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    (status == "Offline")
                        ? Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                // color: Color.fromRGBO(112, 185, 235, 1.0)),
                                color: DataColors.Neutral200),
                            child: Text(
                              status,
                              style: TextStyle(
                                  color: DataColors.Neutral300,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                //color: Color.fromRGBO(112, 185, 235, 1.0)),
                                color: DataColors.primary700),
                            child: Text(
                              status,
                              style: TextStyle(
                                  color: DataColors.blusky,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              height: 1,
              color: HexColor("#E8E8E8"),
            ),
            const SizedBox(
              height: 20,
            ),
            (status == "ONLINE")
                ? Text("Periode 20211",
                    style: TextStyle(
                        color: DataColors.backgroundbutton,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500))
                : const Text(""),
            Text(
              "$jenjang - $prodi",
              style: TextStyle(
                  color: DataColors.primary800,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              fakultas,
              style: TextStyle(
                  color: DataColors.skyBlue,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: DataColors.primary),
              child: Text(
                kode,
                style: TextStyle(
                    color: DataColors.blusky,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("NOMINAL",
                        style: TextStyle(
                            color: DataColors.primary800,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: DataColors.blusky),
                      child: Text(
                        "Rp $nominal",
                        style: TextStyle(
                            color: DataColors.primary700,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      Get.toNamed(RoutName.detailtransaksi, arguments: index);
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
