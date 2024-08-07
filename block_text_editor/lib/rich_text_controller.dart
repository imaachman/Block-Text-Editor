import 'package:flutter/material.dart';

class RichTextController extends TextEditingController {
  @override
  TextSpan buildTextSpan(
      {required BuildContext context,
      TextStyle? style,
      required bool withComposing}) {
    return TextSpan(style: style?.copyWith(color: Colors.blue), text: text);
  }
}
