import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/presentation/after_auth_buyer/payment/widget/payment_body.dart';
import 'package:flutter_ecommerce_app/presentation/after_auth_buyer/payment/widget/payment_bottom_bar.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: const [
            PaymentBody(),
            PaymentBottom(),
          ],
        ),
      )),
    );
  }
}
