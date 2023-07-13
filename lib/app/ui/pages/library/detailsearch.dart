import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/controllers/library/library_c.dart';
import 'package:gostradav1/app/ui/pages/library/detailbook.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:sizer/sizer.dart';

class DetailSearchBook extends StatefulWidget {
  @override
  State<DetailSearchBook> createState() => _DetailSearchBookState();
}

class _DetailSearchBookState extends State<DetailSearchBook> {
  LibraryController c = Get.find<LibraryController>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    
          maxCrossAxisExtent: 150, // Atur lebar maksimum item
          mainAxisSpacing:5.sp,
          crossAxisSpacing: 10.sp,
          childAspectRatio: 0.45, // Atur perbandingan aspek sesuai kebutuhan
        ),
    
        itemCount: c.imgbnykdicari.length, // Jumlah total item dalam grid
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Get.to(DetailBookPage(), arguments: [
                c.imgbnykdicari[index],
                c.jenisbukesdicari[index],
                c.namabukesdicari[index],
                c.penulisbukesdicari[index],
                c.ratingbukesdicari[index],
                c.deskripsibukesdicari[index],
                c.pagesbukesdicari[index],
                c.tahunbukesdicari[index],
                c.kategoribukesdicari[index],
                c.labelbukudicari[index],
              ]);
            },
            child: Padding(
              padding: EdgeInsets.only(right: 0.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 125.sp,
                        width: 95.sp,
                        decoration: BoxDecoration(
                            color: DataColors.semigrey,
                            border: Border.all(color: DataColors.primary800),
                            borderRadius: BorderRadius.circular(5.sp),
                            image: DecorationImage(
                                image: AssetImage('assets/images/coverbuku/' +
                                    c.imgbnykdicari[index]),
                                fit: BoxFit.fill)),
                      ),
                      Container(
                        height: 25.sp,
                        width: 100.sp,
                        padding: EdgeInsets.all(0.sp),
                        child: Text(
                          c.namabukesdicari[index],
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
                          c.penulisbukesdicari[index],
                          style: TextStyle(
                              fontSize: 6.5.sp,
                              fontWeight: FontWeight.normal,
                              color: DataColors.blues),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 0.sp),
                    child: Container(
                      height: 10.sp,
                      width: 100.sp,
                      padding: EdgeInsets.only(right: 10.sp),
                      child: RatingBar.builder(
                        itemSize: 10.sp,
                        initialRating: double.parse(c.ratingbukesdicari[index]),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
