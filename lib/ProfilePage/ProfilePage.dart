import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
          Colors.blue.shade200,
          Colors.deepPurpleAccent.shade100.withOpacity(.5)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 40.0, bottom: 20),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/you.jpg',
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
                      "Mark Nickelson",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: Text("Birth date: 7th June 1947 - 72yo",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'raleway',
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
                Center(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 4, left: 50, right: 50),
                      child: Text("Address: 6713 S Eastern Ave, Las Vegas, NV 89119, United States",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w500,
                          ))),
                ),
                Center(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 4, left: 50, right: 50),
                      child: Text("Blood type: AB+",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w500,
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, bottom: 20, left: 40, right: 40),
                  child: Container(height: 0.5, color: Colors.black87),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text('Family members:',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w700,
                      )),
                ),
                familyCard('assets/daughter.jpg', 'Karen Brown', '27 July 1776', ' (daughter)'),
                familyCard('assets/son.jpg', 'Karen Brown', '5 January 1770', ' (son-in-law)'),
                familyCard('assets/kid.jpg', 'Samir Brown', '24 September 2010',' (grand-child)')
              ],
            ),
          ),
        ),
      ),
    );
  }
}

  Widget familyCard(String image, String name, String birthdate, String relation) {
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
              padding: const EdgeInsets.only(top:8.0, bottom: 8, left: 15, right: 20),
              child: ClipOval(
                child: Image.asset(
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
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w700,
                      )),
                      Text(relation, style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ))
                    ],
                  ),
                  Text(birthdate, style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w500,
                  ),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }



