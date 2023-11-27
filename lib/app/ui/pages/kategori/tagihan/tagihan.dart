import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/tagihan_c.dart';
import 'package:gostradav1/app/ui/pages/kategori/tagihan/buattagihan.dart';
import 'package:gostradav1/app/ui/pages/kategori/tagihan/buattagihanv2.dart';
import 'package:gostradav1/app/ui/pages/kategori/tagihan/preview/preview_pembayaranexpiredv2.dart';
import 'package:gostradav1/app/ui/pages/kategori/tagihan/preview/preview_tagihanaktif.dart';
import 'package:gostradav1/app/ui/pages/kategori/tagihan/preview/preview_tagihanaktifv2.dart';
import 'package:gostradav1/app/ui/pages/kategori/tagihan/semuatagihan.dart';
import 'package:gostradav1/app/ui/pages/kategori/tagihan/preview/preview_pembayaran.dart';
import 'package:gostradav1/app/ui/pages/kategori/tagihan/preview/preview_pembayaranexpired.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class TagihanPage extends StatelessWidget {
  final box = GetStorage();
  TagihanController controller = Get.put(TagihanController());
  @override
  Widget build(BuildContext context) {
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tagihan',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: DataColors.primary700
          ),
        ),
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(top: 11.sp, left: 10.sp),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: FaIcon(
              FontAwesomeIcons.angleLeft,
              color: DataColors.primary800,
              size: 18.sp,
            ),
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: FutureBuilder<dynamic>(
          future: controller.Tagihan(data['nim']),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                    child: LoadingAnimationWidget.fourRotatingDots(
                        color: DataColors.primary700, size: 40.sp));
              default:
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.sp, vertical: 14.sp),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: DataColors.blusky),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child: SvgPicture.asset(
                                  'assets/images/dashboard/icon/tagihan.svg',
                                  color: DataColors.primary.withOpacity(0.20),
                                  height: 70.sp,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nama Tagihan:",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: DataColors.primary700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    (snapshot.data.namaTagihan == null)
                                        ? " Tidak Ada tagihan"
                                        : snapshot.data.namaTagihan,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: DataColors.primary,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Tagihan Lainnya",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: DataColors.primary800,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        (snapshot.data.tagihanCicilan.contentCicilan != 0)
                            ? ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxHeight: 150.sp, minHeight: 10.sp),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      snapshot.data.tagihanCicilan.data.length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return tagihancicilan(
                                        nama: snapshot.data.tagihanCicilan
                                            .data[index].nama,
                                        nominal: snapshot.data.tagihanCicilan
                                            .data[index].nominal,
                                        total: snapshot.data.tagihanCicilan
                                            .data[index].total,
                                        terbayar: snapshot.data.tagihanCicilan
                                            .data[index].terbayar);
                                  },
                                ),
                              )
                            : const tidakadatagihan(),

                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Tagihan Semester",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: DataColors.primary800,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        (snapshot.data.tagihanSemester.contentTagihan != 0)
                            ? ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxHeight: 150.sp, minHeight: 10.sp),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      snapshot.data.tagihanSemester.data.length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return tagihansemester(
                                        semester: snapshot.data.tagihanSemester
                                            .data[index].semester,
                                        nominal: snapshot.data.tagihanSemester
                                            .data[index].nominal,
                                        total: snapshot.data.tagihanSemester
                                            .data[index].total,
                                        terbayar: snapshot.data.tagihanSemester
                                            .data[index].terbayar);
                                  },
                                ),
                              )
                            : const tidakadatagihan(),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Tagihan Sedang Aktif",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: DataColors.primary800,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        (snapshot.data.tagihanActive.activeTagihan != 0)
                            ? ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxHeight: 170.sp, minHeight: 10.sp),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      snapshot.data.tagihanActive.data.length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        Get.to(PreviewTagihanAktifv2(),
                                            arguments: [
                                              snapshot.data.tagihanActive
                                                  .data[index].codeTrans,
                                              (snapshot.data.tagihanActive
                                                      .data[index].nominal)
                                                  .toString()
                                            ]);
                                      },
                                      child: TagihanExpired(
                                          codeTrans: snapshot.data.tagihanActive
                                              .data[index].codeTrans,
                                          nominal: snapshot.data.tagihanActive
                                              .data[index].nominal,
                                          tanggaldibuat: snapshot
                                              .data
                                              .tagihanActive
                                              .data[index]
                                              .tanggalDibuat,
                                          tanggalexpired: snapshot
                                              .data
                                              .tagihanActive
                                              .data[index]
                                              .tanggalExpired),
                                    );
                                  },
                                ),
                              )
                            : const tidakadatagihan(),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Tagihan Telah Expired",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: DataColors.primary800,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        (snapshot.data.tagihanExpired.tagihanExpired != 0)
                            ? ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxHeight: 170.sp, minHeight: 10.sp),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      snapshot.data.tagihanExpired.data.length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        Get.to(PreviewTagihanExpiredv2Page(),
                                            arguments: [
                                              snapshot.data.tagihanExpired
                                                  .data[index].codeTrans,
                                              (snapshot.data.tagihanExpired
                                                      .data[index].nominal)
                                                  .toString()
                                            ]);
                                      },
                                      child: TagihanExpired(
                                          codeTrans: snapshot
                                              .data
                                              .tagihanExpired
                                              .data[index]
                                              .codeTrans,
                                          nominal: snapshot.data.tagihanExpired
                                              .data[index].nominal,
                                          tanggaldibuat: snapshot
                                              .data
                                              .tagihanExpired
                                              .data[index]
                                              .tanggalDibuat,
                                          tanggalexpired: snapshot
                                              .data
                                              .tagihanExpired
                                              .data[index]
                                              .tanggalExpired),
                                    );
                                  },
                                ),
                              )
                            : const tidakadatagihan(),
                        //TagihanExpired()
                      ],
                    ),
                  );
                } else {
                  return const Center(child: Text("Tidak Ada Data"));
                }
            }
          }),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        margin: const EdgeInsets.only(bottom: 20, top: 20),
        child: ElevatedButton(
          onPressed: () {
            Get.to(SemuaTagihanPage());
          },
          style: ElevatedButton.styleFrom(
            side: BorderSide(
              width: 2.0,
              color: DataColors.primary,
            ),
            backgroundColor: Colors.white,
            foregroundColor: DataColors.primary700, // foreground
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
          ),
          child: const Text(
            'Buat Tagihan',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

class tidakadatagihan extends StatelessWidget {
  const tidakadatagihan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: DataColors.blusky),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            'assets/images/tagihan/info.svg',
            color: DataColors.primary.withOpacity(0.50),
            height: 70.sp,
          ),
          Text(
            "Tidak Ada Tagihan",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: DataColors.primary800,
            ),
          )
        ],
      ),
    );
  }
}

