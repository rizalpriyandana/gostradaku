import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/request_surat_c.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:intl/intl.dart';
import '../../../../theme/color.dart';
import 'package:path_provider/path_provider.dart';

class DetailSuratPage extends StatelessWidget {
  RequestSuratController controller = Get.put(RequestSuratController());

  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    var i = Get.arguments;
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Request',
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
          future: controller.detailhistorysurat(data["nim"], i[0]),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasData) {
                  return Stack(
                    children: [
                      SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                              horizontal: 7.5.w, vertical: 2.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.sp),
                                    color: DataColors.primary100),
                                child: Stack(children: [
                                  Container(
                                    padding: EdgeInsets.all(8.sp),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              i[0],
                                              style: TextStyle(
                                                  color: DataColors.primary400,
                                                  fontSize: 12.sp),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.sp,
                                        ),
                                        SizedBox(
                                            width: 50.w,
                                            child: Text(
                                              snapshot.data.surat,
                                              style: TextStyle(
                                                  color: DataColors.primary700,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 13.sp),
                                            ))
                                      ],
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.bottomRight,
                                      child: Image(
                                          image: AssetImage(
                                              "assets/images/amplop.png")))
                                ]),
                              ),
                              SizedBox(
                                height: 10.sp,
                              ),
                              Text(
                                "Riwayat",
                                style: TextStyle(
                                    color: DataColors.primary800,
                                    fontWeight: FontWeight.w600),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                itemCount: snapshot.data.total,
                                itemBuilder: (BuildContext context, int index) {
                                  // DateTime tanggalkeluar = DateTime.parse(
                                  //     snapshot.data.data[index].tanggalKeluar);
                                  String test = "2022-07-02 11:24:10";
                                  DateTime test2 = DateTime.parse(test);
                                  print(DateFormat('MM/dd/yy').format(test2));
                                  return Padding(
                                    padding: EdgeInsets.only(left: 10.sp),
                                    child: TimelineTile(
                                      isFirst: (index == 0) ? true : false,
                                      isLast: (index == snapshot.data.total - 1)
                                          ? true
                                          : false,
                                      beforeLineStyle: LineStyle(
                                          color: DataColors.primary,
                                          thickness: 1.sp),
                                      indicatorStyle: IndicatorStyle(
                                          color: DataColors.primary400,
                                          width: 13.sp),
                                      alignment: TimelineAlign.start,
                                      lineXY: 0,
                                      endChild: Container(
                                        padding: EdgeInsets.all(15.sp),
                                        child:
                                            (snapshot.data.data[index].status ==
                                                    "0")
                                                ? Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "[ " +
                                                            DateFormat(
                                                                    'dd/MM/yyyy HH:mm')
                                                                .format(DateTime
                                                                    .parse(snapshot
                                                                        .data
                                                                        .data[
                                                                            index]
                                                                        .tanggalInput)) +
                                                            " WIB ]",
                                                        style: TextStyle(
                                                            color: DataColors
                                                                .primary800),
                                                      ),
                                                      Text(
                                                        "Sedang Diproses",
                                                        style: TextStyle(
                                                            color: HexColor(
                                                                "#D2A337")),
                                                      ),
                                                    ],
                                                  )
                                                : (snapshot.data.data[index]
                                                            .status ==
                                                        "1")
                                                    ? Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              "[ " +
                                                                  DateFormat(
                                                                          'dd/MM/yyyy HH:mm')
                                                                      .format(DateTime.parse(snapshot
                                                                          .data
                                                                          .data[
                                                                              index]
                                                                          .tanggalKeluar)) +
                                                                  " WIB ]",
                                                              style: TextStyle(
                                                                  color: DataColors
                                                                      .primary800)),
                                                          Text("Disetujui",
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      "#66C155"))),
                                                        ],
                                                      )
                                                    : Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              "[ " +
                                                                  DateFormat(
                                                                          'dd/MM/yyyy HH:mm')
                                                                      .format(DateTime.parse(snapshot
                                                                          .data
                                                                          .data[
                                                                              index]
                                                                          .tanggalKeluar)) +
                                                                  " WIB ]",
                                                              style: TextStyle(
                                                                  color: DataColors
                                                                      .primary800)),
                                                          Text("Ditolak",
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      "#A0321E"))),
                                                        ],
                                                      ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                height: 10.sp,
                              ),
                              (snapshot.data.catatan != "")
                                  ? Container(
                                      padding: EdgeInsets.all(12.sp),
                                      decoration: BoxDecoration(
                                          color: DataColors.Neutral100,
                                          borderRadius:
                                              BorderRadius.circular(12.sp)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Catatan",
                                                style: TextStyle(
                                                    color:
                                                        DataColors.primary700,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 12.sp),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.sp,
                                          ),
                                          Text(
                                            snapshot.data.catatan,
                                            style: TextStyle(
                                                color: DataColors.primary400,
                                                fontSize: 11.sp),
                                          )
                                        ],
                                      ),
                                    )
                                  : Container()
                            ],
                          )),
                      (snapshot.data.unduh == "1")
                          ? Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: 90.w,
                                padding: EdgeInsets.only(bottom: 20.sp),
                                margin:
                                    const EdgeInsets.only(bottom: 20, top: 20),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    ProgressDialog pd =
                                        ProgressDialog(context: context);
                                    final directory =
                                        await getTemporaryDirectory();
                                    controller.downloadsurat(
                                        Dio(),
                                        data["nim"],
                                        i[0],
                                        directory.path + "_Surat.pdf",
                                        pd);

                                    pd.show(
                                        max: 100, msg: 'File Downloading...');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    side: BorderSide(
                                      width: 2.0,
                                      color: DataColors.primary,
                                    ),
                                    primary: DataColors.primary, // background
                                    onPrimary: Colors.white, // foreground
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14.0),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.sp, horizontal: 10.sp),
                                  ),
                                  child: const Text(
                                    'Download Surat',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            )
                          : Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: 90.w,
                                padding: EdgeInsets.only(bottom: 20.sp),
                                margin:
                                    const EdgeInsets.only(bottom: 20, top: 20),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.snackbar('Hi', 'Surat Belum Disetujui');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    side: BorderSide(
                                      width: 2.0,
                                      color: DataColors.Neutral200,
                                    ),
                                    primary:
                                        DataColors.Neutral200, // background
                                    onPrimary: Colors.white, // foreground
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14.0),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.sp, horizontal: 10.sp),
                                  ),
                                  child: Text(
                                    'Download Surat',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: DataColors.Neutral300),
                                  ),
                                ),
                              ),
                            )
                    ],
                  );
                } else {
                  return Text("Tidak Ada Data");
                }
            }
          }),
    );
  }
}
