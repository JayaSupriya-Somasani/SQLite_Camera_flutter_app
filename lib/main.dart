import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_camera_flutter_app/providers/great_places.dart';
import 'package:sqlite_camera_flutter_app/screens/add_place_screen.dart';
import 'package:sqlite_camera_flutter_app/screens/places_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber
        ),
        home: const PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName:(ctx)=>AddPlaceScreen()
        },
      ),
    );
  }
}

