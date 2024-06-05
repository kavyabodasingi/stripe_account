import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:stripe_app/home.dart';
=======
import 'package:stripe_account/paymentScreen.dart';
>>>>>>> origin/master
class Failed extends StatelessWidget {
  const Failed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
<<<<<<< HEAD
        IconButton(onPressed: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>MyHome())), icon: Icon(Icons.arrow_back))
      ],),
      body:Container(
        decoration: BoxDecoration(
          image:DecorationImage(image: AssetImage("assets/images/failed.png"),fit:BoxFit.cover)
=======
        IconButton(onPressed: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>PaymentScreen())), icon: Icon(Icons.arrow_back))
      ],),
      body:Container(
        decoration: BoxDecoration(
          image:DecorationImage(image: AssetImage("assets/failed.png"),fit:BoxFit.cover)
>>>>>>> origin/master
        ),
      )
    );
  }
}