import 'dart:collection';
import 'package:flags_quiz_app/moduls/flags.dart';
import 'package:flags_quiz_app/moduls/flagsdao.dart';
import 'package:flutter/material.dart';

import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var questions = List<Flags>();
  var wrongOption = List<Flags>();
  Flags trueQuestions;
  var allOptions = HashSet<Flags>();

  int questionsCounter = 0;
  int trueCounter = 0;
  int falseCounter = 0;

  String flagsPhotoName = "placeholder.png";
  String buttonAText = "";
  String buttonBText = "";
  String buttonCText = "";
  String buttonDText = "";

  @override
  void initState() {
    super.initState();
    takeQuestions();

  }

  Future<void> takeQuestions() async {
    questions = await Flagsdao().randomGet5();
    uploadQuestions();
  }

  Future<void> uploadQuestions() async {
    trueQuestions = questions[questionsCounter];
    flagsPhotoName = trueQuestions.flags_photo;

    wrongOption = await Flagsdao().randomGetFalse3(trueQuestions.flags_id);
    allOptions.clear();
    allOptions.add(trueQuestions);
    allOptions.add(wrongOption[0]);
    allOptions.add(wrongOption[1]);
    allOptions.add(wrongOption[2]);

    buttonAText = allOptions.elementAt(0).flags_name;
    buttonBText = allOptions.elementAt(1).flags_name;
    buttonCText = allOptions.elementAt(2).flags_name;
    buttonDText = allOptions.elementAt(3).flags_name;

    setState(() {});
  }

  void questionsCounterControl(){
    questionsCounter= questionsCounter+1;

    if (questionsCounter != 5){
      uploadQuestions();
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            correctNum: trueCounter,
          ),
        ),
      );
    }
  }

  void trueControl(String buttonText){
    if (trueQuestions.flags_name == buttonText) {
      trueCounter= trueCounter+1;
    } else {
      falseCounter=falseCounter+1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FLAGS QUIZ APP",style: TextStyle( fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("True: $trueCounter", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("False: $falseCounter", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            questionsCounter != 5
                ? Text("Questions: ${questionsCounter + 1} ",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
                : Text("Questions: 5", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Image.asset("assets/images/$flagsPhotoName"),
            SizedBox(
              width: 250,
              height: 50,
              child: RaisedButton(
                child: Text(
                  buttonAText,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                color: Colors.yellow,
                onPressed: () {
                  trueControl(buttonAText);
                  questionsCounterControl();
                },
              ),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: RaisedButton(
                child: Text(
                  buttonBText,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),color: Colors.yellow,
                onPressed: () {
                  trueControl(buttonBText);
                  questionsCounterControl();
                },
              ),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: RaisedButton(
                child: Text(
                  buttonCText,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),color: Colors.yellow,
                onPressed: () {
                  trueControl(buttonCText);
                  questionsCounterControl();
                },
              ),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: RaisedButton(
                child: Text(
                  buttonDText,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),color: Colors.yellow,
                onPressed: () {
                  trueControl(buttonDText);
                  questionsCounterControl();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
