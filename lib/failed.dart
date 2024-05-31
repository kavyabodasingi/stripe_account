import 'package:flutter/material.dart';
import 'package:stripe_account/paymentScreen.dart';
class Failed extends StatelessWidget {
  const Failed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>PaymentScreen())), icon: Icon(Icons.arrow_back))
      ],),
      body:Container(
        decoration: BoxDecoration(
          image:DecorationImage(image: AssetImage("assets/failed.png"),fit:BoxFit.cover)
        ),
      )
    );
  }
}