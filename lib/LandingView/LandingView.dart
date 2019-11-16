import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Global.dart';

var global = Global();
class LandingView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3 * 2,
            child: Icon(Icons.account_circle, size: MediaQuery.of(context).size.width - 20, color: Colors.blue,),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text("You are not signed in", style: TextStyle(fontFamily: 'Raleway', color: Colors.black.withOpacity(.8), fontSize: 20),),
              ),
              RaisedButton(
                child: Text("Sign in", style: TextStyle(fontFamily: 'Raleway', color: Colors.blue),),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Colors.blue)
                ),
                onPressed: () {
                  //FIREBASE AUTH
                  global.userID = Future.delayed(Duration(seconds: 1));

                },
              ),
              RaisedButton(
                child: Text("Register", style: TextStyle(fontFamily: 'Raleway', color: Colors.blue),),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Colors.blue)
                ),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
