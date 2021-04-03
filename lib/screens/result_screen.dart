import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  int correctNum;

  ResultScreen({this.correctNum});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FLAGS QUIZ APP",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("TRUE : ${widget.correctNum} FALSE:${5 - widget.correctNum}",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Text(
              " ${((widget.correctNum * 100) / 5).toInt()} % SUCCESS",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white54,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: RaisedButton(
                child: Text(
                  "TRY AGAIN",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
                color: Colors.yellow,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
