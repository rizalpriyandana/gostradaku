import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/routes/rout_name.dart';
import 'package:gostradav1/app/ui/pages/kategori/upload_bukti_bayar/tambahpembayaran/tp.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import '../../../../controllers/uploadbuktip_c.dart';

class UploadBuktiBayarPage extends StatelessWidget {
  UploadBuktiController controller = Get.put(UploadBuktiController());
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Data Pembayaran',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        foregroundColor: DataColors.primary800,
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
        child: FutureBuilder<dynamic>(
            future: controller.UBB(data['nim']),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: snapshot.data.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return uploadbuktibayar(
                            name: snapshot.data.data[index].name,
                            status: snapshot.data.data[index].isConfirm,
                            kodep: snapshot.data.data[index].codeTrans,
                            nim: snapshot.data.data[index].nim,
                            nominal: snapshot.data.data[index].nominal,
                            index: index);
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
                                image: AssetImage(
                                    "assets/images/datatidakada.png"),
                                height: 100.sp,
                              ),
                              Text(
                                "Tidak Ada Upload Bukti Bayar Saat Ini",
                                style: TextStyle(color: DataColors.Neutral300),
                              ),
                            ],
                          )),
                    );
                  }
              }
            }),
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        margin: const EdgeInsets.only(bottom: 20, top: 10),
        child: ElevatedButton(
          onPressed: () {
            Get.to(TambahPembayaranPage());
          },
          style: ElevatedButton.styleFrom(
            primary: DataColors.primary, // background
            onPrimary: Colors.white, // foreground
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
          child: const Text(
            'Tambah Pembayaran',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

class uploadbuktibayar extends StatelessWidget {
  final String name;
  final String status;
  final String kodep;
  final String nim;

  final String nominal;
  final int index;
  const uploadbuktibayar({
    Key? key,
    required this.name,
    required this.status,
    required this.kodep,
    required this.nim,
    required this.nominal,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency = new NumberFormat.simpleCurrency(locale: 'id_ID');
    return Padding(
      padding: EdgeInsets.only(bottom: 12.sp),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 1.sp,
          color: DataColors.Neutral200,
        ),
        Padding(
          padding: EdgeInsets.all(10.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    ImageIcon(
                      const AssetImage("assets/icon/student.png"),
                      color: DataColors.primary400,
                    ),
                    SizedBox(
                      width: 5.sp,
                    ),
                    Expanded(
                      flex: 4,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 70.sp,
                            child: Text(name,
                                style: TextStyle(
                                    color: DataColors.primary800,
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 10.sp)),
                          ),
                          SizedBox(
                            width: 5.sp,
                          ),
                          Text(nim,
                              style: TextStyle(
                                  color: DataColors.primary800,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 10.sp)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.all(5.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: (status == "1")
                        ? DataColors.primary700
                        : (status == "2")
                            ? Colors.red
                            : Colors.green,
                  ),
                  child: Text(
                    (status == "1")
                        ? "Telah dikonfirmasi"
                        : (status == "2")
                            ? "Telah ditolak"
                            : "Belum dikonfirmasi",
                    style: TextStyle(color: Colors.white, fontSize: 10.sp),
                  )),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.sp),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: DataColors.primary),
                child: Text(
                  kodep,
                  style: TextStyle(
                      color: DataColors.blusky,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                width: 5.sp,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.sp),
          child: Text(
            "Bukti Online",
            style: TextStyle(
                color: DataColors.primary800,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp),
          ),
        ),
        Container(
          height: 1.sp,
          color: DataColors.Neutral200,
        ),
        Padding(
          padding: EdgeInsets.all(10.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formatCurrency.format(int.tryParse(nominal)),
                style: TextStyle(
                    fontSize: 12.sp,
                    color: DataColors.primary800,
                    fontWeight: FontWeight.w600),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(RoutName.detailpembayaran, arguments: index);
                },
                child: Text(
                  "Lihat Rincian",
                  style: TextStyle(
                      color: DataColors.primary600,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 1.sp,
          color: DataColors.Neutral200,
        ),
      ]),
    );
  }
}
