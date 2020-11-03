import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test_app/models/book_data.dart';

class BookDetails extends StatefulWidget {
  final BookData _book;

  BookDetails(this._book);

  @override
  State<StatefulWidget> createState() {
    return _BookDetails();
  }
}

class _BookDetails extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    var imageView;
    if (widget._book.imagePath != null) {
      imageView = Image.asset('resources/' + widget._book.imagePath + ".png");
    } else {
      imageView = Container(
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.black45),
          child: Container(
            width: 200,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 10.0,
            ),
            child: Text(
              'No image'.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._book.name),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
              height: 300,
              child: imageView,
            ),
            Container(
              alignment: Alignment.topLeft,
                child: Column(children: [
              Text('Title', style: TextStyle(fontWeight: FontWeight.bold))
            ]))
          ],
        ),
      ),
    );
  }
}
