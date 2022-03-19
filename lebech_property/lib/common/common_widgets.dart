import 'package:flutter/material.dart';

class CustomCircularProgressIndicatorModule extends StatelessWidget {
  const CustomCircularProgressIndicatorModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(color: Colors.red));
  }
}

class FormMainHeaderModule extends StatelessWidget {
  final String text;
  const FormMainHeaderModule({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}

class FormSubHeaderModule extends StatelessWidget {
  final String text;
  const FormSubHeaderModule({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 16, color: Colors.white),
    );
  }
}