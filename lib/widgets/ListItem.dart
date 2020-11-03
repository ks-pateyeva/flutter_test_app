import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test_app/models/book_data.dart';
import 'package:flutter_test_app/widgets/BookDetails.dart';

class ListItem extends StatefulWidget {
  final BookData _book;

  ListItem(this._book);

  @override
  State<StatefulWidget> createState() {
    return _ListItem();
  }
}

class _ListItem extends State<ListItem> {
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
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        height: 170,
        child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BookDetails(widget._book)),
              );
            },
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(flex: 3, child: imageView),
                  Expanded(
                    flex: 7,
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        child: SizedBox(
                            height: 170,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Text(
                                  widget._book.name,
                                ),
                                Text(widget._book.author),
                                Text(
                                  widget._book.description,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.start,
                            ))),
                  )
                ])));
  }
}
