import 'package:flutter_bloc/flutter_bloc.dart';
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

  bool get hasNextTest => testIndex < testCases.length - 1;

  void nextTest() {
    testIndex++;
    _generateTest(testCases[testIndex]);
  }

  void _generateTest(TestData testData) {
    assert(testData.options.contains(testData.target));
    emit(TesteLoadedState(testData));
  }
}
