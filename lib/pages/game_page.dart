import 'dart:async';
import 'package:spaceInvader/objects/stone.dart';
import 'package:flutter/material.dart';
import 'package:spaceInvader/objects/spaceship.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:vibration/vibration.dart';
import 'package:better_sound_effect/better_sound_effect.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double posX = 100, posY = 250;

  double stoneX = 50, stoneY = 0;

  late Timer _timer;

  moveStone() {
    setState(
      () {
        stoneY += 10;
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      moveStone();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
            decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/images/space_home.png"),
            fit: BoxFit.cover,
          ),
        )),
        //https://www.youtube.com/watch?v=VX2V0fjuRas
        StreamBuilder<GyroscopeEvent>(
            stream: SensorsPlatform.instance.gyroscopeEvents,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                posX = posX + (snapshot.data!.y * 15);
                posY = posY + (snapshot.data!.x * 15);
                Vibration.vibrate(
                    //pattern: [2000, 1000, 2000, 3000], intensities: [1]
                    );
                //Vibrate.vibrateWithPauses(pauses);
              }
              return Transform.translate(
                offset: Offset(posX, posY),
                child: Spaceship(),
              );
            }),
        Container(
            child: Image.asset(
          'assets/images/spaceship.png',
        )),
      ],
    ));
  }
}
