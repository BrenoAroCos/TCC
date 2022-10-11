import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc/app_assets.dart';
import 'package:tcc/ishihara_data.dart';
import 'package:tcc/result_page.dart';
import 'package:tcc/teste_bloc.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  Color containerSquareColor = Colors.black;

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
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Alvo(
                    onSuccess: () {
                      context.read<TesteBloc>().onSucces();
                      checkForNextPage();
                    },
                    onReject: () {
                      context.read<TesteBloc>().onFailure();
                      checkForNextPage();
                    },
                    ishiharaData: state.testData.target,
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: state.testData.options
                        .map((e) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Option(ishiharaData: e),
                            ))
                        .toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: SizedBox(
                    height: 80,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        context.read<TesteBloc>().onFailure();
                        checkForNextPage();
                      },
                      icon: Image.asset(AppAssets.skipIcon, width: 50, height: 50),
                      label: const Text(
                        "Pular",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ButtonStyle(side: MaterialStateProperty.all(const BorderSide(color: Colors.black, width: 3.0, style: BorderStyle.solid))),
                    ),
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

  void checkForNextPage() {
    if (context.read<TesteBloc>().hasNextTest) {
      context.read<TesteBloc>().nextTest();
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) {
            return ResultPage(result: context.read<TesteBloc>().analyseResults());
          },
        ),
      );
    }
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
    required this.onReject,
    required this.ishiharaData,
    Key? key,
  }) : super(key: key);

  final IshiharaData ishiharaData;
  final Function() onSuccess;
  final Function() onReject;

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
              return resposta is IshiharaData;
            },
            onAccept: (resposta) {
              if (resposta == ishiharaData) {
                onSuccess();
              } else {
                onReject();
              }
            },
          ),
        )
      ],
    );
  }
}
