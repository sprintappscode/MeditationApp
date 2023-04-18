import 'package:flutter/material.dart';

class RateUs extends StatefulWidget {
  const RateUs({super.key});

  @override
  State<RateUs> createState() => _RateUsState();
}

class _RateUsState extends State<RateUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const Text('About us'),
      ),
    );
  }
}
