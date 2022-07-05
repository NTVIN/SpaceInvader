import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
          children: <Widget>[
            Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(image: new AssetImage("assets/images/space.gif"), fit: BoxFit.cover,),
                )
            ),

            SizedBox(


              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 60,
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
                    primary: Colors.white10
                ),
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return _GamePageState();
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

