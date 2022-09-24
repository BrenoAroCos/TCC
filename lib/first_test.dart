import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc/ishihara_data.dart';
import 'package:tcc/teste_bloc.dart';

import 'App_images.dart';
import 'answers.dart';

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
    return BlocBuilder<TesteBloc, TesteState>(builder: (context, state){
      if(state is TesteLoadingState){
        return Container();
      }else if (state is TesteLoadedState){
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Alvo(onSuccess: _incrementCounter, ishiharaData: state.target,),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Row(
                  children: state.options.map((e) => Option(ishiharaData: e)).toList(),
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
   Option({
    required this.ishiharaData,
    Key? key,
  }) : super(key: key);

 IshiharaData ishiharaData;

  @override
  Widget build(BuildContext context) {
    return Draggable<IshiharaData>(
      data: ishiharaData,
      child: Container(width:50, height: 50, child: Image.asset(ishiharaData.pictureAsset, width:50, height:50)),
      feedback:
      Container(width: 100, height: 100, color: Colors.redAccent),
      childWhenDragging: Container(),
    );
  }
}

class Alvo extends StatelessWidget {

  Alvo({
    required this.onSuccess,
    required this.ishiharaData,
    Key? key,
  }) : super(key: key);

  IshiharaData ishiharaData;
  final Function() onSuccess;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(width: 300, height: 300, child: Image.asset(ishiharaData.ishiharaAsset!, width:300, height:300)),
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