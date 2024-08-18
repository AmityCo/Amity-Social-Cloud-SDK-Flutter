import 'package:hive/hive.dart';

class DateTimeAdapter extends TypeAdapter<DateTime> {
  @override
  final typeId = 32;

  @override
  int write(BinaryWriter writer, DateTime obj) {
    return obj.millisecondsSinceEpoch;
  }

  @override
  DateTime read(BinaryReader reader) {
    return DateTime.fromMillisecondsSinceEpoch(reader.readInt());
  }
}