// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_search.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecentSearchAdapter extends TypeAdapter<RecentSearch> {
  @override
  RecentSearch read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecentSearch(
      fields[0] as String,
      fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, RecentSearch obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.userSearch)
      ..writeByte(1)
      ..write(obj.weight);
  }
}
