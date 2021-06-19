import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:tasks/models/sub_task.dart';
import 'package:tasks/utils/time_of_day_converter.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
@HiveType(typeId: 1)
class Task with _$Task {
  @JsonSerializable(explicitToJson: true)
  const factory Task({
    @HiveField(0) required int id,
    @HiveField(1) required String name,
    @HiveField(2) required int order,
    @HiveField(3) String? details,
    @HiveField(4) DateTime? dateTime,
    @HiveField(5) @TimeOfDayConverter() TimeOfDay? timeOfDay,
    @HiveField(6) @Default(false) bool completed,
    @HiveField(7) @Default([]) List<SubTask> subtasks,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
