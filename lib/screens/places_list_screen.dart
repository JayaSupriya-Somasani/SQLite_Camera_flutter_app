import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_camera_flutter_app/providers/great_places.dart';
import 'package:sqlite_camera_flutter_app/screens/add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Places"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<GreatPlaces>(
                    builder: (ctx, greatPlace, ch) => greatPlace.item.isEmpty
                        ? const Text(
                            "Got no Places yet, Start adding some",
                            textAlign: TextAlign.center,
                          )
                        : ListView.builder(
                            itemCount: greatPlace.item.length,
                            itemBuilder: (ctx, i) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    FileImage(greatPlace.item[i].image!),
                              ),
                              title: Text(greatPlace.item[i].title),
                              onTap: () {},
                            ),
                          ),
                  ),
      ),
    );
  }
}
