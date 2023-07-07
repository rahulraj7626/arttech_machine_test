import 'package:flutter/material.dart';

import '../../../constants/enums.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool isPassword;
  final String errorMsg;
  final InputType type;

  const TextFormFieldWidget(
      {super.key,
      required this.controller,
      required this.hint,
      required this.isPassword,
      required this.errorMsg,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: hint,
        ),
        onSaved: (String? value) {
          // This optional block of code can be used to run
          // code when the user saves the form.
        },
        validator: (value) {
          if (value!.isEmpty) {
            return errorMsg;
          } else if (type == InputType.email &&
              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value)) {
            return "Invalid email format";
          } else if (type == InputType.password &&
              !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                  .hasMatch(value)) {
            return "Password should contain numbers, characters,special chars";
          } else {
            return null;
          }
        },
      ),
    );
  }
}
