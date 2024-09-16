import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const Offset kSelectionToolbarOffset = Offset(56, 56);

class SelectionToolbar extends TextSelectionControls {
  @override
  Widget buildHandle(BuildContext context, TextSelectionHandleType type,
          double textLineHeight,
          [VoidCallback? onTap]) =>
      const SizedBox.shrink();

  @override
  Widget buildToolbar(
      BuildContext context,
      Rect globalEditableRegion,
      double textLineHeight,
      Offset selectionMidpoint,
      List<TextSelectionPoint> endpoints,
      TextSelectionDelegate delegate,
      ValueListenable<ClipboardStatus>? clipboardStatus,
      Offset? lastSecondaryTapDownPosition) {
    // [globalEditableRegion] gives us the exact global coordinates of the text
    // field. [endpoints] are the left and right points of the selection region.
    // [kSelectionToolbarOffset] is the constant offset to keep the toolbar
    // visible right above the text, and a bit towards the left.
    // [textLineHeight] is the line height of the text.
    final double left = globalEditableRegion.left +
        endpoints.first.point.dx -
        kSelectionToolbarOffset.dx;
    final double top = globalEditableRegion.top +
        endpoints.first.point.dy -
        textLineHeight -
        kSelectionToolbarOffset.dy;
    return Stack(
      children: [
        Positioned(
          left: left,
          top: top,
          child: const SelectionToolbarWidget(),
        ),
      ],
    );
  }

  @override
  Offset getHandleAnchor(TextSelectionHandleType type, double textLineHeight) {
    // Copied Material implementation.
    const double kHandleSize = 22.0;
    return switch (type) {
      TextSelectionHandleType.collapsed => const Offset(kHandleSize / 2, -4),
      TextSelectionHandleType.left => const Offset(kHandleSize, 0),
      TextSelectionHandleType.right => Offset.zero,
    };
  }

  @override
  Size getHandleSize(double textLineHeight) {
    // Copied Material implementation.
    const double kHandleSize = 22.0;
    return const Size(kHandleSize, kHandleSize);
  }
}

class SelectionToolbarWidget extends StatelessWidget {
  const SelectionToolbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.format_bold),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.format_italic),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.format_underline),
          ),
        ],
      ),
    );
  }
}
