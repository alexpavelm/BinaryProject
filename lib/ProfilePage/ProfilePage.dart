import 'package:binary_project/DataObjects/ProfileObject.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Global.dart';

class ProfilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var global = Global();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getProfile(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          return profileView(context, ProfileObject.fromSnapshot(global.profile));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Future getProfile() async {
    var firebase = Firestore.instance;
    global.profile = await firebase.collection("profiles").reference().document(global.user.toString()).get();
    return global.profile;
  }

  Widget profileView(BuildContext context, ProfileObject profile) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
          Colors.blue.shade200,
          Colors.deepPurpleAccent.shade100.withOpacity(.5)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            child: ListView(
              children: <Widget>[
                Center(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 40.0, bottom: 20),
                      child: ClipOval(
                        child: Image.network(
                          profile.image,
                          fit: BoxFit.cover,
                          width: 150,
                          height: 150,
                        ),
                      )),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      profile.name,
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: Text("Birth date: " + profile.birth,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
                Center(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          top: 4, bottom: 4, left: 50, right: 50),
                      child: Text(
                          "Address: " + profile.address,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w500,
                          ))),
                ),
                Center(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          top: 4, bottom: 4, left: 50, right: 50),
                      child: Text("Blood type: " + profile.blood,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w500,
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, bottom: 20, left: 40, right: 40),
                  child: Container(height: 0.5, color: Colors.black87),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, left: 5),
                  child: Text('Family members:',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                      )),
                ),
                Column(
                  children: profile.family.split("*").map((data) => familyCard(data)).toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget familyCard(String data) {
  List<String> list = data.split(",");
  String name = list[0];
  String relation = list[1];
  String birthdate = list[2];
  String image = list[3];
  return Padding(
    padding: const EdgeInsets.only(bottom: 3),
    child: Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(top: 8.0, bottom: 8, left: 15, right: 20),
            child: ClipOval(
              child: Image.network(
                image,
                fit: BoxFit.cover,
                width: 80,
                height: 80,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(name,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                        )),
                    Text(" (" + relation + ")",
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ))
                  ],
                ),
                Text(
                  birthdate,
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
