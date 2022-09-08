import 'package:flutter/material.dart';

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
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(width: 100, height: 100, color: containerSquareColor),
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent,
                  child: DragTarget<Color>(
                    builder: (
                      BuildContext context,
                      List accepted,
                      List rejected,
                    ) {
                      return Container();
                    },
                    onWillAccept: (color) {
                      return color == Colors.red;
                    },
                    onAccept: (color) {
                      setState(
                        () {
                          containerSquareColor = color;
                        },
                      );
                    },
                  ),
                )
              ],
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Draggable<Color>(
              data: Colors.red,
              child: Bloco(),
              feedback:
                  Container(width: 100, height: 100, color: Colors.redAccent),
              childWhenDragging: Container(),
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
