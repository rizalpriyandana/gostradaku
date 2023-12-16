// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, deprecated_member_use

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/controllers/library/library_c.dart';
import 'package:gostradav1/app/routes/rout_name.dart';
import 'package:gostradav1/app/ui/pages/kategori/lainnya/lainnyav2.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Libraryv2 extends StatefulWidget {
  @override
  State<Libraryv2> createState() => _Libraryv2State();
}

class _Libraryv2State extends State<Libraryv2> {
  LibraryController lc = Get.find<LibraryController>();

  bool vis = true;
  bool visbutton = false;
  final box = GetStorage();
  late Map data = box.read("dataUser") as Map<String, dynamic>;

  @override
  void initState() {
    // lc.showSearchResults.value = false;
    // lc.searchKeywoard.value = '';
    lc.allbook(data['nim']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (lc.isLoading.isTrue) {
        return Scaffold(
          body: Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                  color: DataColors.primary700, size: 40.sp)),
        );
      } else if (lc.listbook.isNotEmpty &&
          lc.notmember == "Anda Sudah Terdaftar Sebagai Member") {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButton: SpeedDial(
            activeIcon: Icons.close,
            icon: Icons.more_horiz_outlined,
            backgroundColor: DataColors.primary600,
            children: [
              // SpeedDialChild(
              //   child: Padding(
              //     padding: EdgeInsets.all(8.sp),
              //     child: Image.asset(
              //       "assets/icon/qr-code.png",
              //       height: 15.sp,
              //       width: 15.sp,
              //       color: DataColors.primary700,
              //     ),
              //   ),
              //   onTap: () {
              //     lc.openUrl("https://lib.strada.ac.id/index.php?p=visitor");
              //   },
              //   label: "Kunjungan",
              //   labelStyle: TextStyle(
              //       color: DataColors.primary, fontWeight: FontWeight.w600),
              // ),
              SpeedDialChild(
                child: FaIcon(
                  FontAwesomeIcons.history,
                  color: DataColors.primary700,
                  size: 15.sp,
                ),
                onTap: () {
                  Get.toNamed(RoutName.booking);
                },
                label: "Booking",
                labelStyle: TextStyle(
                    color: DataColors.primary, fontWeight: FontWeight.w600),
              ),
              SpeedDialChild(
                child: FaIcon(
                  FontAwesomeIcons.history,
                  color: DataColors.primary700,
                  size: 15.sp,
                ),
                onTap: () {
                  Get.toNamed(RoutName.historypeminjaman);
                },
                label: "History Peminjaman",
                labelStyle: TextStyle(
                    color: DataColors.primary, fontWeight: FontWeight.w600),
              ),
              SpeedDialChild(
                child: FaIcon(
                  FontAwesomeIcons.bookmark,
                  color: DataColors.primary700,
                  size: 15.sp,
                ),
                onTap: () {
                  Get.toNamed(RoutName.bookmark);
                },
                label: "Bookmark",
                labelStyle: TextStyle(
                    color: DataColors.primary, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          // backgroundColor: DataColors.greywhite,
          body: RefreshIndicator(
            onRefresh: () => lc.allbook(data['nim']),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 15.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 200.sp,
                                decoration:
                                    BoxDecoration(color: DataColors.primary100),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 62.sp, left: 105.sp),
                                      child: Container(
                                        padding: EdgeInsets.all(0.sp),
                                        height: 110.sp,
                                        // width: 100.sp,
                                        child: Image.asset(
                                          'assets/images/backgroundlibrary.png',
                                          // height: 110.sp,
                                          // width: 400.sp,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.sp, 5.sp, 20.sp, 0.sp),
                                      child: SizedBox(
                                        height: 52.sp,
                                        width: double.infinity,
                                        child: Obx(
                                          () => TextFormField(
                                            controller: lc.sc,
                                            onChanged: (keyword) {
                                              lc.searchKeywoard.value = keyword;
                                            },
                                            onFieldSubmitted: (keyword) {
                                              if (keyword.isEmpty) {
                                                lc.showSearchResults.value =
                                                    false;
                                                // Get.snackbar("hi", "aaa");
                                                setState(() {
                                                  vis = true;
                                                });
                                              } else if (keyword.isNotEmpty) {
                                                lc.searchbykey(keyword);
                                                // Get.snackbar("hi", "ss");
                                                // lc.searchBooks(
                                                //   keyword, lc.selectedTopics, lc.selectedYears);
                                                lc.keywordku = keyword;
                                              }
                                            },
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                                color: DataColors.primary800),
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(
                                                  bottom: 25.sp),
                                              hintText: "Cari....",
                                              hintStyle: TextStyle(
                                                  color: DataColors.primary400,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w100),
                                              prefixIcon: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 8.sp,
                                                    right: 5.sp,
                                                    top: 8.sp,
                                                    bottom: 8.sp),
                                                child: Image.asset(
                                                  "assets/icon/search.png",
                                                  height: 20.sp,
                                                  width: 20.sp,
                                                  color: DataColors.primary800,
                                                ),
                                              ),
                                              suffixIcon: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  lc.searchKeywoard.isEmpty
                                                      ? SizedBox.shrink()
                                                      : Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 8.sp,
                                                                  right: 0.sp,
                                                                  top: 8.sp,
                                                                  bottom: 8.sp),
                                                          child: InkWell(
                                                            onTap: () {
                                                              lc.sc.clear();
                                                              lc.searchResults
                                                                  .clear();
                                                              lc.filteredResults
                                                                  .clear();
                                                              lc.showSearchResults
                                                                      .value =
                                                                  false;
                                                              lc.searchKeywoard
                                                                  .value = '';
                                                            },
                                                            child: Icon(
                                                              Icons.close,
                                                              size: 15.sp,
                                                              color: DataColors
                                                                  .primary800,
                                                            ),
                                                          ),
                                                        ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 8.sp,
                                                        right: 8.sp,
                                                        top: 8.sp,
                                                        bottom: 8.sp),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // lc.selectedTopics.clear();
                                                        // lc.selectedYears.clear();
                                                        // lc.showSearchResults.value = false;
                                                        showModalBottomSheet(

                                                            // isScrollControlled: true,
                                                            // enableDrag: true,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(15
                                                                            .sp),
                                                                    topRight: Radius
                                                                        .circular(15
                                                                            .sp))),
                                                            context: context,
                                                            builder:
                                                                (context) =>
                                                                    Filter());
                                                      },
                                                      child: Container(
                                                        height: 30.sp,
                                                        width: 30.sp,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.sp),
                                                            color: DataColors
                                                                .primary600),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  6.sp),
                                                          child: Image.asset(
                                                            "assets/icon/filter.png",
                                                            height: 25.sp,
                                                            width: 25.sp,
                                                            color: DataColors
                                                                .primary100,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              filled: true,
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: DataColors.primary700,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.sp),
                                              ),
                                              fillColor: DataColors.white,
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: DataColors
                                                          .primary800),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.sp)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.sp, 10.sp, 0.sp, 0.sp),
                                child: Text(
                                  'STRADA LIBRARY',
                                  style: TextStyle(
                                    color: DataColors.primary800,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.sp, 40.sp, 80.sp, 0.sp),
                                child: Text(
                                  '\"Carilah buku yang Anda suka. Tulislah sebagaimana Anda ingin membaca buku yang disuka.\" - Dewi Lestari',
                                  style: TextStyle(
                                      color: DataColors.primary800,
                                      fontSize: 10.sp,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w500
                                      // height: 1.5
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Obx(
                      //   () {
                      //     if (lc.showSearchResults.value) {
                      //       return Padding(
                      //         padding: EdgeInsets.only(top: 15.sp, right: 10.sp),
                      //         child: GridView.builder(
                      //           shrinkWrap: true,
                      //           gridDelegate:
                      //               SliverGridDelegateWithFixedCrossAxisCount(
                      //                   crossAxisCount: 2, childAspectRatio: 0.525),
                      //           scrollDirection: Axis.vertical,
                      //           physics: NeverScrollableScrollPhysics(),
                      //           itemCount: lc.searchResults.length,
                      //           itemBuilder: (context, index) {
                      //             var buku = lc.searchResults[index];
                      //             return GestureDetector(
                      //               onTap: () {
                      //                 Get.snackbar("Strada Library",
                      //                     "Ini adalah ${lc.listbuku[index].title}");
                      //               },
                      //               child: ContentSearch(
                      //                 gambar: buku.gambar,
                      //                 title: buku.title,
                      //                 penulis: buku.penulis,
                      //                 copies: buku.copies,
                      //               ),
                      //             );
                      //           },
                      //         ),
                      //       );
                      //     } else {
                      //       return ContentUtama(lc: lc);
                      //     }
                      //   },
                      // ),
                      Obx(
                        () {
                          if (lc.showSearchResults.value) {
                            if (lc.searchResults.isEmpty) {
                              // Tampilkan Lottie file jika tidak ada hasil pencarian
                              return Padding(
                                padding: EdgeInsets.only(top: 50.sp),
                                child: Center(
                                  child: Lottie.asset(
                                    'assets/icon/nodata.json',
                                    width: 180.sp,
                                    height: 180.sp,
                                    // fit: BoxFit.contain,
                                  ),
                                ),
                              );
                            } else {
                              // Tampilkan hasil pencarian
                              return Padding(
                                padding:
                                    EdgeInsets.only(top: 15.sp, right: 10.sp),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                        onTap: () {
                                          lc.showSearchResults.value = false;
                                        },
                                        child: Icon(
                                          Icons.close,
                                          size: 15.sp,
                                          color: DataColors.primary800,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    GridView.builder(
                                      shrinkWrap: true,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 0.525),
                                      scrollDirection: Axis.vertical,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: lc.searchResults.length,
                                      itemBuilder: (context, index) {
                                        var buku = lc.searchResults[index];
                                        var statusData = buku.data[0].status;
                                        var itemData = buku.data[0].itemCode;
                                        List<String> statusList = [];
                                        int stok = 0;
                                        List<String> itemCode = [];
                                        if (statusData.contains(', ') &&
                                            itemData!.contains(', ')) {
                                          statusList = statusData.split(', ');
                                          itemCode = itemData.split(', ');
                                          if (statusList.length ==
                                              itemCode.length) {
                                            for (int i = 0;
                                                i < statusList.length;
                                                i++) {
                                              String itemCodelist = itemCode[i];
                                              String status = statusList[i];

                                              if (status == "Available") {
                                                stok++;
                                              }
                                            }
                                          } else {}
                                        } else {
                                          if (statusData == "Available") {
                                            stok++;
                                          }
                                        }
                                        return GestureDetector(
                                          onTap: () {
                                            Get.toNamed(RoutName.detailbook,
                                                arguments: [
                                                  buku.data[0].image,
                                                  buku.data[0].title,
                                                  buku.data[0].authorname,
                                                  buku.data[0].notes,
                                                  buku.data[0].publisher,
                                                  buku.data[0].isbnIssn,
                                                  buku.data[0].collation,
                                                  buku.data[0].language,
                                                  buku.data[0].edition,
                                                  buku.data[0].total,
                                                  buku.data[0].topic,
                                                  buku.data[0].biblioId,
                                                  buku.data[0].bookmarkStatus,
                                                  buku.data[0].itemCode,
                                                  buku.data[0].status,
                                                  buku.data[0].location,
                                                  buku.data[0].duedate
                                                ]);
                                          },
                                          child: ContentSearch(
                                            gambar: buku.data[0].image,
                                            title: buku.data[0].title,
                                            penulis:
                                                buku.data[0].authorname ?? "",
                                            copies: stok.toString(),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            }
                          } else {
                            // Tampilkan daftar buku awal
                            return ContentUtama(lc: lc);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      } else {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: RefreshIndicator(
                onRefresh: () => lc.allbook(data['nim']),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 15.sp),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 250.sp),
                          child: Column(
                            children: [
                              Center(child: GestureDetector(onTap: () => lc.allbook(data['nim']),child: Icon(Icons.refresh, size: 20.sp,))),
                              Padding(
                                padding:  EdgeInsets.only(top: 10.sp),
                                child: Center(
                                    child: Text(
                                  "Anda Belum Terdaftar Sebagai Member, Silahkan Registrasi telebih dahulu",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                      color: DataColors.black),
                                  textAlign: TextAlign.center,
                                )),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: GestureDetector(
                              onTap: () {
                                lc.register(
                                    data['name'],
                                    "0000-00-00",
                                    data['nim'],
                                    "L",
                                    "Jalan",
                                    "0215469874",
                                    "test@gmail.com",
                                    data['nim']);
                              },
                              child: Container(
                                height: 35.sp,
                                width: 100.sp,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.sp),
                                    color: DataColors.primary800),
                                child: Center(
                                    child: Obx(() => lc.loadingregister.isTrue
                                        ? SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                                color: DataColors.white,
                                                strokeWidth: 2.0),
                                          )
                                        : Text(
                                            "Registrasi",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold,
                                                color: DataColors.white),
                                          ))),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));
      }
    });
  }
}

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  LibraryController lc = Get.find<LibraryController>();

  bool vis = true;
  bool visbutton = false;

  List<String> searchbookfilter = [];
  String topicku = "";
  bool statusfilter = false;
  // int index;
  // List<Widget> filterChips = [];

  @override
  Widget build(BuildContext context) {
    int index;
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.56,
          padding: EdgeInsets.all(0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5.sp),
                child: Center(
                  child: Text(
                    "Filter",
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: DataColors.primary800),
                  ),
                ),
              ),
              SizedBox(
                height: 5.sp,
              ),

              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 6.sp),
                      child: Container(
                        height: 215.sp,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 1.sp),
                              child: Text(
                                "Topic",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: DataColors.primary700),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 1.sp),
                              child: Text(
                                "Pilih topic yang anda inginkan",
                                style: TextStyle(
                                    fontSize: 10.5.sp,
                                    fontWeight: FontWeight.w500,
                                    color: DataColors.primary700),
                              ),
                            ),
                            Wrap(
                              spacing:
                                  2.sp, // Spasi antara item dalam satu baris
                              runSpacing: 1.0.sp, // Spasi vertikal antara baris
                              children: List.generate(
                                lc.topics.length,
                                (index) {
                                  final topic = lc.topics[index];
                                  return Row(
                                    mainAxisSize: MainAxisSize
                                        .min, // Baris akan mengikuti ukuran anak-anaknya
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 0.sp, right: 0.sp),
                                        child: FilterChip(
                                          backgroundColor:
                                              lc.selectedFilters[index]
                                                  ? DataColors.primary800
                                                  : DataColors.primary,
                                          selectedColor: DataColors.primary800,
                                          label: Text(
                                            topic,
                                            style: TextStyle(
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w500,
                                                color: DataColors.white),
                                          ),
                                          onSelected: (bool selected) {
                                            // Get.snackbar("Topic", lc.selectedFilters[index].toString());
                                            if (selected == true &&
                                                lc.selectedFilters[index] ==
                                                    false) {
                                              lc.selectedTopics.add(topic);
                                              setState(() {
                                                lc.selectedFilters[index] =
                                                    true;

                                                visbutton = true;
                                              });
                                              // Get.snackbar(
                                              //     "Topic", lc.topics[index]);
                                            } else if (selected == true &&
                                                lc.selectedFilters[index] ==
                                                    true) {
                                              lc.selectedTopics.remove(topic);
                                              setState(() {
                                                lc.selectedFilters[index] =
                                                    false;
                                                visbutton = false;
                                                // Get.snackbar(
                                                //     "Topic",
                                                //     lc.selectedFilters[index]
                                                //         .toString());
                                              });
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 7.sp, right: 2.sp, top: 2.sp),
                      child: Container(
                        height: 107.sp,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 1.sp, top: 0.sp),
                              child: Text(
                                "Tahun Publikasi",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: DataColors.primary700),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 1.sp),
                              child: Text(
                                "Pilih tahun publikasi buku yang anda inginkan",
                                style: TextStyle(
                                    fontSize: 10.5.sp,
                                    fontWeight: FontWeight.w500,
                                    color: DataColors.primary700),
                              ),
                            ),
                            Wrap(
                              spacing:
                                  2.sp, // Spasi antara item dalam satu baris
                              runSpacing: 0.sp, // Spasi vertikal antara baris
                              children: List.generate(
                                lc.years.length,
                                (index) {
                                  final year = lc.years[index];
                                  return Row(
                                    mainAxisSize: MainAxisSize
                                        .min, // Baris akan mengikuti ukuran anak-anaknya
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 0.sp, right: 0.sp),
                                        child: FilterChip(
                                          backgroundColor:
                                              lc.selectedYear[index]
                                                  ? DataColors.primary800
                                                  : DataColors.primary,
                                          // selectedColor: DataColors.primary800,
                                          label: Text(
                                            year.toString(), // Menampilkan tahun
                                            style: TextStyle(
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w500,
                                                color: DataColors.white),
                                          ),
                                          onSelected: (bool selected) {
                                            if (selected == true &&
                                                lc.selectedYear[index] ==
                                                    false) {
                                              lc.selectedYears
                                                  .add(year.toString());
                                              setState(() {
                                                lc.selectedYear[index] =
                                                    selected;

                                                // Get.snackbar("Year",
                                                //     lc.years[index].toString());
                                              });
                                            } else if (selected == true &&
                                                lc.selectedYear[index] ==
                                                    true) {
                                              lc.selectedYears
                                                  .remove(year.toString());
                                              setState(() {
                                                lc.selectedYear[index] = false;
                                              });
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 95.sp,
              // ),
              // FloatingActionButton(onPressed: (){},child: Icon(Icons.search)),
            ],
          ),
        ),
        Positioned(
          bottom: 16.0, // Sesuaikan dengan posisi vertikal yang Anda inginkan
          right: 16.0, // Sesuaikan dengan posisi horizontal yang Anda inginkan
          child: FloatingActionButton(
            // backgroundColor: DataColors.primary800,
            onPressed: () {
              // Get.snackbar("title", lc.selectedYears.toString());
              if (lc.selectedTopics.isNotEmpty && lc.selectedYears.isEmpty) {
                lc.searchBookFilter(lc.selectedTopics, lc.selectedYears);
                // lc.selectedTopics.clear();
                // Get.snackbar("title", "asas");
                Navigator.pop(context);
              } else if (lc.keywordku.isNotEmpty &&
                  lc.searchResults.isNotEmpty &&
                  lc.filteredResults.isNotEmpty &&
                  lc.selectedTopics.isNotEmpty) {
                lc.searchbykeyandtopic(lc.selectedTopics);
                // Get.snackbar("title", lc.selectedTopics.toString());
                // lc.selectedTopics.clear();
                // lc.selectedYears.clear();
                Navigator.pop(context);
              } else if (lc.keywordku.isNotEmpty &&
                  lc.searchResults.isNotEmpty &&
                  lc.filteredResults.isNotEmpty &&
                  lc.selectedYears.isNotEmpty) {
                lc.searchbykeyandtahun(lc.selectedYears);
                lc.selectedYears.clear();
                Navigator.pop(context);
              } else if (lc.keywordku.isNotEmpty &&
                  lc.searchResults.isNotEmpty &&
                  lc.filteredResults.isNotEmpty &&
                  lc.selectedYears.isNotEmpty &&
                  lc.selectedTopics.isNotEmpty) {
                lc.searchbyktt(lc.selectedYears, lc.selectedTopics);
                lc.selectedTopics.clear();
                lc.selectedYears.clear();
                Navigator.pop(context);
              } else if (lc.selectedYears.isNotEmpty &&
                  lc.selectedTopics.isEmpty) {
                lc.searchBookFilter(lc.selectedTopics, lc.selectedYears);
                lc.selectedYears.clear();
                Navigator.pop(context);
              } else if (lc.selectedYears.isEmpty &&
                  lc.selectedTopics.isEmpty) {
                lc.showSearchResults.value = false;
                Navigator.pop(context);
              } else if (lc.selectedYears.isNotEmpty &&
                  lc.selectedTopics.isNotEmpty) {
                lc.searchBookFilter(lc.selectedTopics, lc.selectedYears);
                lc.selectedYears.clear();
                lc.selectedTopics.clear();
                Navigator.pop(context);
              }
            },
            child: FaIcon(FontAwesomeIcons.search,
                color: DataColors.white, size: 18.sp),
          ),
        ),
      ],
    );
  }
}

class ContentUtama extends StatelessWidget {
  const ContentUtama({
    Key? key,
    required this.lc,
  }) : super(key: key);

  final LibraryController lc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 15.sp,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.sp),
                    child: Text(
                      "Populer Buku",
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          color: DataColors.primary700),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.sp),
                    child: Text(
                      "Yuk pilih bukumu, banyak buku populer disini",
                      style: TextStyle(
                          fontSize: 10.5.sp,
                          fontWeight: FontWeight.w500,
                          color: DataColors.primary700),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(RoutName.popularbook);
                },
                child: Padding(
                    padding: EdgeInsets.only(right: 12.sp, top: 3.sp),
                    child: lc.filteringbook.length > 4
                        ? Image.asset(
                            'assets/icon/arrowright.png',
                            height: 18.sp,
                            width: 18.sp,
                            color: DataColors.primary800,
                          )
                        : SizedBox.shrink()),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Container(
          padding: EdgeInsets.only(right: 0.sp),
          height: 280.sp,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                lc.filteringbook.length > 4 ? 4 : lc.filteringbook.length,
            itemBuilder: (context, index) {
              final datalist = lc.filteringbook[index];
              var statusData = datalist.data[0].status;
              var itemData = datalist.data[0].itemCode;
              List<String> statusList = [];
              int stok = 0;
              List<String> itemCode = [];
              if (statusData.contains(', ') && itemData!.contains(', ')) {
                statusList = statusData.split(', ');
                itemCode = itemData.split(', ');
                if (statusList.length == itemCode.length) {
                  for (int i = 0; i < statusList.length; i++) {
                    String itemCodelist = itemCode[i];
                    String status = statusList[i];

                    if (status == "Available") {
                      stok++;
                    }
                  }
                } else {}
              } else {
                if (statusData == "Available") {
                  stok++;
                }
              }
              return GestureDetector(
                onTap: () {
                  Get.toNamed(RoutName.detailbook, arguments: [
                    datalist.data[0].image,
                    datalist.data[0].title,
                    datalist.data[0].authorname,
                    datalist.data[0].notes,
                    datalist.data[0].publisher,
                    datalist.data[0].isbnIssn,
                    datalist.data[0].collation,
                    datalist.data[0].language,
                    datalist.data[0].edition,
                    datalist.data[0].total,
                    datalist.data[0].topic,
                    datalist.data[0].biblioId,
                    datalist.data[0].bookmarkStatus,
                    datalist.data[0].itemCode,
                    datalist.data[0].status,
                    datalist.data[0].location,
                    datalist.data[0].duedate
                  ]);
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 5.sp),
                  child: ContentBuku(
                    gambar: datalist.data[0].image,
                    title: datalist.data[0].title,
                    penulis: datalist.data[0].authorname ?? "",
                    copies: stok.toString(),
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.sp, left: 10.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Koleksi Buku Terbaru",
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: DataColors.primary700),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0.sp),
                    child: Text(
                      "Yuk pilih bukumu, banyak buku baru disini",
                      style: TextStyle(
                          fontSize: 10.5.sp,
                          fontWeight: FontWeight.w500,
                          color: DataColors.primary700),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(RoutName.koleksibook);
                },
                child: Padding(
                    padding: EdgeInsets.only(right: 12.sp, top: 3.sp),
                    child: lc.listbook.length > 4
                        ? Image.asset(
                            'assets/icon/arrowright.png',
                            height: 18.sp,
                            width: 18.sp,
                            color: DataColors.primary800,
                          )
                        : SizedBox.shrink()),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Container(
          padding: EdgeInsets.all(0.sp),
          height: 280.sp,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: lc.listbook.length > 4 ? 4 : lc.listbook.length,
            itemBuilder: (context, index) {
              final datalist = lc.listbook[index];
              var statusData = datalist.data[0].status;
              var itemData = datalist.data[0].itemCode;
              List<String> statusList = [];
              int stok = 0;
              List<String> itemCode = [];
              if (statusData.contains(', ') && itemData!.contains(', ')) {
                statusList = statusData.split(', ');
                itemCode = itemData.split(', ');
                if (statusList.length == itemCode.length) {
                  for (int i = 0; i < statusList.length; i++) {
                    String itemCodelist = itemCode[i];
                    String status = statusList[i];

                    if (status == "Available") {
                      stok++;
                    }
                  }
                } else {}
              } else {
                if (statusData == "Available") {
                  stok++;
                }
              }
              return GestureDetector(
                onTap: () {
                  Get.toNamed(RoutName.detailbook, arguments: [
                    datalist.data[0].image,
                    datalist.data[0].title,
                    datalist.data[0].authorname,
                    datalist.data[0].notes,
                    datalist.data[0].publisher,
                    datalist.data[0].isbnIssn,
                    datalist.data[0].collation,
                    datalist.data[0].language,
                    datalist.data[0].edition,
                    datalist.data[0].total,
                    datalist.data[0].topic,
                    datalist.data[0].biblioId,
                    datalist.data[0].bookmarkStatus,
                    datalist.data[0].itemCode,
                    datalist.data[0].status,
                    datalist.data[0].location,
                    datalist.data[0].duedate
                  ]);
                },
                child: ContentBuku(
                  gambar: datalist.data[0].image,
                  title: datalist.data[0].title,
                  penulis: datalist.data[0].authorname ?? "",
                  copies: stok.toString(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ContentUtama2 extends StatelessWidget {
  const ContentUtama2({
    Key? key,
    required this.lc,
  }) : super(key: key);

  final LibraryController lc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 15.sp,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.sp),
                    child: Text(
                      "Populer Buku",
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          color: DataColors.primary700),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.sp),
                    child: Text(
                      "Yuk pilih bukumu, banyak buku populer disini",
                      style: TextStyle(
                          fontSize: 10.5.sp,
                          fontWeight: FontWeight.w500,
                          color: DataColors.primary700),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(RoutName.popularbook);
                },
                child: Padding(
                    padding: EdgeInsets.only(right: 12.sp, top: 3.sp),
                    child: lc.filteringbook2.length > 4
                        ? Image.asset(
                            'assets/icon/arrowright.png',
                            height: 18.sp,
                            width: 18.sp,
                            color: DataColors.primary800,
                          )
                        : SizedBox.shrink()),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Container(
          padding: EdgeInsets.only(right: 0.sp),
          height: 280.sp,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                lc.filteringbook2.length > 4 ? 4 : lc.filteringbook2.length,
            itemBuilder: (context, index) {
              final datalist = lc.filteringbook2[index];
              var statusData = datalist.data[0].status;
              var itemData = datalist.data[0].itemCode;
              List<String> statusList = [];
              int stok = 0;
              List<String> itemCode = [];
              if (statusData.contains(', ') && itemData!.contains(', ')) {
                statusList = statusData.split(', ');
                itemCode = itemData.split(', ');
                if (statusList.length == itemCode.length) {
                  for (int i = 0; i < statusList.length; i++) {
                    String itemCodelist = itemCode[i];
                    String status = statusList[i];

                    if (status == "Available") {
                      stok++;
                    }
                  }
                } else {}
              } else {
                if (statusData == "Available") {
                  stok++;
                }
              }
              return GestureDetector(
                onTap: () {
                  Get.toNamed(RoutName.detailbook, arguments: [
                    datalist.data[0].image,
                    datalist.data[0].title,
                    datalist.data[0].authorname,
                    datalist.data[0].notes,
                    datalist.data[0].publisher,
                    datalist.data[0].isbnIssn,
                    datalist.data[0].collation,
                    datalist.data[0].language,
                    datalist.data[0].edition,
                    datalist.data[0].total,
                    datalist.data[0].topic,
                    datalist.data[0].biblioId,
                    datalist.data[0].bookmarkStatus,
                    datalist.data[0].itemCode,
                    datalist.data[0].status,
                    datalist.data[0].location,
                    datalist.data[0].duedate
                  ]);
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 5.sp),
                  child: ContentBuku(
                    gambar: datalist.data[0].image,
                    title: datalist.data[0].title,
                    penulis: datalist.data[0].authorname ?? "",
                    copies: stok.toString(),
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.sp, left: 10.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Koleksi Buku Terbaru",
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: DataColors.primary700),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0.sp),
                    child: Text(
                      "Yuk pilih bukumu, banyak buku baru disini",
                      style: TextStyle(
                          fontSize: 10.5.sp,
                          fontWeight: FontWeight.w500,
                          color: DataColors.primary700),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(RoutName.koleksibook);
                },
                child: Padding(
                    padding: EdgeInsets.only(right: 12.sp, top: 3.sp),
                    child: lc.listbook2.length > 4
                        ? Image.asset(
                            'assets/icon/arrowright.png',
                            height: 18.sp,
                            width: 18.sp,
                            color: DataColors.primary800,
                          )
                        : SizedBox.shrink()),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Container(
          padding: EdgeInsets.all(0.sp),
          height: 280.sp,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: lc.listbook2.length > 4 ? 4 : lc.listbook2.length,
            itemBuilder: (context, index) {
              final datalist = lc.listbook2[index];
              var statusData = datalist.data[0].status;
              var itemData = datalist.data[0].itemCode;
              List<String> statusList = [];
              int stok = 0;
              List<String> itemCode = [];
              if (statusData.contains(', ') && itemData!.contains(', ')) {
                statusList = statusData.split(', ');
                itemCode = itemData.split(', ');
                if (statusList.length == itemCode.length) {
                  for (int i = 0; i < statusList.length; i++) {
                    String itemCodelist = itemCode[i];
                    String status = statusList[i];

                    if (status == "Available") {
                      stok++;
                    }
                  }
                } else {}
              } else {
                if (statusData == "Available") {
                  stok++;
                }
              }
              return GestureDetector(
                onTap: () {
                  Get.toNamed(RoutName.detailbook, arguments: [
                    datalist.data[0].image,
                    datalist.data[0].title,
                    datalist.data[0].authorname,
                    datalist.data[0].notes,
                    datalist.data[0].publisher,
                    datalist.data[0].isbnIssn,
                    datalist.data[0].collation,
                    datalist.data[0].language,
                    datalist.data[0].edition,
                    datalist.data[0].total,
                    datalist.data[0].topic,
                    datalist.data[0].biblioId,
                    datalist.data[0].bookmarkStatus,
                    datalist.data[0].itemCode,
                    datalist.data[0].status,
                    datalist.data[0].location,
                    datalist.data[0].duedate
                  ]);
                },
                child: ContentBuku(
                  gambar: datalist.data[0].image,
                  title: datalist.data[0].title,
                  penulis: datalist.data[0].authorname ?? "",
                  copies: stok.toString(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ContentBuku extends StatelessWidget {
  String title;
  String penulis;
  String copies;
  String gambar;

  ContentBuku({
    required this.title,
    required this.penulis,
    required this.gambar,
    required this.copies,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 0.sp,
        left: 10.sp,
        bottom: 10.sp,
      ),
      child: Container(
        width: 130.sp,
        height: 160.sp,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0x33000000)),
          boxShadow: [
            BoxShadow(
              blurRadius: 4.sp,
              color: Color(0x33000000),
              offset: Offset(0, 2.sp),
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.sp, left: 6.sp),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: DataColors.greyclassy, width: 0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    gambar,
                    width: 115.sp,
                    height: 145.sp,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 7.sp, top: 5.sp),
              child: Container(
                padding: EdgeInsets.all(0.sp),
                // height: 50.sp,
                child: RichText(
                  text: TextSpan(
                    text: title,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: DataColors.primary800,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 7.sp, top: 0.sp),
              child: Container(
                padding: EdgeInsets.all(0.sp),
                height: 35.sp,
                child: RichText(
                  text: TextSpan(
                    text: penulis,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: DataColors.bluepurple,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.sp, left: 60.sp),
              child: Text(
                'Tersedia $copies',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: DataColors.primary700,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContentSearch extends StatelessWidget {
  String title;
  String penulis;
  String copies;
  String gambar;

  ContentSearch({
    required this.title,
    required this.penulis,
    required this.gambar,
    required this.copies,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 0.sp,
        left: 10.sp,
        bottom: 10.sp,
      ),
      child: Container(
        width: 125.sp,
        height: 170.sp,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0x33000000)),
          boxShadow: [
            BoxShadow(
              blurRadius: 4.sp,
              color: Color(0x33000000),
              offset: Offset(0, 2.sp),
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.sp, left: 8.5.sp),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: DataColors.greyclassy, width: 0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    gambar,
                    width: 115.sp,
                    height: 145.sp,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 9.sp, top: 5.sp),
              child: Container(
                padding: EdgeInsets.all(0.sp),
                // height: 50.sp,
                child: RichText(
                  text: TextSpan(
                    text: title,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: DataColors.primary800,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 9.sp, top: 0.sp),
              child: Container(
                padding: EdgeInsets.all(0.sp),
                height: 35.sp,
                child: RichText(
                  text: TextSpan(
                    text: penulis,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: DataColors.bluepurple,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.sp, left: 57.sp),
              child: Text(
                'Tersedia $copies',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: DataColors.primary700,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
