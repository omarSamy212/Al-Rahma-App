import 'package:collection/collection.dart';

enum AttedanceState {
  waiting,
  attend,
  left,
}

enum BugState {
  reported,
  fixing,
  done,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (AttedanceState):
      return AttedanceState.values.deserialize(value) as T?;
    case (BugState):
      return BugState.values.deserialize(value) as T?;
    default:
      return null;
  }
}
