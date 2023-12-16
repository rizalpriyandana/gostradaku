// ignore_for_file: non_constant_identifier_names, unrelated_type_equality_checks

import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/data/models/library/library_m.dart';
import 'package:gostradav1/app/routes/rout_name.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher_string.dart';

class LibraryController extends GetxController {
  RxBool showSearchResults = false.obs;
  RxBool showSearchFilterResults = false.obs;
  var status = false.obs;
  bool ismember = false;
  var statusbookmark = "".obs;
  var searchKeywoard = ''.obs;
  var filteredTopics = <String>{};
  final box = GetStorage();
  var isLoading = false.obs;
  var isRegister = false.obs;
  var loadingregister = false.obs;
  List<String> topics = [];
  String keywordku = "";
  RxString exemplar = RxString("");
  String notmember = "";
  String tokenapi =
      "MUp6bENqTzlzYVZaM0xKd2FkbnY5WkFzbEZQVFdSQTZ1QUdaY3grUnZvND0=";

  RxBool loadingdata = false.obs;
  late Map data = box.read("dataUser") as Map<String, dynamic>;
  RxList<AllBookModel> searchResults = <AllBookModel>[].obs;
  RxList<AllBookModel> searchFilterResults = <AllBookModel>[].obs;
  RxList<AllBookModel> filteringbook = <AllBookModel>[].obs;
  RxList<AllBookModel2> filteringbook2 = <AllBookModel2>[].obs;
  RxList<AllBookModel> listbook = <AllBookModel>[].obs;
  RxList<AllBookModel2> listbook2 = <AllBookModel2>[].obs;
  RxList<HistoryLoanModel> listhistory = <HistoryLoanModel>[].obs;
  RxList<BookmarkModel> listbookmark = <BookmarkModel>[].obs;
  RxList<CurrentLoanModel> listcurrent = <CurrentLoanModel>[].obs;
  late TextEditingController sc = TextEditingController();
  List<bool> selectedFilters = [];
  List<bool> selectedYear = [];
  List<String> selectedTopics = [];
  List<String> selectedYears = [];
  List<int> years = List.generate(11, (index) => 2000 + index);
  List<AllBookModel> filteredResults = [];
  List<AllBookModel> filteredTopicResults = [];

  searchbykeyandtopic(List<String> topicku) {
    searchResults.clear();

    if (topicku.isNotEmpty) {
      for (var buku in filteredResults) {
        for (var topic in selectedTopics) {
          if (buku.data[0].topic != null &&
              buku.data[0].topic!.toLowerCase().contains(topic.toLowerCase())) {
            // filteredTopicResults.add(buku);
            searchResults.add(buku);
            // sc.clear();
          }
        }
      }
    }
    showSearchResults.value = true;
  }

  searchbykeyandtahun(List<String> tahunku) {
    searchResults.clear();

    if (tahunku.isNotEmpty) {
      for (var bukuki in filteredResults) {
        if (tahunku.contains(bukuki.data[0].publish_year)) {
          searchResults.add(bukuki);
        }
      }
    }
    showSearchResults.value = true;
  }

  searchbykey(String keybook) {
    searchResults.clear();

    if (keybook.isNotEmpty) {
      for (var buku in listbook) {
        if (buku.data[0].title.toLowerCase().contains(keybook.toLowerCase())) {
          filteredResults.add(buku);
          searchResults.add(buku);
        }
      }
    }
    showSearchResults.value = true;
  }

  searchbyktt(List<String> tahunn, List<String> topicc) {
    searchResults.clear();

    if (tahunn.isNotEmpty && topicc.isNotEmpty) {
      for (var buku in filteredResults) {
        for (var topic in selectedTopics) {
          if (tahunn.contains(buku.data[0].publish_year) &&
              buku.data[0].topic != null &&
              buku.data[0].topic!.toLowerCase().contains(topic.toLowerCase())) {
            searchResults.add(buku);
          }
        }
      }
    }
  }

  searchBookFilter(List<String> topicbook, List<String> tahunbuku) {
    searchResults.clear();

    if (topicbook.isEmpty && tahunbuku.isEmpty) {
      showSearchResults.value = false;
      return;
    } else if (topicbook.isNotEmpty && tahunbuku.isEmpty) {
      for (var buku in listbook) {
        bool bookMatchesAnyTopic =
            false; // Flag untuk menandai apakah buku cocok dengan setidaknya satu topik

        for (var topic in topicbook) {
          if (buku.data[0].topic != null &&
              buku.data[0].topic!.toLowerCase().contains(topic.toLowerCase())) {
            bookMatchesAnyTopic = true;
            break; // Keluar dari loop jika buku cocok dengan setidaknya satu topik
          }
        }

        if (bookMatchesAnyTopic) {
          searchResults.add(buku); // Tambahkan buku ke dalam hasil pencarian
        }
      }
    } else if (topicbook.isEmpty && tahunbuku.isNotEmpty) {
      for (var buku in listbook) {
        if (selectedYears.contains(buku.data[0].publish_year)) {
          searchResults.add(buku);
          // selectedYears.clear();
        }
      }
    } else if (topicbook.isNotEmpty && tahunbuku.isNotEmpty) {
      for (var buku in listbook) {
        for (var topic in selectedTopics) {
          if (tahunbuku.contains(buku.data[0].publish_year) &&
              buku.data[0].topic != null &&
              buku.data[0].topic!.toLowerCase().contains(topic.toLowerCase())) {
            searchResults.add(buku);
          }
        }
      }
    }

    showSearchResults.value = true;
  }

