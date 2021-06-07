// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tlist.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TlistAdapter extends TypeAdapter<Tlist> {
  @override
  final int typeId = 0;

  @override
  Tlist read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tlist(
      id: fields[0] as String,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Tlist obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TlistAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tlist _$_$_TlistFromJson(Map<String, dynamic> json) {
  return _$_Tlist(
    id: json['id'] as String,
    name: json['name'] as String,
    tasks: (json['tasks'] as List<dynamic>?)
            ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_TlistToJson(_$_Tlist instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tasks': instance.tasks,
    };
