import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:spaceInvader/pages/game_page.dart';
import 'package:vibration/vibration.dart';
import 'package:better_sound_effect/better_sound_effect.dart';

class Homepage extends StatefulWidget{
  @override
  _HomePageState createState()=> _HomePageState();
}



class _HomePageState extends State<Homepage>{
 final soundEffect = BetterSoundEffect();
  int? soundId;


  @override
  void initState() {
    super.initState();

    /*
    Future.microtask(() async {
      soundId = await soundEffect.loadAssetAudioFile("assets/sounds/megasus.mp3");
    });
     */
  }
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
                textAlign: TextAlign.center,
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
                      /*
                      if (soundId != null) {
                        soundEffect.play(soundId!);
                      }
                      */

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

