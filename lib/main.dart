import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() => new _MyAppState();

}

class _MyAppState extends State<MyApp>{
  File _image;

  Future getImage() async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }
  Widget build(BuildContext context){
    return new MaterialApp(title: 'Image picker',
    home: new Scaffold(
      appBar: new AppBar(title: new Text('Image Picker'),),
      body: new Center(
        child: _image == null ? new Text('No image captured') : new Image.file(_image),
      ),
      floatingActionButton: new FloatingActionButton(onPressed: getImage,
      tooltip: 'Pick image',
      child: new Icon(Icons.camera),),
    ),);
  }
}