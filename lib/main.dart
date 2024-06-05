import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
// <<<<<<< HEAD
import 'package:stripe_app/firebase_options.dart';
import 'package:stripe_app/home.dart';
// import 'package:stripe_app/paymentScreen.dart';
import 'package:stripe_app/theme.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
// ...
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  // await dotenv.load(fileName: '.env');
  Stripe.publishableKey ="pk_test_51PL4G3SIpYEYlCLIAm9IlWxbbHlWS3kqDLu44zcHOaC7PKSVBMbTkJU59xvZ7e3EnJG19UFYbBXZefQ0p0REUPVy00IoTS8V72" ;
  // await Stripe.instance.applySettings();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: MyHome(),
      theme: ThemeClass.lightTheme, // applies this theme if the device theme is light mode
      darkTheme: ThemeClass.darkTheme,
    );
  }
}
// <<<<<<< HEAD
// =======

// >>>>>>> origin/master
