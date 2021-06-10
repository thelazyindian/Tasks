import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'sub_task.freezed.dart';
part 'sub_task.g.dart';

@freezed
@HiveType(typeId: 2)
class SubTask with _$SubTask {
  const factory SubTask({
    @HiveField(0) required String id,
    @HiveField(1) String? name,
    @HiveField(2) @Default(false) bool completed,
  }) = _SubTask;

  factory SubTask.fromJson(Map<String, dynamic> json) =>
      _$SubTaskFromJson(json);
}
