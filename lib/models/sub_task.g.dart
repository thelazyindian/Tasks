// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubTask _$_$_SubTaskFromJson(Map<String, dynamic> json) {
  return _$_SubTask(
    id: json['id'] as String,
    name: json['name'] as String?,
    completed: json['completed'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_SubTaskToJson(_$_SubTask instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'completed': instance.completed,
    };
