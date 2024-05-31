// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;

// class PaymentScreen extends StatefulWidget {
//   const PaymentScreen({super.key});

//   @override
//   State<PaymentScreen> createState() => _PaymentScreenState();
// }

// class _PaymentScreenState extends State<PaymentScreen> {
//   final TextEditingController _cardNumber = TextEditingController();
//   final TextEditingController _cvv = TextEditingController();
//   final TextEditingController _expiry = TextEditingController();
//   final TextEditingController _cardHolderName = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   Future<Map<String, dynamic>> _createPaymentIntent(String paymentMethodId) async {
//     final url = Uri.parse('https://<your-cloud-function-url>/payment');
//     final response = await http.post(
//       url,
//       body: json.encode({
//         'paymentMethodId': paymentMethodId,
//         'currency': 'inr',
//         'amount': 1000, // amount in cents
//       }),
//       headers: {'Content-Type': 'application/json'},
//     );

//     return json.decode(response.body);
//   }

//   Future<void> _processPayment() async {
//     try {
//       // Create a payment method
//       final paymentMethod = await Stripe.instance.createPaymentMethod(
//         params: PaymentMethodParams.card(
//           paymentMethodData: PaymentMethodData(
//             billingDetails: BillingDetails(
//               name: _cardHolderName.text,
//             ),
//           ),
//         ),
//       );

//       // Call your backend to create a PaymentIntent
//       final paymentIntent = await _createPaymentIntent(paymentMethod.id);

//       // Confirm the payment
//       await Stripe.instance.confirmPayment(
//         // paymentIntent['clientSecret'],
//         // PaymentMethodParams.cardFromToken(paymentMethodId: paymentMethod.id),
        
//         data: PaymentMethodParams.card(
//           paymentMethodData: PaymentMethodData(
//             billingDetails: BillingDetails(
//               name: _cardHolderName.text,
//             ))),
//           paymentIntentClientSecret: paymentIntent['clientSecret'],
//       );

//       _showSuccessMessage();
//     } catch (e) {
//       _showErrorMessage(e.toString());
//     }
//   }

//   void _showSuccessMessage() {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Payment successful!')),
//     );
//   }

//   void _showErrorMessage(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Payment failed: $message')),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     final Color containerColor = Theme.of(context).colorScheme.surface;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Payment Screen"),
//         backgroundColor: Colors.blue,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.person),
//             iconSize: 30,
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Form(
//             key: _formKey,
//             child: Container(
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Color.fromARGB(255, 216, 233, 247),
//                     Color.fromARGB(255, 243, 189, 185),
//                   ],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: BorderRadius.all(Radius.circular(7.0)),
//               ),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(
//                       screenWidth * 0.1,
//                       screenWidth * 0.3,
//                       screenWidth * 0.1,
//                       0,
//                     ),
//                     child: TextField(
//                       controller: _cardHolderName,
//                       keyboardType: TextInputType.name,
//                       decoration: InputDecoration(
//                         labelText: 'Card Holder Name',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(9.0),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(
//                       screenWidth * 0.1,
//                       screenWidth * 0.05,
//                       screenWidth * 0.1,
//                       0,
//                     ),
//                     child: TextField(
//                       controller: _cardNumber,
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                         labelText: 'Card Number',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(9.0),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(
//                       screenWidth * 0.1,
//                       screenWidth * 0.05,
//                       screenWidth * 0.1,
//                       0,
//                     ),
//                     child: TextField(
//                       controller: _expiry,
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                         labelText: 'Expiry Date (MM/YY)',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(9.0),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(
//                       screenWidth * 0.1,
//                       screenWidth * 0.05,
//                       screenWidth * 0.1,
//                       0,
//                     ),
//                     child: TextField(
//                       controller: _cvv,
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                         labelText: 'CVV',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(9.0),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(
//                       screenWidth * 0.1,
//                       screenWidth * 0.05,
//                       screenWidth * 0.1,
//                       screenWidth * 0.5,
//                     ),
//                     child: ElevatedButton(
//                       onPressed: _processPayment,
//                       child: Text(
//                         "Pay Now",
//                         style: TextStyle(color: containerColor),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:stripe_payment/stripe_payment.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  final _cardHolderNameController = TextEditingController();
  Map<String, dynamic>? paymentIntent;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    StripePayment.setOptions(
      StripeOptions(
        publishableKey: "pk_test_51PL4G3SIpYEYlCLIAm9IlWxbbHlWS3kqDLu44zcHOaC7PKSVBMbTkJU59xvZ7e3EnJG19UFYbBXZefQ0p0REUPVy00IoTS8V72", // Replace with your actual Stripe publishable key
        merchantId: "Test",
        androidPayMode: 'test',
      ),
    );
  }
  Future<void> payment() async{
    try{
    Map<String,dynamic> body={
      'amount':1000,//10 rupees == 1000 cents
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
        merchantDisplayName: 'Kavya',

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

  // Future<void> _processPayment() async {
  //   final CreditCard card = CreditCard(
  //     number: _cardNumberController.text,
  //     expMonth: int.parse(_expiryDateController.text.split('/')[0]),
  //     expYear: int.parse(_expiryDateController.text.split('/')[1]),
  //     cvc: _cvvController.text,
  //   );

  //   try {
  //     var paymentMethod = await StripePayment.createPaymentMethod(
  //       PaymentMethodRequest(card: card),
  //     );

  //     var paymentIntent = await _createPaymentIntent(paymentMethod.id.toString());
  //     var paymentConfirmation = await StripePayment.confirmPaymentIntent(
  //       PaymentIntent(
  //         clientSecret: paymentIntent['clientSecret'],
  //         paymentMethodId: paymentMethod.id,
  //       ),
  //     );

  //     if (paymentConfirmation.status == 'succeeded') {
  //       _showSuccessMessage();
  //     } else {
  //       _showErrorMessage(paymentConfirmation.status.toString());
  //     }
  //   } catch (e) {
  //     _showErrorMessage(e.toString());
  //   }
  // }

  // Future<Map<String, dynamic>> _createPaymentIntent(String paymentMethodId) async {
  //   final url = Uri.parse('https://<your-cloud-function-url>/payment');  // Use the URL provided by Firebase after deployment
  //   final response = await http.post(
  //     url,
  //     body: json.encode({
  //       'paymentMethodId': paymentMethodId,
  //       'currency': 'INR',
  //       'amount': 1000, // amount in cents
  //     }),
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Authorization':'Bearer sk_test_51PL4G3SIpYEYlCLIULDKZXJkg0ojofG3DDus2VyRBubKK9YwAoo7UTpeAJv6JB95QhZdflG271qRylITk6RUQ6tO00lU4luKzM',
  //       },
  //   );

  //   return json.decode(response.body);
  // }

  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Payment successful!')),
    );
    
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Payment failed: $message')),
    );
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
                    child: TextField(
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
                    child: TextField(
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
                    child: TextField(
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
                    child: TextField(
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
                      screenWidth * 0.5,
                    ),
                    child: ElevatedButton(
                      onPressed: (){
                        if (_formKey.currentState?.validate() ?? true){
                          return "Required";
                        }
                        else{
                          return payment;
                        }
                                        
                          },
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