import 'package:flutter/material.dart';
import 'package:tcc/teste_bloc.dart';

import 'app_assets.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key, required this.result}) : super(key: key);

  final PossibleResults result;

  String get getResultString {;
    String resultadoMsg;
    if (result == PossibleResults.semDautonismo) {
      resultadoMsg = "Não foi identificado nenhum tipo de dautonismo no usuario.";
    } else if (result == PossibleResults.invalido) {
      resultadoMsg = "As instruções do teste não foram seguidas corretamente, por favor refaça o teste seguindo as instruções. \n\nClique em recomeçar para ir à tela de instruções.";
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child:
            Center(
              child:Text(
               "Resultados",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                widget.getResultString,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 24,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Center(
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                icon:
                  Image.asset(AppAssets.playIcon, width: 50, height: 50),
                label:
                  const Text(
                    "Voltar",
                    style:
                      TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                 ),
                style:
                  ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0)),
                    side: MaterialStateProperty.all(const BorderSide(
                        color: Colors.black,
                        width: 3.0,
                        style: BorderStyle.solid)),
                  ),
                //style: OutlinedButton.styleFrom(
                  //textStyle: TextStyle(fontSize: 18),
                 // padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                //),
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text("Result"),
      ),
    );
  }
}