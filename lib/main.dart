import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterExample(),
    );
  }
}

class CounterExample extends StatefulWidget {
  const CounterExample({super.key});

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  //e.g., 😐, 🙂, 😄, 🤩

  String emoji = "😄";
  String emojiText = "Smiley";
  Color bgColor = Colors.blue;
  bool showLargeText = false;
  BoxShape? boxShape;
  BoxDecoration? decoration;
  int hidden_counter = 0;

  Color getRandomColor() {
    final Random random = Random();

    return Color.fromARGB(
        255, random.nextInt(256), random.nextInt(256), random.nextInt(256));
  }

  BoxDecoration getBoxShape() {
    if (boxShape == BoxShape.circle) {
      decoration = BoxDecoration(color: bgColor, shape: BoxShape.rectangle);
      boxShape = BoxShape.rectangle;
    } else if (boxShape == BoxShape.rectangle) {
      decoration = BoxDecoration(
          color: bgColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(50));
      boxShape = null;
    } else {
      decoration = BoxDecoration(color: bgColor, shape: BoxShape.circle);
      boxShape = BoxShape.circle;
    }

    return decoration!;
  }

  @override
  void initState() {
    boxShape = BoxShape.circle;
    decoration = BoxDecoration(color: bgColor, shape: boxShape!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text("Assignment - 3"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              decoration: decoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    emoji,
                    style: const TextStyle(fontSize: 50),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    emojiText,
                    style: TextStyle(
                        color: Colors.black, fontSize: showLargeText ? 40 : 18),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    hidden_counter++;
                    bgColor = getRandomColor();
                    decoration = getBoxShape();
                    showLargeText = !showLargeText;
                    if (hidden_counter % 2 == 0) {
                      emoji = "😄";
                      emojiText = "Smiley";
                    } else if (hidden_counter % 3 == 0) {
                      emoji = "😐";
                      emojiText = "Annoyes";
                    } else if (hidden_counter % 5 == 0) {
                      emoji = "🤩";
                      emojiText = "Suprise";
                    } else {
                      emoji = "🙂";
                      emojiText = "Normal";
                    }
                  });
                },
                child: const Text("Counter"))
          ],
        ),
      ),
    );
  }
}
