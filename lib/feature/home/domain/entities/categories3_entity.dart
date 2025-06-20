import 'package:hive/hive.dart';

part 'categories3_entity.g.dart'; 

@HiveType(typeId: 0)
class Categories3 {
  @HiveField(0)
  final String image;

  @HiveField(1)
  final String text1;

  @HiveField(2)
  final String text2;

  Categories3({
    required this.image,
    required this.text1,
    required this.text2,
  });
}
