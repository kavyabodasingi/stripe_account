import 'package:flutter/material.dart';
import 'package:stripe_account/paymentScreen.dart';
class Success extends StatefulWidget {
  const Success({super.key});


  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>PaymentScreen())), icon: Icon(Icons.arrow_back))
      ],),
      body:Container(
        decoration: BoxDecoration(
          image:DecorationImage(image: AssetImage("assets/PaymentSuccess.png"),fit:BoxFit.cover)
        ),
      )
    );
  }
}