import 'package:json_annotation/json_annotation.dart';
import 'package:tcc/ishihara_data.dart';

class TestData {
  final IshiharaData target;
  final List<IshiharaData> options;

  final bool deuteranopia;
  final bool protanopia;
  final bool tricromacia;
  final bool invertedTest;
  final bool everyoneSees;

  TestData({
    required this.target,
    required this.options,
    this.deuteranopia = false,
    this.protanopia = false,
    this.tricromacia = false,
    this.invertedTest = false,
    this.everyoneSees = false,
  });
}