  allbook(String memberId) async {
    final Map<String, dynamic> databody = {
      Library.memberId: memberId,
      Library.token: tokenapi
    };
    isLoading.value = true;
    var response = await http.post(
        Uri.parse("https://api-lib.strada.ac.id/public_api/biblio/allbook"),
        body: databody);
    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      if (databody['error'] == true) {
        
        // var result = AllBookModel2.fromJson(databody);
        // var fetchedTopics = result.data
        //     .map((datum) => datum.topic.toString())
        //     .expand((topics) => topics.split(', '))
        //     .where((topic) => topic != "null") // Hanya topik yang bukan "null".
        //     .toSet()
        //     .toList();
        // topics = fetchedTopics;
        // selectedFilters = List.generate(topics.length, (index) => false);
        // selectedYear = List.generate(years.length, (index) => false);

        // listbook2.value = result.data
        //     .map((datum) => AllBookModel2(
        //         data: [datum], error: true, message: databody['message']))
        //     .toList();

        // filteringbook2.assignAll(result.data
        //     .where((item) => item.totalpinjam >= 1)
        //     .map((datum) => AllBookModel2(
        //         error: true, data: [datum], message: databody['message'])));

        notmember = databody['data'];
        isLoading.value = false;
      } else {
       
        var databody = jsonDecode(response.body);
        var result = AllBookModel.fromJson(databody);
        var fetchedTopics = result.data
            .map((datum) => datum.topic.toString())
            .expand((topics) => topics.split(', '))
            .where((topic) => topic != "null") // Hanya topik yang bukan "null".
            .toSet()
            .toList();
        topics = fetchedTopics;
        selectedFilters = List.generate(topics.length, (index) => false);
        selectedYear = List.generate(years.length, (index) => false);
        var filtereddata = result.data
            .where((item) => int.parse(item.totalpinjam) >= 1)
            .toList();
        listbook.value = result.data
            .map((datum) => AllBookModel(data: [datum], error: false))
            .toList();
        filteringbook.assignAll(filtereddata
            .map((datum) => AllBookModel(error: false, data: [datum])));
        notmember = "Anda Sudah Terdaftar Sebagai Member";
        isLoading.value = false;
      }
    } else {
      Get.snackbar("Hi", "Gagal Memuat Data");
    }
  }

  historyloan(String memberId) async {
    final Map<String, dynamic> databody = {
      Library.memberId: memberId,
    };

    var response = await http.post(
        Uri.parse("https://lib.strada.ac.id/index.php?p=api/loan/historyloan"),
        body: databody);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['error'] == true) {
        isLoading.value = false;
        return null;
      } else {
        var result = HistoryLoanModel.fromJson(data);
        listhistory.value = result.data
            .map((data) => HistoryLoanModel(error: false, data: [data]))
            .toList();
        isLoading.value = false;
      }
    } else {
      Get.snackbar("Hi", "Gagal Memuat Data");
    }
  }

  currentloan(String memberId) async {
    final Map<String, dynamic> databody = {
      Library.memberId: memberId,
    };

    var response = await http.post(
        Uri.parse("https://lib.strada.ac.id/index.php?p=api/loan/currentloan"),
        body: databody);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['error'] == true) {
        isLoading.value = false;
        return null;
      } else {
        var result = CurrentLoanModel.fromJson(data);
        listcurrent.value = result.data
            .map((dataku) => CurrentLoanModel(error: false, data: [dataku]))
            .toList();
        isLoading.value = false;
      }
    } else {
      Get.snackbar("Hi", "Gagal Memuat Data");
    }
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

  addbookmark(String memberId, biblioId) async {
    final Map<String, dynamic> databody = {
      Library.memberId: memberId,
      Library.biblioId: biblioId,
      Library.token: tokenapi,
    };

    var response = await http.post(
        Uri.parse(
            "https://lib.strada.ac.id/index.php?p=api/biblio/insertbookmark"),
        body: databody);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['error'] == true) {
        Get.snackbar("Hi", data['message']);
        ismember = false;
      } else {
        ever(listbookmark, (_) {
          update();
        });
        ever(listbook, (_) {
          update();
        });
        ismember = true;
        Get.snackbar("Sucsess", "Data Berhasil Disimpan");
      }
    } else {
      Get.snackbar("Galat", "Data tidak berhasil disimpan");
    }
  }

  delete(String memberId, biblioId) async {
    final Map<String, dynamic> databody = {
      Library.memberId: memberId,
      Library.biblioId: biblioId,
      Library.token: tokenapi,
    };
    var response = await http.post(
        Uri.parse(
            "https://lib.strada.ac.id/index.php?p=api/biblio/deletebookmark"),
        body: databody);

    if (response.statusCode == 200) {
      Get.snackbar('Sucsess', 'Data berhasil dihapus');
    } else {
      Get.snackbar('Galat', 'Data tidak berhasil dihapus');
    }
  }

  addloan(
      String itemCode, String memberId, String loanDate, String dueDate) async {
    final Map<String, dynamic> databody = {
      Library.itemCode: itemCode,
      Library.memberId: memberId,
      Library.loanDate: loanDate,
      Library.dueDate: dueDate
    };
    loadingdata.value = true;
    var response = await http.post(
        Uri.parse("https://lib.strada.ac.id/index.php?p=api/biblio/insertloan"),
        body: databody);

    if (response.statusCode == 200) {
      // var data = jsonDecode(response.body);
      ever(listbook, (_) {
        update();
      });
      loadingdata.value = false;
      // Get.offNamed(RoutName.library);
      Get.snackbar("Hi", "Anda berhasil melakukan peminjaman");
      // if (data["error"] == true) {
      //   loadingdata.value = false;
      //   // String errorMessage = data["message"];
      //   Get.snackbar("Hi", "Tidak dapat melakukan peminjaman");
      // } else {
      //   String errorMessage = data["message"];
      //   ever(listbook, (_) {
      //     update();
      //   });
      //   loadingdata.value = false;
      //   Get.offNamed(RoutName.library);
      //   Get.snackbar("Hi", "Anda berhasil melakukan peminjaman");
      // }
    } else {
      Get.snackbar("Hi", "Terjadi Kesalahan");
    }
  }

  addqueue(String biblioId, String memberId, String itemCode) async {
    final Map<String, dynamic> databody = {
      Library.biblioId: biblioId,
      Library.memberId: memberId,
      Library.itemCode: itemCode,
      Library.token: tokenapi,
    };
    loadingdata.value = true;
    var response = await http.post(
        Uri.parse("https://api-lib.strada.ac.id/public_api/loan/insertreserve"),
        body: databody);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['error'] == true) {
        loadingdata.value = false;
        Get.snackbar("Go-Strada", data['data']);
      } else {
        loadingdata.value = false;
        Get.back();
        Get.snackbar("Go-Strada", "Anda Berhasil Booking buku ini");
      }
    } else {
      Get.snackbar("Hi", "Terjadi Kesalahan");
    }
  }

  register(String memberName, String birthDate, String nim, String gender,
      String memberAddress, String phone, String email, String password) async {
    final Map<String, dynamic> databody = {
      Library.memberName: memberName,
      Library.birthDate: birthDate,
      Library.nim: nim,
      Library.gender: gender,
      Library.address: memberAddress,
      Library.phone: phone,
      Library.email: email,
      Library.password: password,
      Library.token: tokenapi,
    };
    loadingregister.value = true;
    var response = await http.post(
        Uri.parse("https://api-lib.strada.ac.id/public_api/register/insertreg"),
        body: databody);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['error'] == true) {
        loadingregister.value = false;
        Get.snackbar("Go-Strada", data['data']);
      } else {
        loadingregister.value = false;
        isRegister.value = true;
        Get.snackbar("Anda Berhasil Register",
            "Silahkan tunggu approval dari pustakawan");
      }
    } else {
      Get.snackbar("Hi", "Terjadi Kesalahan");
    }
  }

  addloan2(
      String itemCode, String memberId, String loanDate, String dueDate) async {
    final Map<String, dynamic> databody = {
      Library.itemCode: itemCode,
      Library.memberId: memberId,
      Library.loanDate: loanDate,
      Library.dueDate: dueDate
    };
    loadingdata.value = true;
    var response = await http.post(
        Uri.parse("https://lib.strada.ac.id/index.php?p=api/biblio/insertloan"),
        body: databody);

    if (response.statusCode == 200) {
      ever(listbook, (_) {
        update();
      });
      loadingdata.value = false;
      Get.offNamed(RoutName.library);
      Get.snackbar("Hi", "Anda Berhasil Melakukan Peminjaman");
    } else {
      Get.snackbar("Hi", "Terjadi Kesalahan");
    }
  }

  returned(String itemCode, String memberId) async {
    final Map<String, dynamic> databody = {
      Library.itemCode: itemCode,
      Library.memberId: memberId,
    };

    var response = await http.post(
        Uri.parse("http://192.168.18.16/slimsku/index.php?p=api/biblio/return"),
        body: databody);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      ever(listhistory, (_) {
        update();
      });
      ever(listbook, (_) {
        update();
      });
      listcurrent.removeWhere((data) => data.data[0].itemCode == itemCode);
      Get.back();
      Get.snackbar('Sucsess', data['message']);
    } else {}
  }

  Future<void> openUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar("Go-Strada", "Tidak bisa membuka URL");
    }
  }
}
