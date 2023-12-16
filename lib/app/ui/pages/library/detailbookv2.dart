import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/library/library_c.dart';
import 'package:gostradav1/app/routes/rout_name.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:sizer/sizer.dart';

class DetailBuku extends StatefulWidget {
  @override
  State<DetailBuku> createState() => _DetailBukuState();
}

class _DetailBukuState extends State<DetailBuku> with TickerProviderStateMixin {
  var datas = Get.arguments;
  final box = GetStorage();
  bool isBookmarked = false;
  List<String> statusList = [];
  List<String> itemCode = [];
  List<String> availableItemCodes = [];
  List<String> availableItemCodesStatus = [];

  LibraryController lc = Get.find<LibraryController>();

  @override
  void initState() {
    if (datas[12] == "bookmarked") {
      setState(() {
        isBookmarked = true;
      });
    } else if (datas[12] == "not bookmarked") {
      setState(() {
        isBookmarked = false;
      });
    } else {
      setState(() {
        isBookmarked = false;
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController tc = TabController(length: 3, vsync: this);
    Map data = box.read("dataUser") as Map<String, dynamic>;
    var statusData = datas[14];
    var itemData = datas[13];
    List<Widget> rows = [];
    bool canBorrow() {
      return statusData == "Available";
    }

    bool canBorrow2() {
      return statusList.contains("Available");
    }

    if (statusData.contains(', ') && itemData.contains(', ')) {
      // Jika statusData mengandung koma dan spasi, artinya ada lebih dari satu data.
      statusList = statusData.split(', ');
      itemCode = itemData.split(', ');

      if (statusList.length == itemCode.length) {
        for (int i = 0; i < statusList.length; i++) {
          if (statusList[i] == "Available") {
            availableItemCodes.add(itemCode[i]);
            availableItemCodesStatus.add(statusList[i]);
          }
          rows.add(
            Padding(
              padding: EdgeInsets.only(
                right: 13.sp,
                bottom: 10.sp,
              ),
              child: Container(
                padding: EdgeInsets.all(0.sp),
                height: 60.sp,
                width: 265.sp,
                decoration: BoxDecoration(
                  border: Border.all(color: DataColors.primary800, width: 1.5),
                  borderRadius: BorderRadius.circular(8.sp),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.sp, top: 12.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            itemCode[i],
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.bold,
                                color: DataColors.primary800),
                          ),
                          Text(
                            datas[15] ?? "-",
                            style: TextStyle(
                                fontSize: 11.sp, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    // Gantilah dengan lokasi yang sesuai
                    statusList[i] == "Currently on loan"
                        ? Padding(
                            padding: EdgeInsets.only(right: 10.sp),
                            child: Container(
                                padding: EdgeInsets.all(0.sp),
                                height: 38.sp,
                                width: 110.sp,
                                decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(5.sp)),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 3.sp),
                                        child: Text(
                                          statusList[i],
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w500,
                                              color: DataColors.white),
                                        ),
                                      ),
                                      Text(
                                        "(${datas[16]})",
                                        style: TextStyle(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w500,
                                            color: DataColors.white),
                                      ),
                                    ],
                                  ),
                                )),
                          )
                        : Padding(
                            padding: EdgeInsets.only(right: 30.sp),
                            child: Container(
                                padding: EdgeInsets.all(0.sp),
                                height: 30.sp,
                                width: 70.sp,
                                decoration: BoxDecoration(
                                    color: DataColors.bluebutton,
                                    borderRadius: BorderRadius.circular(5.sp)),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 2.sp),
                                    child: Text(
                                      statusList[i],
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w500,
                                          color: DataColors.white),
                                    ),
                                  ),
                                )),
                          )
                  ],
                ),
              ),
            ),
          );
        }
      } else {}
    } else if (itemData == null &&
        statusData == "No Copy data" &&
        datas[15] == null) {
      // Jika statusData hanya berisi satu data, kita tidak perlu membaginya.
      rows.add(Text("Tidak ada data"));
    } else {
      if (statusData == "Available") {
        availableItemCodes.add(itemData);
      }
      rows.add(
        Padding(
          padding: EdgeInsets.only(
            right: 13.sp,
            bottom: 10.sp,
          ),
          child: Container(
            padding: EdgeInsets.all(0.sp),
            height: 60.sp,
            width: 265.sp,
            decoration: BoxDecoration(
              border: Border.all(color: DataColors.primary800, width: 1.5),
              borderRadius: BorderRadius.circular(8.sp),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.sp, top: 12.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        itemData,
                        style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                            color: DataColors.primary800),
                      ),
                      Text(
                        datas[15] ?? "-",
                        style: TextStyle(
                            fontSize: 11.sp, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                // Gantilah dengan lokasi yang sesuai
                statusData == "Currently on loan"
                    ? Padding(
                        padding: EdgeInsets.only(right: 10.sp),
                        child: Container(
                            padding: EdgeInsets.all(0.sp),
                            height: 38.sp,
                            width: 110.sp,
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(5.sp)),
                            child: Center(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 3.sp),
                                    child: Text(
                                      statusData,
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w500,
                                          color: DataColors.white),
                                    ),
                                  ),
                                  Text(
                                    "(${datas[16]})",
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500,
                                        color: DataColors.white),
                                  ),
                                ],
                              ),
                            )),
                      )
                    : Padding(
                        padding: EdgeInsets.only(right: 10.sp),
                        child: Container(
                            padding: EdgeInsets.all(0.sp),
                            height: 30.sp,
                            width: 70.sp,
                            decoration: BoxDecoration(
                                color: DataColors.bluebutton,
                                borderRadius: BorderRadius.circular(5.sp)),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 2.sp),
                                child: Text(
                                  statusData,
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500,
                                      color: DataColors.white),
                                ),
                              ),
                            )),
                      ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: DataColors.bluek,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Detail Buku",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: DataColors.primary800),
          ),
          leading: Padding(
            padding: EdgeInsets.only(top: 11.sp, left: 10.sp),
            child: GestureDetector(
              onTap: () {
                lc.allbook(data['nim']);
                Get.back();
              },
              child: FaIcon(
                FontAwesomeIcons.angleLeft,
                color: DataColors.primary800,
                size: 18.sp,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 11.sp, right: 10.sp),
              child: GestureDetector(
                onTap: () {
                  if (isBookmarked == true) {
                    Get.defaultDialog(
                        onConfirm: () {
                          lc.delete(data['nim'], datas[11].toString());
                          setState(() {
                            isBookmarked = false;
                          });
                          Navigator.of(context).pop(false);
                        },
                        onCancel: () => dispose(),
                        middleText: "Apakah anda yakin ingin hapus data ini ?");
                  } else {
                    lc.addbookmark(data['nim'], datas[11].toString());
                    setState(() {
                      if (lc.ismember == true) {
                        isBookmarked = true;
                      } else {
                        isBookmarked = false;
                      }
                    });
                  }
                },
                child: isBookmarked == true
                    ? FaIcon(
                        FontAwesomeIcons.solidBookmark,
                        color: DataColors.primary800,
                        size: 18.sp,
                      )
                    : FaIcon(
                        FontAwesomeIcons.bookmark,
                        color: DataColors.primary800,
                        size: 18.sp,
                      ),
              ),
            ),
          ],
        ),
        body: WillPopScope(
          onWillPop: () {
            lc.allbook(data['nim']);
            return Future.value(true);
          },
          child: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 125.sp,
                            decoration: BoxDecoration(color: DataColors.bluek),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.only(
                          //       top: 10.sp, right: 10.sp, left: 10.sp),
                          //   child: Row(
                          //     mainAxisSize: MainAxisSize.max,
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       GestureDetector(
                          //         onTap: () {
                          //           Get.back();
                          //         },
                          //         child: FaIcon(
                          //           FontAwesomeIcons.angleLeft,
                          //           color: DataColors.white,
                          //           size: 18.sp,
                          //         ),
                          //       ),
                          //       Text(
                          //         "Detail Buku",
                          //         textAlign: TextAlign.center,
                          //         style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 14.sp,
                          //             color: DataColors.white),
                          //       ),
                          //       FaIcon(
                          //         FontAwesomeIcons.bookmark,
                          //         color: DataColors.white,
                          //         size: 18.sp,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                92.sp, 30.sp, 0.sp, 0.sp),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: DataColors.primary100,
                                    width: 0.75.sp),
                                borderRadius: BorderRadius.circular(8.sp),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.sp),
                                child: Image.network(
                                  datas[0],
                                  width: 115.sp,
                                  height: 145.sp,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 10.sp, top: 10.sp, right: 10.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                          child: Container(
                            padding: EdgeInsets.all(0.sp),
                            height: 40.sp,
                            width: 270.sp,
                            child: Text(
                              datas[1],
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: DataColors.primary800,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(0.sp),
                          height: 15.sp,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              datas[2] ?? "-",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: DataColors.bluepurple,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.sp,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                    child: Container(
                      padding: EdgeInsets.all(0.sp),
                      child: TabBar(
                        controller: tc,
                        isScrollable: true,
                        unselectedLabelColor: DataColors.greyclassy,
                        labelPadding:
                            EdgeInsets.only(left: 10.sp, right: 10.sp),
                        labelColor: DataColors.primary700,
                        indicatorColor: DataColors.primary800,
                        tabs: [
                          Tab(
                            child: Text(
                              "Sinopsis",
                              style: TextStyle(
                                  fontSize: 10.sp, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Informasi Detail",
                              style: TextStyle(
                                  fontSize: 10.sp, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Ketersediaan",
                              style: TextStyle(
                                  fontSize: 10.sp, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.sp, right: 0.sp),
                      child: TabBarView(
                        controller: tc,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 5.sp),
                            child: Text(
                              datas[3] ?? "Tidak ada deskripsi",
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  color: DataColors.primary800),
                              maxLines: 12,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.sp),
                            child: Container(
                              padding: EdgeInsets.all(0.sp),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.sp),
                                        child: Text(
                                          "ISBN",
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.bold,
                                              color: DataColors.primary800),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 95.sp,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          datas[5] ?? "",
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w500,
                                              color: DataColors.primary800),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.sp,
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.sp),
                                        child: Text(
                                          "Penerbit",
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.bold,
                                              color: DataColors.primary800),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 75.sp,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          datas[4] ?? "-",
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w500,
                                              color: DataColors.primary800),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.sp,
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.sp),
                                        child: Text(
                                          "Deskripsi Fisik",
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.bold,
                                              color: DataColors.primary800),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 45.sp,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          datas[6],
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w500,
                                              color: DataColors.primary800),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.sp,
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.sp),
                                        child: Text(
                                          "Bahasa",
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.bold,
                                              color: DataColors.primary800),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 80.sp,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          datas[7] == "en"
                                              ? "English"
                                              : "Bahasa Indoensia",
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w500,
                                              color: DataColors.primary800),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.sp,
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.sp),
                                        child: Text(
                                          "Edisi",
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.bold,
                                              color: DataColors.primary800),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 98.sp,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          datas[8] ?? "-",
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w500,
                                              color: DataColors.primary800),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.sp,
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.sp),
                                        child: Text(
                                          "Subjek",
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.bold,
                                              color: DataColors.primary800),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 85.sp,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          datas[10] ?? "-",
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w500,
                                              color: DataColors.primary800),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.sp,
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.sp),
                                        child: Text(
                                          "Copies",
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.bold,
                                              color: DataColors.primary800),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 84.sp,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          datas[9],
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w500,
                                              color: DataColors.primary800),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.sp,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.sp),
                            child: Container(
                              padding: EdgeInsets.all(0.sp),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: rows,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ),
        bottomNavigationBar: canBorrow() || canBorrow2()
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                margin: EdgeInsets.only(bottom: 10.sp, top: 2.sp),
                color: Colors.transparent,
                child: ElevatedButton(
                  onPressed: () {
                    // Get.snackbar("",datas[11]);
                    Get.toNamed(RoutName.peminjaman,
                        arguments: [availableItemCodes, datas[11]]);
                  },
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 2.0, color: DataColors.primary),
                    backgroundColor: Colors.white,
                    foregroundColor: DataColors.primary700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  child: const Text(
                    "Booking Buku",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              )
            : const SizedBox.shrink());
  }
}
