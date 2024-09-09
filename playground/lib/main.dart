import 'package:block_text_editor/block_text_editor.dart';
import 'package:block_text_editor/selection_toolbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final controller = RichTextEditingController(text: 'Hello how are you?');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 64),
                height: constraints.maxHeight,
                width: constraints.maxWidth / 1.5,
                child: RichTextField(
                  controller: controller,
                  // contextMenuBuilder: (context, editableTextState) {
                  //   return const Text('TOOLBAR');
                  // },
                  selectionControls: SelectionToolbar(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
