import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_account/firebase_options.dart';
import 'package:stripe_account/paymentScreen.dart';
import 'package:stripe_account/theme.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  


// ...

await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  Stripe.publishableKey = 'pk_test_51PL4G3SIpYEYlCLIAm9IlWxbbHlWS3kqDLu44zcHOaC7PKSVBMbTkJU59xvZ7e3EnJG19UFYbBXZefQ0p0REUPVy00IoTS8V72';
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaymentScreen(),
      theme: ThemeClass.lightTheme, // applies this theme if the device theme is light mode
      darkTheme: ThemeClass.darkTheme,
    );
  }
}

