import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc/result_data.dart';
import 'package:tcc/test_cases.dart';
import 'package:tcc/test_data.dart';

abstract class TesteState {}

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

  void onFailure(){
    final testCase = testCases[testIndex];
    if (testCase.everyoneSees) resultData.everyoneSees++;
    if (testCase.deuteranopia) resultData.deuteranopia++;
    if (testCase.protanopia) resultData.protanopia++;
    if (testCase.tricromacia) resultData.tricromacia++;
  }

  void onSucces(){
    final testCase = testCases[testIndex];
    if (testCase.invertedTest){
       resultData.protanopia++;
       resultData.deuteranopia++;
    }
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
