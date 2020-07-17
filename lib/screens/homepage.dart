import 'package:flutter/material.dart';
import 'package:carpooladmin/services/mapping.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.lightBlue, Colors.red]
              ),
            ),
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
        child: Row(
          children: <Widget>[
            StaticMap(),
            Column(
              children: <Widget>[

            ],
            )
        ],
        )
        ),
    );
  }
}