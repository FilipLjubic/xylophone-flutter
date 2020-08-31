import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatefulWidget {
  @override
  _XylophoneAppState createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  List<Widget> buttons = [];
  final player = AudioCache();

  List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.lightBlue,
    Colors.purple
  ];

  void buttonFactory(myColorList) {
    for (int i = 1; i <= 7; i++) {
      var button = Expanded(
        child: FlatButton(
          child: null,
          color: myColorList[i - 1],
          onPressed: () {
            player.play('note$i.wav');
          },
        ),
      );
      buttons.add(button);
    }
  }

  @override
  void initState() {
    super.initState();

    buttonFactory(colors);
    for (int i = 1; i <= 7; i++) {
      player.load('note$i.wav');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buttons,
          ),
        ),
      ),
    );
  }
}
