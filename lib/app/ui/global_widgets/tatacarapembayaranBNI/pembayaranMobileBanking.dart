// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:sizer/sizer.dart';

class PembayaranMobileBanking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 0.sp),
          child: Text(
            "1.  Akses BNI Mobile Banking dari handphone lalu \n\t\t\t kemudian masukkan user ID dan password",
            style: TextStyle(fontSize: 10.sp, color: DataColors.primary600),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          height: 2.sp,
        ),
        Padding(
          padding: EdgeInsets.only(left: 0.sp),
          child: Text(
            '2.\tPilih menu "Transfer"',
            style: TextStyle(fontSize: 10.sp, color: DataColors.primary600),
            // textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          height: 2.sp,
        ),
        Padding(
          padding: EdgeInsets.only(left: 0.sp),
          child: Text(
            '3. Pilih menu "Virtual Account Billing" kemudian pilih \n\t\t\t rekening debet',
            style: TextStyle(fontSize: 10.sp, color: DataColors.primary600),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          height: 2.sp,
        ),
        Padding(
          padding: EdgeInsets.only(left: 0.sp),
          child: Text(
            "4.\tMasukkan nomor VA anda pada menu input \n\t\t\t baru (Contoh: 8241002201150001) ",
            style: TextStyle(fontSize: 10.sp, color: DataColors.primary600),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          height: 2.sp,
        ),
        Padding(
          padding: EdgeInsets.only(left: 0.sp),
          child: Text(
            "5.\tTagihan yang harus dibayarkan akan muncul \n\t\t\t pada layar konfirmasi",
            style: TextStyle(fontSize: 10.sp, color: DataColors.primary600),
            // textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          height: 2.sp,
        ),
        Padding(
          padding: EdgeInsets.only(left: 0.sp),
          child: Text(
            '6.\tKonfirmasi transaksi dan masukkan password \n\t\t\t transaksi',
            style: TextStyle(fontSize: 10.sp, color: DataColors.primary600),
            // textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          height: 2.sp,
        ),
        Padding(
          padding: EdgeInsets.only(left: 0.sp),
          child: Text(
            "7.\tPembayaran Anda telah berhasil",
            style: TextStyle(fontSize: 10.sp, color: DataColors.primary600),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          height: 2.sp,
        ),
      ],
    );
  }
}
