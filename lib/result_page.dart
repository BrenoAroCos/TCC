import 'package:flutter/material.dart';
import 'package:tcc/teste_bloc.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key, required this.result}) : super(key: key);

  final PossibleResults result;

  String get getResultString {;
    String resultadoMsg;
    if (result == PossibleResults.semDautonismo) {
      resultadoMsg = "Não foi identificado nenhum tipo de dautonismo no usuario.";
    } else if (result == PossibleResults.invalido) {
      resultadoMsg = "As instruções do teste não foram seguidas corretamente, por favor, refaça o teste seguindo as instruções apresentadas no início do teste.";
    } else if (result == PossibleResults.tipoNaoIdentificado) {
      resultadoMsg =
      "É possível que você possua algum tipo de dautonismo, porém não foi possível identificar qual exatamente.\nÉ recomendada a consulta com um especialista para obter um diagnóstico oficial.";
    } else {
      String tipoDautonismoMsg = "";
      if (result == PossibleResults.protanopia) tipoDautonismoMsg = "Protanopia.";
      if (result == PossibleResults.deuteranopia) tipoDautonismoMsg = "Deuteranopia.";
      if (result == PossibleResults.anomalia) tipoDautonismoMsg = "Tricromacia Anômala (dautonismo leve).";
      resultadoMsg = "Foi identificado o seguinte tipo de dautonismo:" "\n\n$tipoDautonismoMsg\n\n" "É recomendada a consulta com um especialista para obter um diagnóstico oficial.";
    }
    return resultadoMsg;
  }

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
          Text(widget.getResultString),
        ],
      )),
      appBar: AppBar(
        title: const Text("Result"),
      ),
    );
  }
}
