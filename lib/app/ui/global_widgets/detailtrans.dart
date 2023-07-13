import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Column ColumnPembayaran(String nop, String nama, String mstnjop,
    String msttotalnjop, String mstpersenpajak, String mstgrandtotal) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: DottedLine(
          direction: Axis.horizontal,
          lineLength: double.infinity,
          lineThickness: 1.0,
          dashLength: 6.0,
          dashColor: HexColor("#DADADA"),
          dashRadius: 0.0,
          dashGapLength: 4.0,
          dashGapColor: Colors.transparent,
          dashGapRadius: 0.0,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 3,
                    child:
                        Text("Nomor Objek Pajak (NOP)", style: tagihantitle())),
                const Spacer(
                  flex: 1,
                ),
                Text(nop, style: tagihandesc()),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text("Nama Wajib Pajak", style: tagihantitle()),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(nama, style: tagihandesc()),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 3,
                    child: Text("Letak Objek Pajak", style: tagihantitle())),
                const Spacer(
                  flex: 1,
                ),
                Text("ASHOKA REGENCY BLOK D6", style: tagihandesc()),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 3,
                      child: Text("Objek Pajak", style: tagihantitle())),
                  const Spacer(
                    flex: 1,
                  ),
                  Text("Bumi Bangunan", style: tagihandesc()),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 3,
                    child: Text("NJOP Sebagai Dasar Pengenaan PBB",
                        style: TextStyle(
                            color: HexColor("#000137"),
                            fontSize: 10,
                            fontWeight: FontWeight.w700))),
                const Spacer(
                  flex: 1,
                ),
                Text(mstnjop, style: tagihandesc()),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 3,
                      child: Text("NJOPTKP (NJOP Tidak Kena Pajak)",
                          style: tagihantitle())),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(msttotalnjop, style: tagihandesc()),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 3,
                    child: Text("NJOP Untuk Perhitungan PBB",
                        style: tagihantitle())),
                const Spacer(
                  flex: 1,
                ),
                Text(mstpersenpajak, style: tagihandesc()),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 3,
                      child: Text(
                          "PBB Yang Terhutang (0,1% x Rp.74.242.000,00)",
                          style: tagihantitle())),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(mstgrandtotal, style: tagihandesc()),
                ],
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: DottedLine(
          direction: Axis.horizontal,
          lineLength: double.infinity,
          lineThickness: 1.0,
          dashLength: 6.0,
          dashColor: HexColor("#DADADA"),
          dashRadius: 0.0,
          dashGapLength: 4.0,
          dashGapColor: Colors.transparent,
          dashGapRadius: 0.0,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 3,
                child: Text("Jumlah Yang Harus Dibayar (Rp)",
                    style: TextStyle(
                        color: HexColor("#000137"),
                        fontSize: 10,
                        fontWeight: FontWeight.w700))),
            const Spacer(
              flex: 1,
            ),
            Text(mstgrandtotal,
                style: TextStyle(
                    color: HexColor("#000137"),
                    fontSize: 10,
                    fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    ],
  );
}

TextStyle tagihandesc() {
  return TextStyle(
      color: HexColor("#000137"), fontSize: 10, fontWeight: FontWeight.w400);
}

TextStyle tagihantitle() {
  return TextStyle(
      color: HexColor("#000137"), fontSize: 10, fontWeight: FontWeight.w500);
}
