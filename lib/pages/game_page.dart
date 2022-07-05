import 'package:flutter/material.dart';


class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();

}

class _GamePageState extends State<GamePage>{

    @override
  Widget build(BuildContext context){
      return Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(image: new AssetImage("assets/images/space_home.png"),
                  fit: BoxFit.cover,),
              )
          );
    }


}