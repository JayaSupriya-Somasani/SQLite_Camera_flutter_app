import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:sqlite_camera_flutter_app/helpers/db_helpers.dart';
import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _item = [];

  List<Place> get item {
    return [..._item];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: title,
        location: null,
        image: image);
    _item.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image!.path
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _item = dataList
        .map((item) => Place(
            id: item['id'],
            title: item['title'],
            location: null,
            image: File(item['image'])))
        .toList();
    notifyListeners();
  }
}
