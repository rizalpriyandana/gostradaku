// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/library/library_c.dart';
import 'package:gostradav1/app/data/models/library/library_m.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Bookmark extends StatefulWidget {
  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  var isLoading = true.obs;
  RxList<BookmarkModel> listbookmark = <BookmarkModel>[].obs;
  LibraryController lc = Get.find<LibraryController>();
  final box = GetStorage();
  late Map data = box.read("dataUser") as Map<String, dynamic>;

  @override
  void initState() {
    if (isLoading.isTrue) {
      // Hanya panggil bookmark jika isLoading masih true
      bookmark(data['nim']);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: DataColors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Bookmark",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: DataColors.primary800),
          ),
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
        ),
        body: WillPopScope(
          onWillPop: () {
            lc.allbook(data['nim']);
            return Future.value(true);
          },
          child: Obx(
            () {
              if (isLoading.isTrue) {
                return Center(
                    child: LoadingAnimationWidget.fourRotatingDots(
                        color: DataColors.primary700, size: 40.sp));
              } else if (listbookmark.isEmpty) {
                return Center(
                  child: SizedBox(
                    width: 100.w,
                    height: 20.h,
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: const AssetImage(
                              'assets/images/datatidakada.png'),
                          height: 110.sp,
                        ),
                        Text(
                          "Belum Ada Data",
                          style: TextStyle(color: DataColors.Neutral300),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return Container(
                  padding: EdgeInsets.only(
                      left: 10.sp, right: 10.sp, bottom: 10.sp, top: 0.sp),
                  child: Padding(
                    padding: EdgeInsets.all(0.sp),
                    child: ListView.builder(
                      itemCount: listbookmark.length,
                      itemBuilder: (context, index) {
                        final datalist = listbookmark[index];
                        return ContentBookmark(
                          title: datalist.data[0].title,
                          authorName: datalist.data[0].authorName,
                          created: datalist.data[0].createdAt,
                          onTapHapus: () {
                            Get.defaultDialog(
                                onConfirm: () => delete(data['nim'],
                                    datalist.data[0].biblioId.toString()),
                                onCancel: () => dispose(),
                                middleText:
                                    "Apakah anda yakin ingin hapus data?");
                          },
                        );
                      },
                    ),
                  ),
                );
              }
            },
          ),
        ));
  }

  bookmark(String memberId) async {
    final Map<String, dynamic> databody = {
      Library.memberId: memberId,
    };

    var response = await http.post(
        Uri.parse("https://lib.strada.ac.id/index.php?p=api/biblio/bookmark"),
        body: databody);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['error'] == true) {
        isLoading.value = false;
        return null;
      } else {
        var result = BookmarkModel.fromJson(data);
        listbookmark.value = result.data
            .map((datab) => BookmarkModel(error: false, data: [datab]))
            .toList();
        isLoading.value = false;
      }
    } else {
      Get.snackbar("Hi", "Gagal Memuat Data");
    }
  }

  delete(String memberId, biblioId) async {
    final Map<String, dynamic> databody = {
      Library.memberId: memberId,
      Library.biblioId: biblioId
    };
    var response = await http.post(
        Uri.parse(
            "https://lib.strada.ac.id/index.php?p=api/biblio/deletebookmark"),
        body: databody);

    if (response.statusCode == 200) {
      final convertedBiblioId =
          int.parse(databody[Library.biblioId].toString());
      Get.back();
      listbookmark
          .removeWhere((data) => data.data[0].biblioId == convertedBiblioId);

      Get.snackbar('Sucsess', 'Data berhasil dihapus');
    } else {
      Get.snackbar('Galat', 'Data tidak berhasil dihapus');
    }
  }
}

class ContentBookmark extends StatelessWidget {
  String title;
  String authorName;
  DateTime created;
  final VoidCallback onTapHapus;

  ContentBookmark(
      {Key? key,
      required this.title,
      required this.authorName,
      required this.created,
      required this.onTapHapus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.sp, 8.sp, 0.sp, 0.sp),
      child: Container(
        width: double.infinity,
        height: 90.sp,
        decoration: BoxDecoration(
          color: Color(0xFFDDE9FA),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: DataColors.blackshadow,
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          5.sp, 11.sp, 0.sp, 0.sp),
                      child: Container(
                        width: 105.sp,
                        height: 20.sp,
                        decoration: BoxDecoration(
                          color: DataColors.primary800,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            DateFormat('dd MMMM yyyy').format(created),
                            style: TextStyle(
                              color: DataColors.white,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        onTapHapus();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 100.sp, top: 11.sp),
                        child: Container(
                          width: 60.sp,
                          height: 20.sp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.sp),
                            border: Border.all(
                                color: Colors.redAccent, width: 1.sp),
                          ),
                          padding: EdgeInsets.all(0.sp),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 5.sp, top: 0.sp),
                                child: FaIcon(
                                  FontAwesomeIcons.trash,
                                  color: Colors.redAccent,
                                  size: 12.sp,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.sp, top: 0.sp),
                                child: Text(
                                  "Delete",
                                  style: TextStyle(
                                      color: Colors.redAccent, fontSize: 10.sp),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(5.sp, 5.sp, 0.sp, 5.sp),
                  child: Container(
                    width: 255.sp,
                    height: 32.sp,
                    child: Text(
                      title,
                      style: TextStyle(
                        color: DataColors.primary800,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          5.sp, 0.sp, 0.sp, 0.sp),
                      child: Container(
                        width: 255.sp,
                        height: 15.sp,
                        child: Text(
                          authorName,
                          style: TextStyle(
                            color: DataColors.primary800,
                            fontSize: 10.sp,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
