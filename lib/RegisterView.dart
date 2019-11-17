import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qrscan/qrscan.dart' as scanner;

import 'BottomNavBar.dart';
import 'Global.dart';
import 'LoadingView.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final titleControler = TextEditingController();
  final birthControler = TextEditingController();
  final addressControler = TextEditingController();
  final bloodControler = TextEditingController();
  String url;

  var global = Global();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleControler.dispose();
    birthControler.dispose();
    addressControler.dispose();
    bloodControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return global.careTaker ? (global.user == null ? Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        title: Text(
          "Register a patient",
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
                controller: titleControler,
                style: TextStyle(fontSize: 18, fontFamily: 'raleway'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                maxLines: null,
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: const BorderSide(),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    hintText: '',
                    labelText: 'Birth date'),
                controller: birthControler,
                style: TextStyle(fontSize: 18, fontFamily: 'raleway'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                maxLines: null,
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: const BorderSide(),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    hintText: '',
                    labelText: 'Address'),
                controller: addressControler,
                style: TextStyle(fontSize: 18, fontFamily: 'raleway'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                maxLines: null,
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: const BorderSide(),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    hintText: '',
                    labelText: 'Blood type'),
                controller: bloodControler,
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
                  child: Text('Register',
                      style: TextStyle(fontSize: 20, fontFamily: 'raleway')),
                ),
              ),
            ),
          ],
        ),
      ),
    ) : LoadingView()) : global.user == null ? waitingScreen() : LoadingView();
  }

  Widget waitingScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("In order to activate your account, please scan the qr code from your caretaker's phone", style: TextStyle(fontSize: 15,), textAlign: TextAlign.center,),
          ),
          RaisedButton(
            onPressed: () {
              qrScanner();
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
              child: Text('Use QR',
                  style: TextStyle(fontSize: 20, fontFamily: 'raleway')),
            ),
          ),
        ],
      ),
    );
  }

  Future qrScanner() async{


    String cameraScanResult = await scanner.scan();
    print(cameraScanResult);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("user", int.parse(cameraScanResult));
    setState(() {
      global.user = int.parse(cameraScanResult);
    });
    return null;
  }

  Future _pickSaveImage() async {
    File imageFile = await ImagePicker.pickImage(source: ImageSource.gallery, maxHeight: 360, maxWidth: 840, imageQuality: 75);
    StorageReference ref =
    FirebaseStorage.instance.ref().child(titleControler.text.replaceAll(" ", "") + ".jpg");
    StorageUploadTask uploadTask = ref.putFile(imageFile);
    final StorageTaskSnapshot downloadUrl =
    (await uploadTask.onComplete);
    url = (await downloadUrl.ref.getDownloadURL());
  }

  void _storeData() async {
    String title = titleControler.text;
    String birth = birthControler.text;
    String address = addressControler.text;
    String blood = bloodControler.text;
    var firestore = Firestore.instance;
    if(url != null) {
      await firestore.collection('profiles').document('1').setData({
        'name': title,
        'birth': birth,
        'image': url,
        'family': "",
        'blood': blood,
        'address': address,
        'id': 1,
        'isRegistered' : false
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt("user", 1);
      setState(() {
        Global().user = 1;
      });
    }
  }
}
