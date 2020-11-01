import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:summaryapp/services/hiveDatabase.dart';

class SlideView extends StatefulWidget {
  @override
  _SlideViewState createState() => _SlideViewState();
}

class _SlideViewState extends State<SlideView> {
  HiveDatabase _hiveDb = HiveDatabase();
  dynamic summ = [
    Text(
        "A layered architecture enables communication exclusively between operating system components in adjacent layers.",
        style: TextStyle(fontSize: 19.0)),
  ];

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Swiper(
        layout: SwiperLayout.CUSTOM,
        customLayoutOption:
            new CustomLayoutOption(startIndex: -1, stateCount: 3)
                .addRotate([-45.0 / 180.0, 0.0, 45.0 / 180.0]).addTranslate([
          new Offset(-370.0, -40.0),
          new Offset(0.0, 0.0),
          new Offset(370.0, -40.0)
        ]),
        itemHeight: 250.0,
        itemWidth: 300.0,
        itemBuilder: (BuildContext context, int index) {
          return 
          Container(
              width: 250.0,
              height: 350.0,
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                border: Border.all(width: 3.0, color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Center(
                child: Container(
                  child: Text('Caleb'),
                  // summ[index],
                ),
              ));
        },
        itemCount: summ.length,
      ),
    );
  }
}
