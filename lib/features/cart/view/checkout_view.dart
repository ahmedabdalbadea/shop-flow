import 'package:flutter/material.dart';
import 'package:shop_flow/features/cart/view/widget/checkout_view_body.dart';
import 'package:shop_flow/features/cart/view/widget/pay_now_button.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: CheckoutViewBody(
          formKey: _formKey,
          autovalidateMode: _autovalidateMode,
        ),
      ),
      bottomNavigationBar: PayNowButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
          } else {
            setState(() {
              _autovalidateMode = AutovalidateMode.always;
            });
          }
        },
      ),
    );
  }
}
