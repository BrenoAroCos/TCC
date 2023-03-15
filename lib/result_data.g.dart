// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultData _$ResultDataFromJson(Map<String, dynamic> json) => ResultData()
  ..deuteranopia = json['deuteranopia'] as int
  ..protanopia = json['protanopia'] as int
  ..tricromacia = json['tricromacia'] as int
  ..everyoneSees = json['everyoneSees'] as int
  ..nPlacasDaltonismoErradas = json['nPlacasDaltonismoErradas'] as int;

Map<String, dynamic> _$ResultDataToJson(ResultData instance) =>
    <String, dynamic>{
      'deuteranopia': instance.deuteranopia,
      'protanopia': instance.protanopia,
      'tricromacia': instance.tricromacia,
      'everyoneSees': instance.everyoneSees,
      'nPlacasDaltonismoErradas': instance.nPlacasDaltonismoErradas,
    };
