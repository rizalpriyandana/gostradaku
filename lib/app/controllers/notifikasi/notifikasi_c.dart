import 'package:get/get.dart';

class NotifikasiController extends GetxController{
   List<IsiContent> content = [
    IsiContent(
        title: 'Keuangan - Tagihan',
        subtitle: 'Tagihan Semester',
        description:
            'Tagihan FTR203816351 telah melewati masa berlaku, silahkan segara bayar tagihan tersebut sebelum tidak berlakuu',
        icon: 'assets/icon/iconnotifkeuangan.png',
        time: 'Baru Saja'),
    IsiContent(
        title: 'Library - Peminjaman',
        subtitle: 'Pemijaman Buku',
        description:
            'Peminjaman PJM81223121 telah melewati masa berlaku, silahkan segera melakukan pengembalian buku',
        icon: 'assets/icon/iconnotiflibrary.png',
        time: '10 Menit yang lalu'),
  ];
}

class IsiContent {
  String title;
  String subtitle;
  String description;
  String icon;
  String time;

  IsiContent({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.time,
  });
}