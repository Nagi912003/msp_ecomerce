import 'package:flutter/material.dart';

import '../models/file.dart';

class Files with ChangeNotifier {
  final items = [

    File(title: 'title', date: 'date', quantity: 22),
    File(title: 'title2', date: 'date2', quantity: 33),
    File(title: 'title3', date: 'date3', quantity: 23),
    File(title: 'title4', date: 'date4', quantity: 45),
  ];

  File findByTitle(String title) {
    return items.firstWhere((element) => element.title == title);
  }

  void toggleFavoriteStatusByTitle(String title) {
    items
        .firstWhere((element) => element.title == title)
        .toggleFavoriteStatus();
    notifyListeners();
  }
}
