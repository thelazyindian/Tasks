// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 1;

  @override
  Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task(
      id: fields[0] as int,
      name: fields[1] as String,
      order: fields[2] as int,
      details: fields[3] as String?,
      dateTime: fields[4] as DateTime?,
      timeOfDay: fields[5] as TimeOfDay?,
      completed: fields[6] as bool,
      subtasks: (fields[7] as List).cast<SubTask>(),
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.order)
      ..writeByte(3)
      ..write(obj.details)
      ..writeByte(4)
      ..write(obj.dateTime)
      ..writeByte(5)
      ..write(obj.timeOfDay)
      ..writeByte(6)
      ..write(obj.completed)
      ..writeByte(7)
      ..write(obj.subtasks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$_$_TaskFromJson(Map<String, dynamic> json) {
  return _$_Task(
    id: json['id'] as int,
    name: json['name'] as String,
    order: json['order'] as int,
    details: json['details'] as String?,
    dateTime: json['dateTime'] == null
        ? null
        : DateTime.parse(json['dateTime'] as String),
    timeOfDay: const TimeOfDayConverter()
        .fromJson(json['timeOfDay'] as Map<String, dynamic>?),
    completed: json['completed'] as bool? ?? false,
    subtasks: (json['subtasks'] as List<dynamic>?)
            ?.map((e) => SubTask.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'details': instance.details,
      'dateTime': instance.dateTime?.toIso8601String(),
      'timeOfDay': const TimeOfDayConverter().toJson(instance.timeOfDay),
      'completed': instance.completed,
      'subtasks': instance.subtasks.map((e) => e.toJson()).toList(),
    };
