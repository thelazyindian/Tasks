// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$_$_TaskFromJson(Map<String, dynamic> json) {
  return _$_Task(
    id: json['id'] as String,
    name: json['name'] as String,
    details: json['details'] as String?,
    dateTime: json['dateTime'] == null
        ? null
        : DateTime.parse(json['dateTime'] as String),
    completed: json['completed'] as bool? ?? false,
    subtasks: (json['subtasks'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'details': instance.details,
      'dateTime': instance.dateTime?.toIso8601String(),
      'completed': instance.completed,
      'subtasks': instance.subtasks,
    };
