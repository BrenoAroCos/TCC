import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ResultData{
  int deuteranopia = 0;
  int protanopia = 0;
  int tricromacia = 0;
  int everyoneSees = 0;
  int nPlacasDaltonismoErradas = 0; //placas que todos vêem não são consideradas
}