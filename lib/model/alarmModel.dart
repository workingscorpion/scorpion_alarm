import 'package:json_annotation/json_annotation.dart';

part 'alarmModel.g.dart';

@JsonSerializable()
class AlarmModel {
  DateTime alarmTime; //알람 시간
  int alarmDate; //요일
  bool vibrate; //진동여부
  bool sound; //소리 여부
  int loudness; //소리 크기
  int bellIndex; //벨 종류
  int colorIndex; //색깔 종류
  String alarmMemo; //메모
  bool isWork;
  // int missionSecond;

  AlarmModel(
      {this.alarmTime,
      this.alarmDate,
      this.vibrate,
      this.sound,
      this.loudness,
      this.bellIndex,
      this.colorIndex,
      this.alarmMemo,
      this.isWork});

  factory AlarmModel.fromJson(Map<String, dynamic> json) =>
      _$AlarmModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlarmModelToJson(this);
}
