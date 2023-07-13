import 'package:flutter/material.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:sizer/sizer.dart';

class Pembayaran4M extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 0.sp),
          child: Text(
            "1.\t Pilih Transfer",
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
            "2.\tPilih Antar Bank Online/Tranfer Online antar Bank",
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
            "3.\tMasukkan kode BSI 451 atau pilih Bank BSI",
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
            "4. Masukan kode 900 + kode Akademik (9285) + Nomor Pembayaran Contoh = 900 + 9285 + Nomor Pembayaran",
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
            "5.\tMasukan nominal tagihan yang akan dibayar + 3.000 ( ADM Transaksi )",
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
            '6. Layar akan menampilkan data transaksi anda, jika data sudah benar pilih YA (OK)',
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
            "7.\tProses Pembayaran",
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
