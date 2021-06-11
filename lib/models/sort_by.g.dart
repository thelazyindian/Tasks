// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort_by.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SortByAdapter extends TypeAdapter<SortBy> {
  @override
  final int typeId = 3;

  @override
  SortBy read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SortBy.MyOrder;
      case 1:
        return SortBy.Date;
      default:
        return SortBy.MyOrder;
    }
  }

  @override
  void write(BinaryWriter writer, SortBy obj) {
    switch (obj) {
      case SortBy.MyOrder:
        writer.writeByte(0);
        break;
      case SortBy.Date:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SortByAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
