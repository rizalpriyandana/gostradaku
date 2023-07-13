import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import '../../../../../controllers/tagihan_c.dart';
import '../../../../../controllers/va_c.dart';
import '../../../../theme/color.dart';
import 'package:intl/intl.dart';

class VAPage extends StatefulWidget {
  @override
  State<VAPage> createState() => _VAPageState();
}

class _VAPageState extends State<VAPage> {
  VaController controller = Get.put(VaController());
  final formatCurrency = new NumberFormat.simpleCurrency(locale: 'id_ID');
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    var array = Get.arguments;
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Virtual Account',
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: EdgeInsets.only(bottom: 10.sp),
              height: 1.5.sp,
              width: 100.w,
              color: DataColors.Neutral200,
            ),
            Padding(
              padding: EdgeInsets.all(10.0.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nomor Virtual Account",
                        style: TextStyle(
                            color: DataColors.primary800,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 10.sp),
                      FutureBuilder<dynamic>(
                          future: controller.getva(
                              data['nim'].toString(),
                              array[1].toString(),
                              "pembayaran online",
                              array[0].toString(),
                              data["id_fakul"]),
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return const Center(
                                    child: CircularProgressIndicator());
                              default:
                                if (snapshot.hasData) {
                                  box.write(
                                      'nomorva', snapshot.data.virtualAccount);
                                  box.write('nominal', snapshot.data.nominal);
                                  return Row(
                                    children: [
                                      CachedNetworkImage(
                                          height: 40.sp,
                                          imageUrl: snapshot.data.image),
                                      SizedBox(
                                        width: 10.sp,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data.bankName,
                                            style: TextStyle(
                                                color: DataColors.primary600,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(snapshot.data.virtualAccount,
                                              style: TextStyle(
                                                  color: DataColors.primary800,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15.sp)),
                                        ],
                                      ),
                                    ],
                                  );
                                } else {
                                  return (box.read('nomorva') == null)
                                      ? const Text("Mohon Tunggu 2 Jam Lagi")
                                      : Text(box.read('nomorva'),
                                          style: TextStyle(
                                              color: DataColors.primary800,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15.sp));
                                }
                            }
                          })
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Clipboard.setData(
                          ClipboardData(text: box.read('nomorva')));
                      Get.snackbar('Hi', 'VA berhasil dicopy');
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
            Padding(
              padding: EdgeInsets.all(10.0.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total Pembayaran",
                      style: TextStyle(
                          color: DataColors.primary800,
                          fontWeight: FontWeight.w400)),
                  Center(
                    child: Container(
                      margin: EdgeInsets.all(12.sp),
                      padding: EdgeInsets.symmetric(
                          vertical: 4.sp, horizontal: 8.sp),
                      decoration: BoxDecoration(
                          color: DataColors.primary600,
                          borderRadius: BorderRadius.circular(4.sp)),
                      child: Text(formatCurrency.format(array[1]),
                          style: TextStyle(
                              color: DataColors.primary100,
                              fontWeight: FontWeight.w600,
                              fontSize: 19.sp)),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.sp, bottom: 15.sp),
              height: 20.sp,
              width: 100.w,
              color: DataColors.Neutral100,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.sp),
              child: Text("Batas Akhir Pembayaran",
                  style: TextStyle(
                      color: DataColors.Neutral400,
                      fontWeight: FontWeight.w400)),
            ),
            Padding(
              padding: EdgeInsets.all(10.0.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      (box.read('DatetimeAkhir') == null)
                          ? ""
                          : DateFormat('EEE d MMM kk:mm:ss').format(
                              DateTime.parse(box.read('DatetimeAkhir'))),
                      style: TextStyle(
                          color: DataColors.primary900,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0.sp),
              child: Text(
                  "Nomor Virtual Account Bank akan terhapus apabila anda tidak membayar dalam jangka waktu 2x24 jam.",
                  style: TextStyle(
                      color: DataColors.Neutral400,
                      fontWeight: FontWeight.w400)),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(20.sp),
                padding: EdgeInsets.all(12.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp),
                    color: HexColor("E95959")),
                child: Obx(() => Text(controller.hitungmundur.value,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp))),
              ),
            )
          ]),
        ));
  }
}