class tagihancicilan extends StatelessWidget {
  final String nama;
  final int nominal;
  final int total;
  final int terbayar;
  const tagihancicilan({
    Key? key,
    required this.nama,
    required this.nominal,
    required this.total,
    required this.terbayar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency =
        NumberFormat.currency(locale: 'id_ID', decimalDigits: 0, symbol: 'Rp');
    return Padding(
      padding: EdgeInsets.only(right: 8.0.sp),
      child: Container(
        height: 150.sp,
        padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 14.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: DataColors.blusky),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nama,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: DataColors.primary400,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              formatCurrency.format(nominal),
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: DataColors.primary800,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: DataColors.backgroundbutton),
                  child: Text(
                    "total: ${formatCurrency.format(total)}",
                    style: TextStyle(
                        color: DataColors.blusky,
                        fontSize: 7.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: DataColors.backgroundbutton),
                  child: Text(
                    "telah dibayar: ${formatCurrency.format(terbayar)}",
                    style: TextStyle(
                        color: DataColors.blusky,
                        fontSize: 7.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TagihanExpired extends StatelessWidget {
  final String codeTrans;
  final int nominal;
  final String tanggaldibuat;
  final String tanggalexpired;

  const TagihanExpired({
    Key? key,
    required this.codeTrans,
    required this.nominal,
    required this.tanggaldibuat,
    required this.tanggalexpired,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency =
        NumberFormat.currency(locale: 'id_ID', decimalDigits: 0, symbol: 'Rp ');
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: DataColors.blusky),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: HexColor("#C3D8F6")),
                child: Text(
                  "TAGIHAN NO $codeTrans",
                  style: TextStyle(
                      color: DataColors.primary700,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                formatCurrency.format(nominal),
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: DataColors.primary800,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: DataColors.primary400),
                child: Text(
                  "tanggal dibuat: $tanggaldibuat",
                  style: TextStyle(
                      color: DataColors.blusky,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: DataColors.primary800),
                child: Text(
                  "tanggal expired: $tanggalexpired",
                  style: TextStyle(
                      color: DataColors.blusky,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ]),
      ),
    );
  }
}

class tagihansemester extends StatelessWidget {
  final int semester;
  final int nominal;
  final int total;
  final int terbayar;
  const tagihansemester({
    Key? key,
    required this.semester,
    required this.nominal,
    required this.total,
    required this.terbayar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency =
        NumberFormat.currency(locale: 'id_ID', decimalDigits: 0, symbol: 'Rp');
    return Padding(
      padding: EdgeInsets.only(right: 8.0.sp),
      child: Container(
        height: 150.sp,
        padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 14.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: DataColors.blusky),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Semester ${semester.toString()}",
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: DataColors.primary400,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              formatCurrency.format(nominal),
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: DataColors.primary800,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: DataColors.backgroundbutton),
                  child: Text(
                    "total: ${formatCurrency.format(total)}",
                    style: TextStyle(
                        color: DataColors.blusky,
                        fontSize: 7.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: DataColors.backgroundbutton),
                  child: Text(
                    "telah dibayar: ${formatCurrency.format(terbayar)}",
                    style: TextStyle(
                        color: DataColors.blusky,
                        fontSize: 7.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
