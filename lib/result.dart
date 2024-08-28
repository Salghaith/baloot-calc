import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(this.result, {super.key});
  final List<int> result;
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (context, index) {
        return Text(
          "data",
        );
      },
    );
  }
}
