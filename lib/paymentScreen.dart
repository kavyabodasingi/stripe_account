
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

import 'failed.dart';
import 'success.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  final _cardHolderNameController = TextEditingController();
  final _moneyController=TextEditingController();
  Map<String, dynamic>? paymentIntent;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Future<void> payment() async{
    try{
    Map<String,dynamic> body={
      'amount':_moneyController.text,//10 rupees == 1000 cents
      'currency':"INR",
    };
    var response =await http.post(
      Uri.parse('https://api.stripe.com/v1/payment_intents'),
      headers:{
        'Content-Type': 'application/json',
        'Authorization':'Bearer sk_test_51PL4G3SIpYEYlCLIULDKZXJkg0ojofG3DDus2VyRBubKK9YwAoo7UTpeAJv6JB95QhZdflG271qRylITk6RUQ6tO00lU4luKzM',
      }
    );
    paymentIntent=json.decode(response.body);
  }catch(e){
    throw Exception(e);
  }

  //initializing payment sheet
  await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntent!['Client Secret'],
        style:ThemeMode.light,
        merchantDisplayName: _cardHolderNameController.text,

  )).then((value)=>{});

  // Display Payment Sheet

  try{
      await Stripe.instance.presentPaymentSheet().then((value)=>{
        // Success State
        _showSuccessMessage(),
      });
  }catch(error){
      _showErrorMessage(error.toString());
  }
  }
  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Payment successful!')),
    );
    Navigator.push(context,MaterialPageRoute(builder:(_)=>Success()));
    
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Payment failed: $message')),
    );
    Navigator.push(context,MaterialPageRoute(builder:(_)=>Failed()));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final Color containerColor = Theme.of(context).colorScheme.surface;
    return Scaffold(
      appBar: AppBar(title: Text('Payment')),
      
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 216, 233, 247),
                    Color.fromARGB(255, 243, 189, 185),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.all(Radius.circular(7.0)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      screenWidth * 0.1,
                      screenWidth * 0.3,
                      screenWidth * 0.1,
                      0,
                    ),
                    child: TextFormField(
                      validator:(value){
                        if (value==null || value.isEmpty){
                        return "Required";
                        }
                        return null;
                      },
                      controller: _cardHolderNameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'Card Holder Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      screenWidth * 0.1,
                      screenWidth * 0.05,
                      screenWidth * 0.1,
                      0,
                    ),
                    child: TextFormField(
                      validator:(value){
                        if (value==null || value.isEmpty){
                        return "Required";
                        }
                        return null;
                      },
                      controller: _cardNumberController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Card Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      screenWidth * 0.1,
                      screenWidth * 0.05,
                      screenWidth * 0.1,
                      0,
                    ),
                    child: TextFormField(
                        validator:(value){
                        if (value==null || value.isEmpty){
                        return "Required";
                        }
                        return null;
                      },
                      controller: _expiryDateController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Expiry Date (MM/YY)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      screenWidth * 0.1,
                      screenWidth * 0.05,
                      screenWidth * 0.1,
                      0,
                    ),
                    child: TextFormField(
                      validator:(value){
                        if (value==null || value.isEmpty){
                        return "Required";
                        }
                        return null;
                      },
                      controller: _cvvController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'CVV',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                      ),
                    ),
                  ),
                    Padding(
                    padding: EdgeInsets.fromLTRB(
                      screenWidth * 0.1,
                      screenWidth * 0.05,
                      screenWidth * 0.1,
                      0,
                    ),
                    child: TextFormField(
                      validator:(value){
                        if (value==null || value.isEmpty){
                        return "Required";
                        }
                        return null;
                      },
                      controller: _moneyController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'money in cents eg:1000 cents=10 rupees',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      screenWidth * 0.1,
                      screenWidth * 0.05,
                      screenWidth * 0.1,
                      screenWidth * 0.5,
                    ),
                    child: ElevatedButton(
                      onPressed: ()=>payment,
                      child: Text(
                        "Pay Now",
                        style: TextStyle(color: containerColor),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}