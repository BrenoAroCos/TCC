import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc/result_data.dart';
import 'package:tcc/test_cases.dart';
import 'package:tcc/test_data.dart';

abstract class TesteState {}

enum PossibleResults {
  invalido,
  semDautonismo,
  protanopia,
  deuteranopia,
  anomalia,
  tipoNaoIdentificado,
}

class TesteLoadingState extends TesteState {}

class TesteLoadedState extends TesteState {
  final TestData testData;

  TesteLoadedState(this.testData);
}

class TesteBloc extends Cubit<TesteState> {
  TesteBloc() : super(TesteLoadingState()) {
    testIndex = 0;
    _generateTest(testCases[testIndex]);
  }

  int testIndex = 0;

  ResultData resultData = ResultData();

  bool get hasNextTest => testIndex < testCases.length - 1;

  void onFailure() {
    final testCase = testCases[testIndex];
    if (testCase.protanopia || testCase.deuteranopia) resultData.nPlacasDaltonismoErradas++;
    if (testCase.everyoneSees) resultData.everyoneSees++;
    if (testCase.deuteranopia) resultData.deuteranopia++;
    if (testCase.protanopia) resultData.protanopia++;
    if (testCase.tricromacia) resultData.tricromacia++;
  }

  void onSucces() {
    final testCase = testCases[testIndex];
    if (testCase.invertedTest) {
      resultData.protanopia++;
      resultData.deuteranopia++;
    }
  }

  bool isAnomalia(int protanopia, int deuteranopia, int anomalia) {
    int pAnomalia = protanopia - anomalia;
    int dAnomalia = deuteranopia - anomalia;
    if (pAnomalia > 2 || dAnomalia > 2) {
      //Esta verificação parte do pressuposto que a probabilidade da criança errar apenas 1 placa de anomalia, enquanto erra 3 ou mais placas que verificam ambos os tipos de dautonismo é extremamente baixa, dessa forma, não é relevante verificar quantas placas de anomalias que foram verificadas.
      return false;
    } else {
      return true;
    }
  }

  PossibleResults analyseResults() {
    PossibleResults result;
    if (resultData.everyoneSees >= 2) {
      //Se o usuário errou 2 ou mais placas onde todos vêem, resultado é desconsiderado.
      result = PossibleResults.invalido;
    } else {
      if (resultData.nPlacasDaltonismoErradas <= 3) {
        if (resultData.tricromacia == 3) {
          //se o usuário errar 3 ou menos placas que verificam dautonismo, e todas foram placas que verificam anomalia, trata-se que o usuário possue anomalia, caso contrário, o usuário não possui dautonismo.
          result = PossibleResults.anomalia;
        } else {
          result = PossibleResults.semDautonismo;
        }
      } else {
        if (isAnomalia(resultData.protanopia, resultData.deuteranopia, resultData.tricromacia)) {
          // verifica se o resultado é indicativo de tricromacia anômala
          result = PossibleResults.anomalia;
        } else {
          if (resultData.protanopia > resultData.deuteranopia) {
            //se errar mais placas de protanopia do que deuteranopia, considera o tipo como protanopia.
            result = PossibleResults.protanopia;
          } else {
            if (resultData.deuteranopia > resultData.protanopia) {
              //se errar mais placas de deuteranopia do que protanopia, considera o tipo como deuteranopia.
              result = PossibleResults.deuteranopia;
            } else {
              //caso nenhum dos resultados acima tenha sido alcançado, considera que o usuário tem dautonismo, mas não foi possível identificar o tipo.
              result = PossibleResults.tipoNaoIdentificado;
            }
          }
        }
      }
    }
    return result;
  }

  String get getResultString {
    PossibleResults result = analyseResults();
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

  void nextTest() {
    testIndex++;
    _generateTest(testCases[testIndex]);
  }

  void _generateTest(TestData testData) {
    assert(testData.options.contains(testData.target));
    emit(TesteLoadedState(testData));
  }
}
