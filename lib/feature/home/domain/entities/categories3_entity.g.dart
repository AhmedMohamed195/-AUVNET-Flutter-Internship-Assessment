// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories3_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Categories3Adapter extends TypeAdapter<Categories3> {
  @override
  final int typeId = 0;

  @override
  Categories3 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Categories3(
      image: fields[0] as String,
      text1: fields[1] as String,
      text2: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Categories3 obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.text1)
      ..writeByte(2)
      ..write(obj.text2);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Categories3Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
