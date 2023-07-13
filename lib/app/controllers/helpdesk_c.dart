import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/data/models/chat_k_m.dart';
import 'package:gostradav1/app/data/models/chat_m.dart';
// import 'package:gostrada/app/routes/rout_name.dart';
import 'package:http/http.dart' as http;

// import '../data/models/absen_m.dart';
import '../data/models/chatdosen.dart';
import '../data/models/chatlistdosen.dart';
import '../data/models/chatmodelnew.dart';
import '../data/models/dosenpembimbing.dart';
import '../data/models/karyawan_m.dart';
import '../data/models/mainchat.dart';
import '../data/models/test_m.dart';

class HelpdeskController extends GetxController {
  RxBool usingsearch = false.obs;
  List<ChatDosenModel> dosen = [];
  static HelpdeskController get to => Get.isRegistered<HelpdeskController>()
      ? Get.find()
      : Get.put(HelpdeskController());

  List<Message> messageList = [];
  List<Message1> messageListpegawai = [];
  List<Message> messageListdosen = [];
  List<MessagePembimbing> messageListdosenpembimbing = [];
  List<MessagePembimbing> messageListiopendiscuss = [];

  final ScrollController scrollController = ScrollController();
  String? nimSaya;

  @override
  void onInit() {
    const oneSec = Duration(seconds: 600);
    Timer.periodic(
        oneSec, (Timer t) => nimSaya != null ? listchat(nimSaya!) : () {});
    super.onInit();
  }

  @override
  void dispose() {
    messageListdosen.clear();
    messageListpegawai.clear();
    messageListdosenpembimbing.clear();
    messageListiopendiscuss.clear();
    super.dispose();
  }

  delete() {
    messageListdosen.clear();
    messageListpegawai.clear();
    messageListdosenpembimbing.clear();
    messageListiopendiscuss.clear();
  }

  profilebar(String nim) async {
    final Map<String, dynamic> dataBody = {
      chatclass.nim: nim,
    };
    var response = await http.post(
        Uri.parse(
            "https://siakad.strada.ac.id/mobile/skripsi/profile_pembimbing"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      var result = DosenPembimbingprofile.fromJson(databody);
      readpesandosenpembimbing(nim, result.data!.id);
      return result;
    } else {
      return null;
    }
  }

  void listchat(String nim) async {
    final Map<String, dynamic> dataBody = {
      chatclass.nim: nim,
    };

    nimSaya = nim;

    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/chat/get_msg"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      // print(DataUser['data']);
      if (databody['error'] == true) {
        //show error
      } else {
        messageList = ChatModel.fromJson(databody).data!;
      }

      update();
    }
  }

