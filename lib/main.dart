import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatefulWidget {
  @override
  _XylophoneAppState createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  Random rnd = Random();
  final player = AudioCache();
  Timer timer;
  Color _color;
  void changeSoundColor() {
    setState(() {
      int randomInt = rnd.nextInt(7) + 1;

      // player.play('note$randomInt.wav');
      _color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
      // print(randomInt);
    });
  }

  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded buildKey({Color color, int soundNumber}) {
    return Expanded(
      child: TextButton(
        child: Container(),
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () {
          playSound(soundNumber);
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    timer =
        Timer.periodic(Duration(seconds: 1), (Timer t) => changeSoundColor());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: _color,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(color: Colors.black, soundNumber: 1),
              buildKey(color: Colors.white, soundNumber: 2),
              buildKey(color: Colors.black, soundNumber: 3),
              buildKey(color: Colors.white, soundNumber: 4),
              buildKey(color: Colors.black, soundNumber: 5),
              buildKey(color: Colors.white, soundNumber: 6),
              buildKey(color: Colors.black, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
