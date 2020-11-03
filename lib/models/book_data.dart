import 'dart:typed_data';

enum genre_type {
  none,
  novel,
  fiction,
  fantasy,
  fairytale,
}

class BookData {
  String name;
  String author;
  genre_type genre;
  String description;
  String imagePath;
  String videoPath;

  BookData({
    this.name,
    this.author,
    this.genre,
    this.description,
    this.imagePath,
    this.videoPath,
  });

  factory BookData.fromJson(Map<String, dynamic> json) {
    var genreFromJson = json['genre'] as String;
    return BookData(
      name: json['name'] as String,
      author: json['author'] as String,
      genre: genre_type.values
          .firstWhere((element) => element.toString().contains(genreFromJson)),
      description: json['description'] as String,
      imagePath: json['image'] as String,
      videoPath: json['video'] as String,
    );
  }
}