  void listchatdosen(String nim, String id_admin) async {
    final Map<String, dynamic> dataBody = {
      chatclass.nim: nim,
      chatclass.id_admin: id_admin
    };
    nimSaya = nim;

    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/chat/get_msg_dosen"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      // print(DataUser['data']);
      if (databody['error'] == true) {
        //show error
      } else {
        messageListdosen = ChatModel.fromJson(databody).data!;
      }

      update();
    } else {
      delete();
      update();
    }
  }

  void listchatpegawai(String nim, String id_posisi) async {
    final Map<String, dynamic> dataBody = {
      chatclass.nim: nim,
      chatclass.id_posisi: id_posisi
    };

    nimSaya = nim;
    messageListpegawai.clear();
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/chat/get_msg_employee"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      // print(DataUser['data']);
      if (databody['error'] == true) {
        //show error
      } else {
        messageListpegawai = ChatEmployeeModel.fromJson(databody).data!;
      }

      update();
    } else {
      delete();
      update();
    }
  }

  void listchatdosenpembimbing(String nim, String id_dosen) async {
    final Map<String, dynamic> dataBody = {
      chatclass.nim: nim,
      chatclass.id_dosen: id_dosen
    };
    nimSaya = nim;

    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/skripsi/get_msg"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      // print(DataUser['data']);
      if (databody['error'] == true) {
        //show error
      } else {
        messageListdosenpembimbing =
            ListDosenPembimbingChat.fromJson(databody).data!;
      }

      update();
    } else {
      delete();
      update();
    }
  }

  inputchat(String nim, String pesan) async {
    final Map<String, dynamic> dataBody = {
      chatclass.nim: nim,
      chatclass.pesan: pesan,
    };
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/chat/send_msg"),
        body: dataBody);

    if (response.statusCode == 200) {
      listchat(nim);
      scrollDown();
    }
  }

  inputchatpegawai(String nim, String id_posisi, String pesan) async {
    final Map<String, dynamic> dataBody = {
      chatclass.nim: nim,
      chatclass.pesan: pesan,
      chatclass.id_posisi: id_posisi
    };
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/chat/send_employee_msg"),
        body: dataBody);

    if (response.statusCode == 200) {
      listchatpegawai(nim, id_posisi);

      scrollDown();
    } else {}
  }

  inputchatdosen(String nim, String id_admin, String pesan) async {
    final Map<String, dynamic> dataBody = {
      chatclass.nim: nim,
      chatclass.pesan: pesan,
      chatclass.id_admin: id_admin
    };
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/chat/send_dosen_msg"),
        body: dataBody);

    if (response.statusCode == 200) {
      listchatdosen(nim, id_admin);

      scrollDown();
    }
  }

  inputchatdosenpembimbing(
      String nim, String id_dosen, String pesan, image) async {
    var request = http.MultipartRequest('POST',
        Uri.parse('https://siakad.strada.ac.id/mobile/skripsi/send_msg'));
    request.fields.addAll({
      'nim': nim,
      'id_dosen': id_dosen,
      'msg': pesan,
    });
    if (image != null) {
      File file = File(image.path);
      request.files.add(await http.MultipartFile.fromBytes(
          'gambar', File(file.path).readAsBytesSync(),
          filename: file.path));
    }
    // request.files.add(http.MultipartFile.fromBytes(
    //     'uploads', File(file.path).readAsBytesSync(),
    //     filename: file.path));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      listchatdosenpembimbing(nim, id_dosen);

      scrollDown();
    } else {}
  }

  void scrollDown() {
    if (scrollController.hasClients) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }
  }

  readpesan(String nim) async {
    final Map<String, dynamic> dataBody = {
      chatclass.nim: nim,
    };
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/chat/read_msg"),
        body: dataBody);

    if (response.statusCode == 200) {
      listchat(nim);
    }
  }

  readpesandosen(String nim, String id_admin) async {
    final Map<String, dynamic> dataBody = {
      chatclass.nim: nim,
      chatclass.id_admin: id_admin
    };
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/chat/read_msg_dosen"),
        body: dataBody);

    if (response.statusCode == 200) {
      listchatdosenpembimbing(nim, id_admin);
    } else {
      listchatdosenpembimbing(nim, id_admin);
    }
  }

  readpesanpegawai(String nim, String id_posisi) async {
    final Map<String, dynamic> dataBody = {
      chatclass.nim: nim,
      chatclass.id_posisi: id_posisi
    };
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/chat/read_msg_employee"),
        body: dataBody);

    if (response.statusCode == 200) {
      listchatpegawai(nim, id_posisi);
    } else {
      listchatpegawai(nim, id_posisi);
    }
  }

  readpesandosenpembimbing(String nim, String id_dosen) async {
    final Map<String, dynamic> dataBody = {
      chatclass.nim: nim,
      chatclass.id_dosen: id_dosen
    };
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/skripsi/read_msg"),
        body: dataBody);

    if (response.statusCode == 200) {
      listchatdosenpembimbing(nim, id_dosen);
    } else {
      listchatdosenpembimbing(nim, id_dosen);
    }
  }

  listchathelpdesk() async {
    var response = await http
        .get(Uri.parse("https://siakad.strada.ac.id/mobile/chat/get_posisi"));

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      // print(DataUser['data']);
      if (databody['error'] == true) {
        //show error
      } else {
        var result = ChatMasterModel.fromJson(databody);
        return result;
      }
    }
  }

  listdosen(String nim, String id_posisi) async {
    final Map<String, dynamic> dataBody = {
      chatclass.nim: nim,
      chatclass.id_posisi: id_posisi
    };

    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/chat/get_dosen"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      if (databody['error'] == true) {
      } else {
        var result = ChatListDosenModel.fromJson(databody);

        return result;
      }
    }
  }

  getbutton(
    String nim,
  ) async {
    final Map<String, dynamic> dataBody = {
      chatclass.nim: nim,
    };

    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/chat/get_button"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      if (databody['error'] == true) {
      } else {
        return databody;
      }
    }
  }

  getdosen(String nim, String type) async {
    final Map<String, dynamic> dataBody = {
      chatclass.nim: nim,
      chatclass.type: type
    };

    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/chat/get_posisi"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      if (databody['error'] == true) {
      } else {
        var result = ChatDosenModel.fromJson(databody);
      
        return result;
      }
    }
  }

  getkaryawan(String nim, String type) async {
    final Map<String, dynamic> dataBody = {
      chatclass.nim: nim,
      chatclass.type: type
    };

    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/chat/get_posisi"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      if (databody['error'] == true) {
      } else {
        var result = ChatKaryawanModel.fromJson(databody);

        return result;
      }
    }
  }

  search(String nim, String query) async {
    final Map<String, dynamic> dataBody = {
      chatclass.nim: nim,
      chatclass.query: query
    };

    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/chat/search_dosen"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      if (databody['error'] == true) {
      } else {
        dosen.clear();
        var result = ChatDosenModel.fromJson(databody);
        dosen.add(result);
        return result;
      }
    }
  }

  getchat(String nim) async {
    final Map<String, dynamic> dataBody = {
      chatclass.nim: nim,
    };

    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/chat/get_inbox_msg"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      if (databody['error'] == true) {
      } else {
        var result = ChatAllModel.fromJson(databody);
        return result;
      }
    }
  }

  up() {
    update();
  }

  void listchatdiscuss(String nim, String id_pesan) async {
    final Map<String, dynamic> dataBody = {
      chatclass.nim: nim,
      chatclass.id_pesan: id_pesan
    };
    nimSaya = nim;
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/skripsi/get_discuss"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      // print(DataUser['data']);
      if (databody['error'] == true) {
        //show error
      } else {
        messageListdosenpembimbing =
            ListDosenPembimbingChat.fromJson(databody).data!;
      }

      update();
    } else {
      delete();
      update();
    }
  }

  inputchatdiscuss(
      String nim, String id_admin, String id_pesan, String pesan, image) async {
    var request = http.MultipartRequest('POST',
        Uri.parse('https://siakad.strada.ac.id/mobile/skripsi/discuss'));
    request.fields.addAll(
        {'nim': nim, 'id_admin': id_admin, 'msg': pesan, 'id_pesan': id_pesan});
    if (image != null) {
      File file = File(image.path);
      request.files.add(await http.MultipartFile.fromBytes(
          'gambar', File(file.path).readAsBytesSync(),
          filename: file.path));
    }
    // request.files.add(http.MultipartFile.fromBytes(
    //     'uploads', File(file.path).readAsBytesSync(),
    //     filename: file.path));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      listchatdiscuss(nim, id_pesan);
    } else {}
  }

  readpesandiscuss(String nim, String id_pesan) async {
    final Map<String, dynamic> dataBody = {
      chatclass.nim: nim,
      chatclass.id_pesan: id_pesan
    };
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/skripsi/read_discuss"),
        body: dataBody);

    if (response.statusCode == 200) {
      listchatdiscuss(nim, id_pesan);
    } else {
      listchatdiscuss(nim, id_pesan);
    }
  }
}
