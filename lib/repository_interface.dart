import 'package:flutter_test_app/models/book_data.dart';

abstract class IDataRepository {
  Future<List<BookData>> loadBooks();
}
