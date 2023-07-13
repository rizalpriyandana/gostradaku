// ignore_for_file: use_key_in_widget_constructors

// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gostradav1/app/ui/pages/library/detailsearch.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/controllers/library/library_c.dart';
import 'package:gostradav1/app/ui/pages/library/detailbook.dart';
import 'package:gostradav1/app/ui/pages/library/historypeminjaman.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:sizer/sizer.dart';

class Libraryv2 extends StatefulWidget {
  @override
  State<Libraryv2> createState() => _Libraryv2State();
}

class _Libraryv2State extends State<Libraryv2> with TickerProviderStateMixin {
  LibraryController c = Get.find<LibraryController>();
  late TabController tc;
  int currentindex = 0;
  bool vis = true;
  bool vis2 = true;
  bool vissearch = false;

  // String _getTabTitle(int index) {
  //   switch (index) {
  //     case 0:
  //       return 'Kesehatan';
  //     case 1:
  //       return 'Kedokteran';
  //     case 2:
  //       return 'Ilmu Keperawatan';
  //     case 3:
  //       return 'Kebidanan';
  //     default:
  //       return '';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    TabController tc = TabController(length: 4, vsync: this);

    return (Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Color(0xfff012AC0),
      body: SafeArea(
          child: Column(
                children: [
          Container(
            decoration: BoxDecoration(
                    image: DecorationImage(
                      opacity: 0.4,
                      image: AssetImage("assets/overlay.png"),
                      fit: BoxFit.cover

                      )
                  ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: (() {
                        Navigator.of(context)
                          ..pop()
                          ..pop();
                      }),
                      child:
                          Icon(Icons.arrow_back, size: 30, color: Colors.white))
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/back.png",
                      ),
                      fit: BoxFit.cover)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80.0),
                      child: Container(
                        height: 40,
                        child: TextField(
                          // controller: t,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.all(10),
                              hintText: "Search Book...",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(40))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return searchloading(text: t.text);
                        // }));
                      },
                     style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue
                     ),
                      child: Text(
                        "SEARCH",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Explore the book forest!",
                        style:  TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Find the light you are chasing for.",
                      style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                            child: ListView(
                                            children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                "Adventure",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.arrow_forward)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 0.sp, left: 7.sp),
                          height: 182.sp,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(right: 0.sp),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 125.sp,
                                          width: 95.sp,
                                          decoration: BoxDecoration(
                                              color: DataColors.semigrey,
                                              border: Border.all(
                                                  color: DataColors.primary800),
                                              borderRadius:
                                                  BorderRadius.circular(5.sp),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/coverbuku/nocoverbook.png'),
                                                  fit: BoxFit.fill)),
                                        ),
                                        Container(
                                          height: 25.sp,
                                          width: 100.sp,
                                          padding: EdgeInsets.all(0.sp),
                                          child: Text(
                                            "Manajemen Kesehatan Masyarakat",
                                            style: TextStyle(
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.bold,
                                                color: DataColors.primary800),
                                          ),
                                        ),
                                        Container(
                                          height: 22.sp,
                                          width: 100.sp,
                                          padding: EdgeInsets.all(0.sp),
                                          child: Text(
                                            "Dr.dr. Ummar Zein, DTM&H, Sp.PD.,KPTI.,FINASIM",
                                            style: TextStyle(
                                                fontSize: 6.5.sp,
                                                fontWeight: FontWeight.normal,
                                                color: DataColors.blues),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 6.sp),
                                      child: Container(
                                        height: 10.sp,
                                        width: 100.sp,
                                        padding: EdgeInsets.only(right: 0.sp),
                                        child: RatingBar.builder(
                                          itemSize: 10.sp,
                                          initialRating: 4.0,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {},
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                "Fantasy",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.arrow_forward)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 0.sp, left: 7.sp),
                          height: 182.sp,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(right: 0.sp),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 125.sp,
                                          width: 95.sp,
                                          decoration: BoxDecoration(
                                              color: DataColors.semigrey,
                                              border: Border.all(
                                                  color: DataColors.primary800),
                                              borderRadius:
                                                  BorderRadius.circular(5.sp),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/coverbuku/nocoverbook.png'),
                                                  fit: BoxFit.fill)),
                                        ),
                                        Container(
                                          height: 25.sp,
                                          width: 100.sp,
                                          padding: EdgeInsets.all(0.sp),
                                          child: Text(
                                            "Manajemen Kesehatan Masyarakat",
                                            style: TextStyle(
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.bold,
                                                color: DataColors.primary800),
                                          ),
                                        ),
                                        Container(
                                          height: 22.sp,
                                          width: 100.sp,
                                          padding: EdgeInsets.all(0.sp),
                                          child: Text(
                                            "Dr.dr. Ummar Zein, DTM&H, Sp.PD.,KPTI.,FINASIM",
                                            style: TextStyle(
                                                fontSize: 6.5.sp,
                                                fontWeight: FontWeight.normal,
                                                color: DataColors.blues),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 6.sp),
                                      child: Container(
                                        height: 10.sp,
                                        width: 100.sp,
                                        padding: EdgeInsets.only(right: 0.sp),
                                        child: RatingBar.builder(
                                          itemSize: 10.sp,
                                          initialRating: 4.0,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {},
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                "Horror",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.arrow_forward)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                       Container(
                          padding: EdgeInsets.only(right: 0.sp, left: 7.sp),
                          height: 182.sp,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(right: 0.sp),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 125.sp,
                                          width: 95.sp,
                                          decoration: BoxDecoration(
                                              color: DataColors.semigrey,
                                              border: Border.all(
                                                  color: DataColors.primary800),
                                              borderRadius:
                                                  BorderRadius.circular(5.sp),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/coverbuku/nocoverbook.png'),
                                                  fit: BoxFit.fill)),
                                        ),
                                        Container(
                                          height: 25.sp,
                                          width: 100.sp,
                                          padding: EdgeInsets.all(0.sp),
                                          child: Text(
                                            "Manajemen Kesehatan Masyarakat",
                                            style: TextStyle(
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.bold,
                                                color: DataColors.primary800),
                                          ),
                                        ),
                                        Container(
                                          height: 22.sp,
                                          width: 100.sp,
                                          padding: EdgeInsets.all(0.sp),
                                          child: Text(
                                            "Dr.dr. Ummar Zein, DTM&H, Sp.PD.,KPTI.,FINASIM",
                                            style: TextStyle(
                                                fontSize: 6.5.sp,
                                                fontWeight: FontWeight.normal,
                                                color: DataColors.blues),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 6.sp),
                                      child: Container(
                                        height: 10.sp,
                                        width: 100.sp,
                                        padding: EdgeInsets.only(right: 0.sp),
                                        child: RatingBar.builder(
                                          itemSize: 10.sp,
                                          initialRating: 4.0,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {},
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                "Health",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.arrow_forward)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 0.sp, left: 7.sp),
                          height: 182.sp,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(right: 0.sp),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 125.sp,
                                          width: 95.sp,
                                          decoration: BoxDecoration(
                                              color: DataColors.semigrey,
                                              border: Border.all(
                                                  color: DataColors.primary800),
                                              borderRadius:
                                                  BorderRadius.circular(5.sp),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/coverbuku/nocoverbook.png'),
                                                  fit: BoxFit.fill)),
                                        ),
                                        Container(
                                          height: 25.sp,
                                          width: 100.sp,
                                          padding: EdgeInsets.all(0.sp),
                                          child: Text(
                                            "Manajemen Kesehatan Masyarakat",
                                            style: TextStyle(
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.bold,
                                                color: DataColors.primary800),
                                          ),
                                        ),
                                        Container(
                                          height: 22.sp,
                                          width: 100.sp,
                                          padding: EdgeInsets.all(0.sp),
                                          child: Text(
                                            "Dr.dr. Ummar Zein, DTM&H, Sp.PD.,KPTI.,FINASIM",
                                            style: TextStyle(
                                                fontSize: 6.5.sp,
                                                fontWeight: FontWeight.normal,
                                                color: DataColors.blues),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 6.sp),
                                      child: Container(
                                        height: 10.sp,
                                        width: 100.sp,
                                        padding: EdgeInsets.only(right: 0.sp),
                                        child: RatingBar.builder(
                                          itemSize: 10.sp,
                                          initialRating: 4.0,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {},
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                                            ],
                                          )))
                  ],
                ),
              ))
                ],
              )),
    ));
  }
}
