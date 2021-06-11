import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:tasks/models/sort_by.dart';
import 'package:tasks/models/task.dart';

part 'tlist.freezed.dart';
part 'tlist.g.dart';

@freezed
@HiveType(typeId: 0)
class Tlist with _$Tlist {
  const factory Tlist({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2, defaultValue: SortBy.MyOrder)
    @Default(SortBy.MyOrder)
        SortBy sortBy,
    @Default([]) List<Task> tasks,
  }) = _Tlist;

  factory Tlist.fromJson(Map<String, dynamic> json) => _$TlistFromJson(json);
}
