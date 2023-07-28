import 'package:flutter/cupertino.dart';

class File{
  String title;
  String date;
  double quantity;
  bool isFavorite;

  File({
    required this.title,
    required this.date,
    required this.quantity,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
  }
}