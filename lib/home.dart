
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_app/paymentScreen.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final _countryController = TextEditingController();
  final _addressController = TextEditingController();
  final _cardHolderNameController = TextEditingController();
  final _moneyController = TextEditingController();
  final _stateController = TextEditingController();
  Map<String, dynamic>? paymentIntent;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String selectedCurrency = "USD";

  Future<void> initPaymentSheet() async {
    try {
      final data = await createPaymentintent(
        address: _addressController.text,
        state: _stateController.text,
        country: _countryController.text,
        currency: selectedCurrency,
        amount: _moneyController.text,
        name: _cardHolderNameController.text,
      );

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          customFlow: false,
          merchantDisplayName: 'Merchant',
          paymentIntentClientSecret: data['client_secret'],
          customerEphemeralKeySecret: data['ephemeralKey'],
          customerId: data['customer'],
          style: ThemeMode.dark,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
      rethrow;
    }
  }

  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Payment successful!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Payment failed: $message'),
        backgroundColor: Colors.red,
      ),
    );
  }

  List<String> currencyList = <String>[
    'USD',
    'INR',
    'EUR',
    'JPY',
    'GBP',
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final Color containerColor = Theme.of(context).colorScheme.surface;

    return Scaffold(
      appBar: AppBar(title: Text('Payment')),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Container(
              width: screenWidth * 0.9,
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
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
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
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Required";
                        }
                        return null;
                      },
                      controller: _addressController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'Address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Required";
                              }
                              return null;
                            },
                            controller: _stateController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'State',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: selectedCurrency,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedCurrency = newValue!;
                              });
                            },
                            items: currencyList.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              labelText: 'Currency',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Required";
                        }
                        return null;
                      },
                      controller: _moneyController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Money (eg: 1000 cents=10 rupees)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    // padding: EdgeInsets.fromLTRB(
                    //   screenWidth * 0.1,
                    //   screenWidth * 0.05,
                    //   screenWidth * 0.1,
                    //   screenWidth * 0.5,
                    // ),
                    padding:EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async{
                        if (_formKey.currentState!.validate()) {
                        await initPaymentSheet();
                        try{
                        await Stripe.instance.presentPaymentSheet();
                        _showSuccessMessage();
                        _addressController.clear();
                        _cardHolderNameController.clear();
                        // _cardNumberController.clear();
                        _stateController.clear();
                        _moneyController.clear();
                        }catch(e){
                          _showErrorMessage(e.toString());
                        }

                        }

                      },
                      child: Text(
                        "Pay Now ${_moneyController.text}",
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