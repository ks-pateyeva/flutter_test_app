import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test_app/models/book_data.dart';
import 'package:flutter_test_app/repository_interface.dart';

class DataRepository implements IDataRepository {
  final filePath = 'resources/data-en.json';
  List<BookData> _books;
  int selectedBook;

  Future<List<BookData>> loadBooks() async {
    if (this._books == null) {
      var parsed = jsonDecode(await rootBundle.loadString(filePath))
          .cast<Map<String, dynamic>>();
      this._books =
          parsed.map<BookData>((json) => BookData.fromJson(json)).toList();
    }
    return _books;
  }
}
