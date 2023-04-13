
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_camera_flutter_app/models/place.dart';
import 'package:sqlite_camera_flutter_app/providers/great_places.dart';
import 'package:sqlite_camera_flutter_app/widgets/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;

  void _selectImage(File pickedImage){
      _pickedImage=pickedImage;
  }

  void _savePlace(){
    if(_titleController.text.isEmpty || _pickedImage==null){
      return;
    }
    Provider.of<GreatPlaces>(context,listen: false).addPlace(_titleController.text,_pickedImage!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new place"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                    ),
                    const SizedBox(height: 10,),
                    ImageInput(_selectImage)
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            icon: const Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: _savePlace,
            label: const Text(
              "Add place",
              style: TextStyle(color: Colors.black54),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).accentColor),
          )
        ],
      ),
    );
  }
}
