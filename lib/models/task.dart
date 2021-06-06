import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required String name,
    String? details,
    DateTime? dateTime,
    @Default(false) bool completed,
    @Default([]) List<String> subtasks,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
