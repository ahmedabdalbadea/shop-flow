import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/core/utils/form_validators.dart';
import 'package:shop_flow/core/widget/onboarding_card.dart';
import 'package:shop_flow/core/widget/user_input.dart';

class ShippingAddressForm extends StatefulWidget {
  const ShippingAddressForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required AutovalidateMode autovalidateMode,
  }) : _autovalidateMode = autovalidateMode,
       _formKey = formKey;
  final GlobalKey<FormState> _formKey;
  final AutovalidateMode _autovalidateMode;
  @override
  State<ShippingAddressForm> createState() => _ShippingAddressFormState();
}

class _ShippingAddressFormState extends State<ShippingAddressForm> {
  String? _name, _phone, _address, _city, _state;
  @override
  Widget build(BuildContext context) {
    return OnboardingCard(
      child: Form(
        key: widget._formKey,
        autovalidateMode: widget._autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Full Name", style: AppFontStyles.styleSemiBold14),
            const SizedBox(height: 8),
            UserInput(
              hint: "John Doe",
              validator: FormValidators.requiredFieldValidator,
              onChanged: (value) {
                _name = value;
              },
            ),
            const SizedBox(height: 16),

            Text("Phone Number", style: AppFontStyles.styleSemiBold14),
            const SizedBox(height: 8),
            UserInput(
              hint: "+1 (555) 000-0000",
              validator: FormValidators.validateInternationalPhone,
              onChanged: (value) {
                _phone = value;
              },
            ),
            const SizedBox(height: 16),
            Text("Street Address", style: AppFontStyles.styleSemiBold14),
            const SizedBox(height: 8),
            UserInput(
              hint: "123 Minimalism Avenue",
              validator: FormValidators.requiredFieldValidator,
              onChanged: (value) {
                _address = value;
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("City", style: AppFontStyles.styleSemiBold14),
                      const SizedBox(height: 8),
                      UserInput(
                        hint: "New York",
                        validator: FormValidators.validateCity,
                        onChanged: (value) {
                          _city = value;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("State", style: AppFontStyles.styleSemiBold14),
                      const SizedBox(height: 8),
                      UserInput(
                        hint: "NY",
                        validator: FormValidators.validateState,
                        onChanged: (value) {
                          _state = value;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
