import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
    return Stack(
      children: [
        Positioned(
          left: endpoints.first.point.dx,
          top: endpoints.first.point.dy - textLineHeight,
          width: globalEditableRegion.width,
          // height: globalEditableRegion.height,
          child: const Text('TOOLBAR'),
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
