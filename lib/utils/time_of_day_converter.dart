import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

class TimeOfDayConverter
    implements JsonConverter<TimeOfDay?, Map<String, dynamic>?> {
  const TimeOfDayConverter();

  @override
  fromJson(json) {
    if (json != null) {
      return TimeOfDay(
        hour: json['hour'],
        minute: json['minute'],
      );
    } else {
      return null;
    }
  }

  @override
  toJson(object) {
    if (object != null) {
      return {
        'hour': object.hour,
        'minute': object.minute,
      };
    } else {
      return null;
    }
  }
}

class TimeOfDayAdapter extends TypeAdapter<TimeOfDay> {
  @override
  final typeId = 4;

  @override
  void write(BinaryWriter writer, TimeOfDay obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.hour)
      ..writeByte(1)
      ..write(obj.minute);
  }

  TimeOfDay read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeOfDay(hour: fields[0] as int, minute: fields[1] as int);
  }
}
