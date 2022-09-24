import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc/ishihara_data.dart';
import 'package:tcc/teste_bloc.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int _counter = 0;
  Color containerSquareColor = Colors.black;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TesteBloc, TesteState>(builder: (context, state) {
      if (state is TesteLoadingState) {
        return Container();
      } else if (state is TesteLoadedState) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Alvo(
                  onSuccess: _incrementCounter,
                  ishiharaData: state.target,
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: state.options
                        .map((e) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Option(ishiharaData: e),
                            ))
                        .toList(),
                  ),
                )
              ],
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      }
      return Container();
    });
  }
}

class Option extends StatelessWidget {
  const Option({
    required this.ishiharaData,
    Key? key,
  }) : super(key: key);

  final IshiharaData ishiharaData;

  @override
  Widget build(BuildContext context) {
    return Draggable<IshiharaData>(
      data: ishiharaData,
      feedback: _OptionImage(
        ishiharaData: ishiharaData,
        alpha: 0.5,
      ),
      childWhenDragging: _OptionImage(
        ishiharaData: ishiharaData,
        alpha: 1.0,
      ),
      child: _OptionImage(
        ishiharaData: ishiharaData,
        alpha: 1.0,
      ),
    );
  }
}

class _OptionImage extends StatelessWidget {
  const _OptionImage({
    Key? key,
    required this.ishiharaData,
    required this.alpha,
  }) : super(key: key);

  final IshiharaData ishiharaData;
  final double alpha;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Image.asset(
        ishiharaData.pictureAsset,
        fit: BoxFit.fill,
        opacity: AlwaysStoppedAnimation(alpha),
      ),
    );
  }
}

class Alvo extends StatelessWidget {
  const Alvo({
    required this.onSuccess,
    required this.ishiharaData,
    Key? key,
  }) : super(key: key);

  final IshiharaData ishiharaData;
  final Function() onSuccess;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        SizedBox(width: 300, height: 300, child: Image.asset(ishiharaData.ishiharaAsset!, width: 300, height: 300)),
        Container(
          width: 200,
          height: 200,
          color: Colors.transparent,
          child: DragTarget<IshiharaData>(
            builder: (
              BuildContext context,
              List accepted,
              List rejected,
            ) {
              return Container();
            },
            onWillAccept: (resposta) {
              return resposta == ishiharaData;
            },
            onAccept: (color) {
              onSuccess();
              context.read<TesteBloc>().generateTest(); //criar um método para gerenciar a criação das telas.
            },
          ),
        )
      ],
    );
  }
}
