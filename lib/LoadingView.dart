import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'BottomNavBar.dart';
import 'Global.dart';

class LoadingView extends StatefulWidget {
  @override
  _LoadingViewState createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  var global = Global();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (_, snapshot) {
      if(snapshot.connectionState == ConnectionState.done) {
        return BottomNavBar();
      } else {
        return Center(child: CircularProgressIndicator());
      }
    },
      future: getProfile(),);
  }


  Future getProfile() async {
    var firebase = Firestore.instance;
    global.profile = await firebase.collection("profiles").reference().document(global.user.toString()).get();
    print("i got it on " + global.user.toString());
    if(global.careTaker == false) {
      await global.profile.reference.updateData({'isRegistered' : true});
    }
    return global.profile;
  }
}
