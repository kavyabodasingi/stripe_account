import 'dart:convert';

import 'package:http/http.dart' as http;
Future createPaymentintent({
  required String address,
  required String state,
  required String country,
  required String currency,
  required String amount,
  required String name,
})async{

  final url = Uri.parse('https://api.stripe.com/v1/payment_intents');
  // final secretKey=dotenv.env["sk_test_51PL4G3SIpYEYlCLIULDKZXJkg0ojofG3DDus2VyRBubKK9YwAoo7UTpeAJv6JB95QhZdflG271qRylITk6RUQ6tO00lU4luKzM"]!;
  final body={
    'amount': amount,
    'currency': currency.toLowerCase(),
    'automatic_payment_methods[enabled]': 'true',
    'shipping[name]': name,
    'shipping[address][line1]': address,
    'shipping[address][state]': state,
    'shipping[address][country]': country
  };

  final response= await http.post(url,
  headers: {
    "Authorization": "Bearer sk_test_51PL4G3SIpYEYlCLIULDKZXJkg0ojofG3DDus2VyRBubKK9YwAoo7UTpeAJv6JB95QhZdflG271qRylITk6RUQ6tO00lU4luKzM",
    'Content-Type': 'application/x-www-form-urlencoded'
  },
    body: body
  );

  print(body);

  if(response.statusCode==200){
    var json=jsonDecode(response.body);
    print(json);
    return json;
  }
  else{
    print("error in calling payment intent");
  }
}
