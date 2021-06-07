import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
@HiveType(typeId: 1)
class Task with _$Task {
  const factory Task({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) String? details,
    @HiveField(3) DateTime? dateTime,
    @HiveField(4) @Default(false) bool completed,
    @HiveField(5) @Default([]) List<String> subtasks,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
