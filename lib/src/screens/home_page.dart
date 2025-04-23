import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final VoidCallback increment;
  final VoidCallback decrement;
  final int counter;

  const HomePage({
    super.key,
    required this.increment,
    required this.decrement,
    required this.counter,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: widget.increment,
            child: const Text('Increment'),
          ),
          Text('${widget.counter}', style: const TextStyle(fontSize: 48)),
          ElevatedButton(
            onPressed: widget.decrement,
            child: const Text('Decrement'),
          ),
        ],
      ),
    );
  }
}
