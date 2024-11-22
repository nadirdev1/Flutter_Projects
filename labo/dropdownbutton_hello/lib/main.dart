import 'package:flutter/material.dart';

enum DropItems {
  zero,
  un,
  deux,
  trois,
  quatre,
  cinq,
}

DropItems? _selectedElement;
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Drop Down Button'),
        ),
        body: DropDownListTest(),
      ),
    ),
  );
}

class DropDownListTest extends StatefulWidget {
  const DropDownListTest({super.key});

  @override
  State<DropDownListTest> createState() => _DropDownListTestState();
}

class _DropDownListTestState extends State<DropDownListTest> {
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton(
            value: _selectedElement ?? DropItems.cinq,
            items: DropItems.values
                .map((element) => DropdownMenuItem(
                    value: element, child: Text(element.name.toUpperCase())))
                .toList(),
            onChanged: (value) {
             setState(() {
                _selectedElement = value ?? DropItems.zero;
             });
            },
          ),
        );
  }
}
