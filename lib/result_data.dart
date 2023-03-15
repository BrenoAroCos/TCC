import 'package:json_annotation/json_annotation.dart';

part 'result_data.g.dart';

@JsonSerializable()
class ResultData {
  int deuteranopia = 0;
  int protanopia = 0;
  int tricromacia = 0;
  int everyoneSees = 0;
  int nPlacasDaltonismoErradas = 0; //placs que todos vêem não é considerada
  // List<AnswerData> answers = [];

    /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ResultDataToJson(this);
}

// @JsonSerializable()
// class AnswerData {
//   late int questionId;
//   late int answerId;
//   late bool correct;
// }