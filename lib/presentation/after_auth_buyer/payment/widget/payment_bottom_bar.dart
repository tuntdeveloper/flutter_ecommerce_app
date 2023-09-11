import 'package:flutter/material.dart';

class PaymentBottom extends StatelessWidget {
  const PaymentBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.only(),
        height: size.height * 0.07,
        width: size.width * 0.55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: Colors.black),
        child: Align(
          alignment: Alignment.center,
          child: Text.rich(
            TextSpan(
              children: const [
                TextSpan(
                  text: 'Pay Now',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
