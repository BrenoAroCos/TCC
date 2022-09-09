import 'package:flutter/material.dart';
import 'package:tcc/app_images.dart';

import 'answers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Color containerSquareColor = Colors.black;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Alvo(onSuccess: _incrementCounter,),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              children: [
                Option(assetString: AppImages.circulo, resposta: Resposta.circulo,),
                Option(assetString: AppImages.quadrado, resposta: Resposta.quadrado,),
                Option(assetString: AppImages.passaro, resposta: Resposta.passaro,),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Option extends StatelessWidget {
  const Option({
    required this.assetString,
    required this.resposta,
    Key? key,
  }) : super(key: key);

  final String assetString;
  final Resposta resposta;

  @override
  Widget build(BuildContext context) {
    return Draggable<Resposta>(
      data: resposta,
      child: Container(width:50, height: 50, child: Image.asset(assetString)),
      feedback:
      Container(width: 100, height: 100, color: Colors.redAccent),
      childWhenDragging: Container(),
    );
  }
}

class Alvo extends StatelessWidget {

  Alvo({
    required this.onSuccess,
    Key? key,
  }) : super(key: key);

  final Function() onSuccess;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(width: 300, height: 300, child: Image.asset(AppImages.ishiharaPlate)),
        Container(
          width: 200,
          height: 200,
          color: Colors.transparent,
          child: DragTarget<Resposta>(
            builder: (
              BuildContext context,
              List accepted,
              List rejected,
            ) {
              return Container();
            },
            onWillAccept: (resposta) {
              return resposta == Resposta.passaro;
            },
            onAccept: (color) {
              onSuccess();
            },
          ),
        )
      ],
    );
  }
}

class Bloco extends StatelessWidget {
   Bloco({
    Key? key,
    required this.color,
  }) : super(key: key);

  Color color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(width: 100, height: 100, color: color);
  }
}
