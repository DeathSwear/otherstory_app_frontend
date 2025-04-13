import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otherstory_app/theme/app_text_styles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPincode extends StatefulWidget {
  final TextEditingController textEditingController;
  const CustomPincode({super.key, required this.textEditingController});

  @override
  State<CustomPincode> createState() => _CustomPincodeState();
}

class _CustomPincodeState extends State<CustomPincode> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: PinCodeTextField(
        appContext: context,
        length: 6,
        cursorHeight: 40,
        enableActiveFill: true,
        textStyle: AppTextStyles.authPincode,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        pinTheme: PinTheme(
            fieldHeight: 60,
            fieldWidth: 42,
            activeColor: Color.fromRGBO(60, 60, 67, 0.6),
            selectedColor: Color.fromRGBO(60, 60, 67, 0.6),
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(13),
            inactiveColor: Color.fromRGBO(60, 60, 67, 0.6),
            selectedFillColor: Colors.white,
            activeFillColor: Colors.white,
            inactiveFillColor: Colors.white,
            disabledColor: Color.fromRGBO(60, 60, 67, 0.6),
            inactiveBorderWidth: 1,
            activeBorderWidth: 1,
            disabledBorderWidth: 1),
        onCompleted: (value) => widget.textEditingController.text = value,
        onChanged: (value) => widget.textEditingController.text = value,
        onSaved: (value) => widget.textEditingController.text = value ?? '',
        onSubmitted: (value) => widget.textEditingController.text = value,
        keyboardType: TextInputType.number,
      ),
    );
  }
}
