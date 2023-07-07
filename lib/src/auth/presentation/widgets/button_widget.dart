import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonName;
  final Function()? onTap;
  final bool isLoading;
  const ButtonWidget(
      {super.key,
      required this.buttonName,
      this.onTap,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: onTap, child: Text(buttonName)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Visibility(
              visible: isLoading, child: const CircularProgressIndicator()),
        )
      ],
    );
  }
}
