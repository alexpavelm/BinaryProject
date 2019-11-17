import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Global.dart';

class AddMember extends StatefulWidget {
  @override
  _AddMemberState createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
  final nameController = TextEditingController();
  final relationController = TextEditingController();
  final birthController = TextEditingController();
  String url;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    relationController.dispose();
    birthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        title: Text(
          "Add family member",
          style: TextStyle(
            fontFamily: 'raleway',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: const BorderSide(),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    hintText: '',
                    labelText: 'Name'),
                controller: nameController,
                style: TextStyle(fontSize: 18, fontFamily: 'raleway'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: const BorderSide(),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    hintText: '',
                    labelText: 'Relation'),
                controller: relationController,
                style: TextStyle(fontSize: 18, fontFamily: 'raleway'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: const BorderSide(),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    hintText: '',
                    labelText: 'Birth date'),
                controller: birthController,
                style: TextStyle(fontSize: 18, fontFamily: 'raleway'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: RaisedButton(
                onPressed: () {
                  _pickSaveImage();
                },
                textColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  padding: const EdgeInsets.all(13.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: Text('Select photo',
                      style: TextStyle(fontSize: 20, fontFamily: 'raleway')),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: RaisedButton(
                onPressed: () {
                  _storeData();
                },
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  padding: const EdgeInsets.all(13.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF4169E1),
                        Color(0xFF7B68EE),
                      ],
                    ),
                  ),
                  child: Text('Add member',
                      style: TextStyle(fontSize: 20, fontFamily: 'raleway')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _pickSaveImage() async {
    File imageFile = await ImagePicker.pickImage(source: ImageSource.gallery, maxHeight: 360, maxWidth: 840, imageQuality: 75);
    StorageReference ref =
    FirebaseStorage.instance.ref().child(nameController.text.replaceAll(" ", "") + ".jpg");
    StorageUploadTask uploadTask = ref.putFile(imageFile);
    final StorageTaskSnapshot downloadUrl =
    (await uploadTask.onComplete);
    url = (await downloadUrl.ref.getDownloadURL());
    print(url);
  }

  void _storeData() async {
    String name = nameController.text;
    String relation = relationController.text;
    String birth = birthController.text;
    String family = "";
    var firestore = Firestore.instance;
    if(url != null) {
      print(url);
      if(Global().profile.data['family'].toString().length < 3) {
        family = name + "," + relation + "," + birth + "," + url;
      } else {
        family = Global().profile.data['family'] + "*" + name + "," + relation + "," + birth + "," + url;
      }
      await firestore.collection('profiles').document(Global().user.toString()).updateData({'family' : family});
      Navigator.pop(context);
    }
  }
}
