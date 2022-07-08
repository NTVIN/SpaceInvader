import 'package:flutter/material.dart';

class Spaceship extends StatelessWidget{


  @override
  Widget build(BuildContext context){
    return Align(
      alignment: Alignment.topLeft,
                child: Image.asset(
            'assets/images/spaceship.png',
        )
    );


  }
}