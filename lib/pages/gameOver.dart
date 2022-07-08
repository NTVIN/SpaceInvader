import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:spaceInvader/pages/game_page.dart';

class GameOver extends StatelessWidget {
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
        new AlertDialog(
          content: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Game Over"),
            ],
          ),
          actions: <Widget>[
            new FlatButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    Vibration.vibrate(duration: 500);
                    return GamePage();
                  }),
                );
              },
              textColor: Theme.of(context).primaryColor,
              child: const Text('Restart'),

            ),
          ],
        ),
        //moveStone(Image.asset( 'assets/images/stone.png')),
      ],
    ));
  }
}
