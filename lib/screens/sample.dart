import 'package:flutter/material.dart';


class TapCounterScreen extends StatefulWidget {
  @override
  _TapCounterScreenState createState() => _TapCounterScreenState();
}

class _TapCounterScreenState extends State<TapCounterScreen> {
  int _tapCount = 0;

  void _incrementTapCount() {
    setState(() {
      _tapCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _incrementTapCount,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text(
            '$_tapCount',
            style: TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
