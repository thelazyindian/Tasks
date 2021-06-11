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
      sortBy: fields[2] == null ? SortBy.MyOrder : fields[2] as SortBy,
    );
  }

  @override
  void write(BinaryWriter writer, Tlist obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.sortBy);
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
    sortBy:
        _$enumDecodeNullable(_$SortByEnumMap, json['sortBy']) ?? SortBy.MyOrder,
    tasks: (json['tasks'] as List<dynamic>?)
            ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_TlistToJson(_$_Tlist instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sortBy': _$SortByEnumMap[instance.sortBy],
      'tasks': instance.tasks,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$SortByEnumMap = {
  SortBy.MyOrder: 'MyOrder',
  SortBy.Date: 'Date',
};
