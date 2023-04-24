import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _sliderValue = 1;
  String _pattern = '1';

  void _generatePattern(double value) {
    String pattern = '';
    for (int i = 1; i <= value; i++) {
      for (int j = 1; j <= i; j++) {
        _pattern = _pattern + '$j';
      }
      _pattern = _pattern + '\n';
    }
    setState(() {
      _pattern = pattern;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Slider Pattern"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Slider Pattern',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Slider(
              activeColor: Colors.blueGrey,
              inactiveColor: Colors.black12,
              value: _sliderValue,
              min: 1,
              max: 10,
              divisions: 9,
              label: _sliderValue.round().toString(),
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
              onChangeEnd: _generatePattern,
            ),
            const SizedBox(height: 18),
            Text(
              _pattern,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
