import 'package:hive/hive.dart';

part 'sort_by.g.dart';

@HiveType(typeId: 3)
enum SortBy {
  @HiveField(0)
  MyOrder,
  @HiveField(1)
  Date,
}

const sortByString = <SortBy, String>{
  SortBy.MyOrder: 'My order',
  SortBy.Date: 'Date',
};
