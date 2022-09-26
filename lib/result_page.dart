import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key, required this.result}) : super(key: key);

  final String result;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(alignment: AlignmentDirectional.center, child: Column(
        children: [
          OutlinedButton(onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          }, child: const Text("Voltar"),),
          Text(widget.result),
        ],
      )),
      appBar: AppBar(
        title: const Text("Result"),
      ),
    );
  }
}
