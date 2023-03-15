import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tcc/result_data.dart';
import 'package:tcc/teste_bloc.dart';
import 'package:cross_file/cross_file.dart';

import 'app_assets.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key, required this.result, required this.resultData})
      : super(key: key);

  final PossibleResults result;
  final ResultData resultData;

  String get getResultString {
    ;
    String resultadoMsg;
    if (result == PossibleResults.semDautonismo) {
      resultadoMsg =
          "Não foi identificado nenhum tipo de daltonismo no usuario.";
    } else if (result == PossibleResults.invalido) {
      resultadoMsg =
          "As instruções do teste não foram seguidas corretamente, por favor refaça o teste seguindo as instruções. \n\nClique em recomeçar para ir à tela de instruções.";
    } else if (result == PossibleResults.tipoNaoIdentificado) {
      resultadoMsg =
          "É possível que você possua algum tipo de daltonismo, porém não foi possível identificar qual exatamente.\nÉ recomendada a consulta com um especialista para obter um diagnóstico oficial.";
    } else {
      String tipoDautonismoMsg = "";
      if (result == PossibleResults.protanopia)
        tipoDautonismoMsg = "Protanopia.";
      if (result == PossibleResults.deuteranopia)
        tipoDautonismoMsg = "Deuteranopia.";
      if (result == PossibleResults.anomalia)
        tipoDautonismoMsg = "Tricromacia Anômala (daltonismo leve).";
      resultadoMsg = "Foi identificado o seguinte tipo de daltonismo:"
          "\n\n$tipoDautonismoMsg\n\n"
          "É recomendada a consulta com um especialista para obter um diagnóstico oficial.";
    }
    return resultadoMsg;
  }

  Future<void> shareData(ResultData data) async {
    final tempDir = await getTemporaryDirectory();
    final tempPath = '${tempDir.path}/data.json';
    final file = await File(tempPath).create();
    await file.writeAsString(data.toJson().toString());
    Share.shareXFiles([XFile(tempPath)], text: "Resultado");
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
          Expanded(
            child: Center(
              child: Text(
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
                  widget.shareData(widget.resultData);
                },
                icon: Image.asset(AppAssets.aviao, width: 50, height: 50),
                label: const Text(
                  "Mandar resultados",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0)),
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
          Expanded(
            child: Center(
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                icon: Image.asset(AppAssets.playIcon, width: 50, height: 50),
                label: const Text(
                  "Voltar",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0)),
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
