import 'package:flutter/material.dart';
import 'package:spaceInvader/objects/spaceship.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';


class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double posX = 150, posY = 250;

  final Iterable<Duration> pauses = [
    const Duration(seconds: 10),
    const Duration(seconds: 15),
    const Duration(seconds: 20),
  ];

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
        StreamBuilder<GyroscopeEvent>(
            stream: SensorsPlatform.instance.gyroscopeEvents,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                posX = posX + (snapshot.data!.y * 40);
                posY = posY + (snapshot.data!.x * 40);
                //Vibration.vibrate(pattern: [1000, 1000, 2000, 2500], intensities: [255]);
                Vibrate.vibrateWithPauses(pauses);

              }


              return Transform.translate(
                offset: Offset(posX, posY),
                child: Spaceship(),

              );
            }
            )
      ],
    ));
  }
}
