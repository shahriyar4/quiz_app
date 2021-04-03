import 'package:flutter/material.dart';
import 'screens/quiz_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QUIZ APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FLAGS QUIZ APP", style: TextStyle(fontSize: 22),),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "WELCOME TO QUIZ APP",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: RaisedButton(
                child: Text("START TO QUIZ" ,style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                color: Colors.yellow,
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> QuizScreen()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
