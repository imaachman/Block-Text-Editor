import 'package:flutter/material.dart';

class RichTextEditingController extends TextEditingController {
  RichTextEditingController({super.text});

  RichTextEditingController.fromValue(super.value)
      : assert(
          value == null ||
              !value.composing.isValid ||
              value.isComposingRangeValid,
          'New TextEditingValue $value has an invalid non-empty composing range '
          '${value.composing}. It is recommended to use a valid composing range, '
          'even for readonly text fields.',
        ),
        super.fromValue();

  @override
  TextSpan buildTextSpan(
      {required BuildContext context,
      TextStyle? style,
      required bool withComposing}) {
    return TextSpan(
      style: Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(fontWeight: FontWeight.w600),
      text: text,
    );
  }
}

/// A [RestorableProperty] that knows how to store and restore a
/// [RichTextEditingController].
///
/// The [RichTextEditingController] is accessible via the [value] getter. During
/// state restoration, the property will restore
/// [RichTextEditingController.text] to the value it had when the restoration
/// data it is getting restored from was collected.
class RestorableRichTextEditingController
    extends RestorableChangeNotifier<RichTextEditingController> {
  /// Creates a [RestorableTextEditingController].
  ///
  /// This constructor treats a null `text` argument as if it were the empty
  /// string.
  factory RestorableRichTextEditingController({String? text}) =>
      RestorableRichTextEditingController.fromValue(
        text == null ? TextEditingValue.empty : TextEditingValue(text: text),
      );

  /// Creates a [RestorableTextEditingController] from an initial
  /// [TextEditingValue].
  ///
  /// This constructor treats a null `value` argument as if it were
  /// [TextEditingValue.empty].
  RestorableRichTextEditingController.fromValue(TextEditingValue value)
      : _initialValue = value;

  final TextEditingValue _initialValue;

  @override
  RichTextEditingController createDefaultValue() {
    return RichTextEditingController.fromValue(_initialValue);
  }

  @override
  RichTextEditingController fromPrimitives(Object? data) {
    return RichTextEditingController(text: data! as String);
  }

  @override
  Object toPrimitives() {
    return value.text;
  }
}
