import 'package:flutter/widgets.dart';
import 'package:flutter_test_app/models/book_data.dart';
import 'package:flutter_test_app/repository_interface.dart';
import 'package:flutter_test_app/widgets/ListItem.dart';

class BookList extends StatefulWidget {
  final IDataRepository _repository;

  BookList(this._repository);

  @override
  State createState() {
    return _BookList();
  }
}

class _BookList extends State<BookList> {
  List<BookData> _books = new List();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    widget._repository
        .loadBooks()
        .then((value) => setState(() => this._books = value));
  }

  Widget listBuilder(BuildContext context, int index) {
    var book = _books[index];
    return ListItem(book);
  }

  @override
  Widget build(BuildContext context) {
    if (this._books != null) {
      return ListView.builder(
        controller: _scrollController,
        itemBuilder: listBuilder,
        itemCount: _books.length,
      );
    } else
      return Container(width: 0.0, height: 0.0);
  }
}
