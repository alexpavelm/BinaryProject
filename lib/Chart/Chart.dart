import 'package:binary_project/DataObjects/MoodObject.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Global.dart';

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  var global = Global();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildBody(),
    );
  }

  Widget buildBody() {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('moods').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        global.moods = snapshot.data.documents;
        return buildList(global.moods);
      },
    );
  }

  _convert(String mood) {
    if (mood == "great")
      return 40;
    if (mood == "good")
      return 35;
    if (mood == "meh")
      return 30;
    if (mood == "bad")
      return 20;
  }

  Widget buildList(List<DocumentSnapshot> snapshot) {
    List<Mood> moods = snapshot.map((data) => Mood.fromSnapshot(data)).toList();
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                title: ChartTitle(text: 'Mood chart for the past months',
                textStyle: ChartTextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                )),
                legend: Legend(isVisible: true),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<Mood, String>>[
          LineSeries<Mood, String>(
              dataSource: moods,
              xValueMapper: (Mood mood, _) => mood.date,
              yValueMapper: (Mood mood, _) => _convert(mood.mood),
              dataLabelSettings: DataLabelSettings(isVisible: true))
        ])),
      elevation: 10,
    );
  }
}
