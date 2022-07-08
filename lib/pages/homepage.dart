import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:spaceInvader/pages/game_page.dart';
import 'package:vibration/vibration.dart';

class Homepage extends StatefulWidget{
  @override
  _HomePageState createState()=> _HomePageState();
}



class _HomePageState extends State<Homepage>{

  @override
 Widget build(BuildContext context){
    return  MaterialApp(
      title: 'Flutter Tutorial',
      home: Scaffold(
        body: Stack(
          children: [
            Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(image: new AssetImage("assets/images/space.gif"), fit: BoxFit.cover,),
                )
            ),

            SizedBox(


              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 75,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 7.0,
                      color: Colors.white,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    FlickerAnimatedText('Space Invader'),

                  ],
                ),
              ),

            ),
            Align(
              alignment: Alignment.bottomCenter,

              child: ElevatedButton(

                child: Text('PLAY'),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(120,70),
                    primary: Colors.white10

                ),
                onPressed: () {
                  //HapticFeedback.heavyImpact();
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      Vibration.vibrate(duration: 500);
                      return GamePage();
                    }),
                  );
                },),
            )


          ],
        )


      ),
    );

  }


}

