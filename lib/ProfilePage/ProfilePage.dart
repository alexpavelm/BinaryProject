import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("Your profile",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'raleway',
                )),
          ),
          Card(
            elevation: 10,
            child: Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10, right: 15),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/you.jpg',
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text("Samuel Nickelson",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w600,
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text("7th June 1947 - 72yo",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w400,
                      )),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
