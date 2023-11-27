// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gostradav1/app/controllers/library/library_c.dart';
import 'package:gostradav1/app/routes/rout_name.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PopularBook extends StatefulWidget {
  @override
  State<PopularBook> createState() => _PopularBookState();
}

class _PopularBookState extends State<PopularBook> {
  LibraryController lc = Get.find<LibraryController>();
  final box = GetStorage();
  late Map data = box.read("dataUser") as Map<String, dynamic>;

  @override
  void initState() {
    lc.allbook(data['nim']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DataColors.white,
        elevation: 0,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 0.sp),
          child: Text(
            "Popular Book",
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: DataColors.primary800),
          ),
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
      ),
      body: Container(
        padding: EdgeInsets.all(0.sp),
        child: Padding(
          padding: EdgeInsets.only(top: 10.sp),
          child: ListView.builder(
            itemCount: lc.filteringbook.length,
            itemBuilder: (context, index) {
              final datalist = lc.filteringbook[index];
              return InkWell(
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
                child: ContentPopular(
                    title: datalist.data[0].title,
                    penulis: datalist.data[0].authorname ?? "",
                    copies: datalist.data[0].total.toString(),
                    gambar: datalist.data[0].image),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ContentPopular extends StatelessWidget {
  String title;
  String penulis;
  String copies;
  String gambar;

  ContentPopular({
    required this.title,
    required this.penulis,
    required this.copies,
    required this.gambar,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.sp, left: 10.sp, right: 10.sp),
      child: Container(
        width: double.infinity,
        height: 120.sp,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0x33000000)),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: DataColors.blackshadow,
              offset: Offset(0, 2.sp),
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(6.sp, 0.sp, 0.sp, 0.sp),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: DataColors.greyclassy, width: 0.5),
                  borderRadius: BorderRadius.circular(8.sp),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.sp),
                  child: Image.network(
                    gambar,
                    width: 80.sp,
                    height: 105.sp,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.sp, top: 5.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.sp),
                    child: Container(
                      width: 180.sp,
                      height: 27.sp,
                      // decoration: BoxDecoration(
                      //   color: DataColors.white,
                      // ),
                      child: RichText(
                        text: TextSpan(
                          text: title,
                          style: TextStyle(
                            color: DataColors.primary800,
                            fontSize: 11.5.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0.sp),
                    child: Container(
                      width: 180.sp,
                      height: 35.sp,
                      // decoration: BoxDecoration(
                      //   color: FlutterFlowTheme.of(context)
                      //       .secondaryBackground,
                      // ),
                      child: Text(
                        penulis,
                        maxLines: 2,
                        style: TextStyle(
                          color: DataColors.bluepurple,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        125.sp, 30.sp, 0.sp, 0.sp),
                    child: RichText(
                      text: TextSpan(
                        text: 'Tersedia $copies',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: DataColors.primary800,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
