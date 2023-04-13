import 'dart:io';

import 'package:flutter/foundation.dart';
import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _item = [];

  List<Place> get item {
    return [..._item];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(id: DateTime.now().toString(),
        title: title,
        location: null,
        image: image);
    _item.add(newPlace);
    notifyListeners();
  }

}