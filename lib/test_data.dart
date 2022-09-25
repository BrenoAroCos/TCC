import 'package:tcc/ishihara_data.dart';

class TestData {
  final IshiharaData target;
  final List<IshiharaData> options;

  final bool deuteranopia;
  final bool protanopia;
  final bool tricromasia;
  final bool invertedTest;

  TestData({
    required this.target,
    required this.options,
    this.deuteranopia = false,
    this.protanopia = false,
    this.tricromasia = false,
    this.invertedTest = false,
  });
}
