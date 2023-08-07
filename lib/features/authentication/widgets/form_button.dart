import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class FormButton extends StatelessWidget {
  final bool disabled;
  final String inputText;
  const FormButton(
      {super.key, required this.disabled, required this.inputText});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size5),
          color:
              disabled ? Colors.grey.shade300 : Theme.of(context).primaryColor,
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: TextStyle(
            color: disabled ? Colors.grey.shade400 : Colors.white,
            fontWeight: FontWeight.w600,
          ),
          child: Text(
            inputText,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

// class FormButton extends StatelessElement {
//   final bool disabled;

//   const FormButton({super.key, required this.disabled});

  // }
