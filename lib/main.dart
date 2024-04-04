import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RiveSample(),
    );
  }
}

class RiveSample extends StatefulWidget {
  const RiveSample({super.key});

  @override
  State<RiveSample> createState() => _RiveSampleState();
}

class _RiveSampleState extends State<RiveSample> {
  SMIInput<bool>? _isOn;
  SMIInput<double>? _number;

  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(
      artboard,
      'State Machine 1',
    );
    artboard.addController(controller!);

    _isOn = controller.findInput<bool>('isOn') as SMIBool;
    _number = controller.findInput<double>('number') as SMINumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: RiveAnimation.asset(
                'assets/rive/sample123.riv',
                onInit: _onRiveInit,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _isOn?.value = !_isOn!.value;
              },
              child: const Text('on/off'),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _number?.value = 1;
                    },
                    child: const Text('1'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _number?.value = 2;
                    },
                    child: const Text('2'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _number?.value = 3;
                    },
                    child: const Text('3'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
