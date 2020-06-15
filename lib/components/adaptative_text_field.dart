import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final Function(String) onSubmitted;
  final String label;

  AdaptativeTextField(
      {@required this.controller,
      @required this.onSubmitted,
      @required this.label,
      this.textInputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CupertinoTextField(
              keyboardType: textInputType,
              controller: controller,
              onSubmitted: onSubmitted,
              placeholder: label,
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
        )
        : TextField(
            keyboardType: textInputType,
            controller: controller,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(labelText: label),
          );
  }
}
