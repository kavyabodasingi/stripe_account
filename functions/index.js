/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");
const functions = require('firebase-functions');
const stripe = require('stripe')('sk_test_51PL4G3SIpYEYlCLIULDKZXJkg0ojofG3DDus2VyRBubKK9YwAoo7UTpeAJv6JB95QhZdflG271qRylITk6RUQ6tO00lU4luKzM');  // Replace with your actual secret key

exports.payment = functions.https.onRequest(async (req, res) => {
  const { paymentMethodId, currency, amount } = req.body;

  try {
    const paymentIntent = await stripe.paymentIntents.create({
      amount,
      currency,
      payment_method: paymentMethodId,
      confirmation_method: 'manual',
      confirm: true,
    });

    res.status(200).send({
      clientSecret: paymentIntent.client_secret,
      status: paymentIntent.status,
    });
  } catch (error) {
    res.status(400).send({ error: error.message });
  }
});


// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
