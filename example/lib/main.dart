import 'package:flutter/material.dart';

void main() {
  runApp(const _SeongnamApp());
}

class _SeongnamApp extends StatefulWidget {
  const _SeongnamApp();

  @override
  State<_SeongnamApp> createState() => _SeongnamAppState();
}

class _SeongnamAppState extends State<_SeongnamApp> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Seongnam(
      child: _buildButton(
        const Text("Seongnam is expensive at all"),
      ),
      onTap: _increaseCount,
    );
  }

  Widget _buildButton(Widget text) => Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.black,
          ),
          child: text,
        ),
      );

  void _increaseCount() {
    setState(() {
      count++;
    });
  }
}
