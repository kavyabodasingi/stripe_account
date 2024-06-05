import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:stripe_app/home.dart';


//import 'package:stripe_account/paymentScreen.dart';
=======
import 'package:stripe_account/paymentScreen.dart';
>>>>>>> origin/master
class Success extends StatefulWidget {
  const Success({super.key});


  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>MyHome())), icon: Icon(Icons.arrow_back)),
        actions: [
      
      ],),
      body:Container(
        decoration: BoxDecoration(
          image:DecorationImage(image: AssetImage("assets/images/PaymentSuccess.png"),fit:BoxFit.cover)
=======
      appBar: AppBar(actions: [
        IconButton(onPressed: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>PaymentScreen())), icon: Icon(Icons.arrow_back))
      ],),
      body:Container(
        decoration: BoxDecoration(
          image:DecorationImage(image: AssetImage("assets/PaymentSuccess.png"),fit:BoxFit.cover)
>>>>>>> origin/master
        ),
      )
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> origin/master
