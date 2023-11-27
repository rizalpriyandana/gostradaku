// To parse this JSON data, do
//
//     final popularBookModel = popularBookModelFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class Library {
  static String memberId = 'member_id';
  static String biblioId = 'biblio_id';
  static String itemCode = 'item_code';
  static String loanDate = 'loan_date';
  static String dueDate = 'due_date';
  static String returnDate = 'return_date';
}
  

AllBookModel popularBookModelFromJson(String str) => AllBookModel.fromJson(json.decode(str));

String popularBookModelToJson(AllBookModel data) => json.encode(data.toJson());

class AllBookModel {
    bool error;
    List<Datum> data;

    AllBookModel({
        required this.error,
        required this.data,
    });

    factory AllBookModel.fromJson(Map<String, dynamic> json) => AllBookModel(
        error: json["error"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int biblioId;
    String? itemCode;
    String title;
    String? authorname;
    String image;
    String? isbnIssn;
    String? collation;
    String? edition;
    String? publisher;
    String? publish_year;
    String? topic;
    String? location;
    String? notes;
    String language;
    int total;
    String status;
    String? duedate;
    int totalpinjam;
    String bookmarkStatus;

    Datum({
        required this.biblioId,
        required this.itemCode,
        required this.title,
        required this.authorname,
        required this.image,
        required this.isbnIssn,
        required this.collation,
        required this.edition,
        required this.publisher,
        required this.publish_year,
        required this.topic,
        required this.location,
        required this.notes,
        required this.language,
        required this.total,
        required this.status,
        required this.duedate,
        required this.totalpinjam,
        required this.bookmarkStatus
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        biblioId: json["biblio_id"],
        itemCode: json["item_code"],
        title: json["title"],
        authorname: json["author_name"],
        image: json["image"],
        isbnIssn: json["isbn_issn"],
        collation: json["collation"],
        edition: json["edition"],
        publisher: json["publisher"],
        publish_year: json["publish_year"],
        topic: json["topics"],
        location: json["location_name"],
        notes: json["notes"],
        language: json["language_id"],
        total: json["copies"],
        status: json["status"],
        duedate: json["due_date"],
        totalpinjam: json["total_peminjaman"],
        bookmarkStatus: json["bookmark_status"]
    );

    Map<String, dynamic> toJson() => {
        "biblio_id": biblioId,
        "item_code": itemCode,
        "title": title,
        "author_name": authorname,
        "image": image,
        "isbn_issn": isbnIssn,
        "collation": collation,
        "edition": edition,
        "publisher": publisher,
        "publish_year": publish_year,
        "topics": topic,
        "location_name": location,
        "notes": notes,
        "language_id": language,
        "copies": total,
        "status": status,
        "due_date": duedate,
        "total_peminjaman": totalpinjam,
        "bookmark_status": bookmarkStatus
    };
}


AllBookModel2 allBookModel2FromJson(String str) => AllBookModel2.fromJson(json.decode(str));

String allBookModel2ToJson(AllBookModel2 data) => json.encode(data.toJson());

class AllBookModel2 {
    bool error;
    String message;
    List<Datumku> data;

    AllBookModel2({
        required this.error,
        required this.message,
        required this.data,
    });

    factory AllBookModel2.fromJson(Map<String, dynamic> json) => AllBookModel2(
        error: json["error"],
        message: json["message"],
        data: List<Datumku>.from(json["data"].map((x) => Datumku.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datumku {
    int biblioId;
    String? itemCode;
    String title;
    String? authorname;
    String image;
    String? isbnIssn;
    String? collation;
    String? edition;
    String? publisher;
    String? publish_year;
    String? topic;
    String? location;
    String? notes;
    String language;
    int total;
    String status;
    String? duedate;
    int totalpinjam;
    String bookmarkStatus;

    Datumku({
        required this.biblioId,
        required this.itemCode,
        required this.title,
        required this.authorname,
        required this.image,
        required this.isbnIssn,
        required this.collation,
        required this.edition,
        required this.publisher,
        required this.publish_year,
        required this.topic,
        required this.location,
        required this.notes,
        required this.language,
        required this.total,
        required this.status,
        required this.duedate,
        required this.totalpinjam,
        required this.bookmarkStatus
    });

    factory Datumku.fromJson(Map<String, dynamic> json) => Datumku(
        biblioId: json["biblio_id"],
        itemCode: json["item_code"],
        title: json["title"],
        authorname: json["author_name"],
        image: json["image"],
        isbnIssn: json["isbn_issn"],
        collation: json["collation"],
        edition: json["edition"],
        publisher: json["publisher"],
        publish_year: json["publish_year"],
        topic: json["topics"],
        location: json["location_name"],
        notes: json["notes"],
        language: json["language_id"],
        total: json["copies"],
        status: json["status"],
        duedate: json["due_date"],
        totalpinjam: json["total_peminjaman"],
        bookmarkStatus: json["bookmark_status"]
    );

    Map<String, dynamic> toJson() => {
        "biblio_id": biblioId,
        "item_code": itemCode,
        "title": title,
        "author_name": authorname,
        "image": image,
        "isbn_issn": isbnIssn,
        "collation": collation,
        "edition": edition,
        "publisher": publisher,
        "publish_year": publish_year,
        "topics": topic,
        "location_name": location,
        "notes": notes,
        "language_id": language,
        "copies": total,
        "status": status,
        "due_date": duedate,
        "total_peminjaman": totalpinjam,
        "bookmark_status": bookmarkStatus
    };
}

// To parse this JSON data, do
//
//     final historyLoanModel = historyLoanModelFromJson(jsonString);



HistoryLoanModel historyLoanModelFromJson(String str) => HistoryLoanModel.fromJson(json.decode(str));

String historyLoanModelToJson(HistoryLoanModel data) => json.encode(data.toJson());

class HistoryLoanModel {
    bool error;
    List<Data> data;

    HistoryLoanModel({
        required this.error,
        required this.data,
    });

    factory HistoryLoanModel.fromJson(Map<String, dynamic> json) => HistoryLoanModel(
        error: json["error"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Data {
    String itemCode;
    String title;
    DateTime loanDate;
    DateTime returnDate;

    Data({
        required this.itemCode,
        required this.title,
        required this.loanDate,
        required this.returnDate,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        itemCode: json["item_code"],
        title: json["title"],
        loanDate: DateTime.parse(json["loan_date"]),
        returnDate: DateTime.parse(json["return_date"]),
    );

    Map<String, dynamic> toJson() => {
        "item_code": itemCode,
        "title": title,
        "loan_date": "${loanDate.year.toString().padLeft(4, '0')}-${loanDate.month.toString().padLeft(2, '0')}-${loanDate.day.toString().padLeft(2, '0')}",
        "return_date": "${returnDate.year.toString().padLeft(4, '0')}-${returnDate.month.toString().padLeft(2, '0')}-${returnDate.day.toString().padLeft(2, '0')}",
    };
}

CurrentLoanModel currentLoanModelFromJson(String str) => CurrentLoanModel.fromJson(json.decode(str));

String currentLoanModelToJson(CurrentLoanModel data) => json.encode(data.toJson());

class CurrentLoanModel {
    bool error;
    List<Dataku> data;

    CurrentLoanModel({
        required this.error,
        required this.data,
    });

    factory CurrentLoanModel.fromJson(Map<String, dynamic> json) => CurrentLoanModel(
        error: json["error"],
        data: List<Dataku>.from(json["data"].map((x) => Dataku.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Dataku {
    String itemCode;
    String title;
    DateTime loanDate;
    DateTime dueDate;

    Dataku({
        required this.itemCode,
        required this.title,
        required this.loanDate,
        required this.dueDate,
    });

    factory Dataku.fromJson(Map<String, dynamic> json) => Dataku(
        itemCode: json["item_code"],
        title: json["title"],
        loanDate: DateTime.parse(json["loan_date"]),
        dueDate: DateTime.parse(json["due_date"]),
    );

    Map<String, dynamic> toJson() => {
        "item_code": itemCode,
        "title": title,
        "loan_date": "${loanDate.year.toString().padLeft(4, '0')}-${loanDate.month.toString().padLeft(2, '0')}-${loanDate.day.toString().padLeft(2, '0')}",
        "due_date": "${dueDate.year.toString().padLeft(4, '0')}-${dueDate.month.toString().padLeft(2, '0')}-${dueDate.day.toString().padLeft(2, '0')}",
    };
}

// To parse this JSON data, do
//
//     final bookmarkModel = bookmarkModelFromJson(jsonString);



BookmarkModel bookmarkModelFromJson(String str) => BookmarkModel.fromJson(json.decode(str));

String bookmarkModelToJson(BookmarkModel data) => json.encode(data.toJson());

class BookmarkModel {
    bool error;
    List<Datab> data;

    BookmarkModel({
        required this.error,
        required this.data,
    });

    factory BookmarkModel.fromJson(Map<String, dynamic> json) => BookmarkModel(
        error: json["error"],
        data: List<Datab>.from(json["data"].map((x) => Datab.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datab {
    int biblioId;
    String title;
    String authorName;
    DateTime createdAt;

    Datab({
        required this.biblioId,
        required this.title,
        required this.authorName,
        required this.createdAt,
    });

    factory Datab.fromJson(Map<String, dynamic> json) => Datab(
        biblioId: json["biblio_id"],
        title: json["title"],
        authorName: json["author_name"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "biblio_id": biblioId,
        "title": title,
        "author_name": authorName,
        "created_at": createdAt.toIso8601String(),
    };
}


