import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';

class ConsoleMessageLevel {
  final int _value;

  const ConsoleMessageLevel._internal(this._value);

  static final Set<ConsoleMessageLevel> values = [
    ConsoleMessageLevel.TIP,
    ConsoleMessageLevel.LOG,
    ConsoleMessageLevel.WARNING,
    ConsoleMessageLevel.ERROR,
    ConsoleMessageLevel.DEBUG,
  ].toSet();

  static ConsoleMessageLevel fromValue(int value) {
    if (value != null)
      return ConsoleMessageLevel.values.firstWhere(
          (element) => element.toValue() == value,
          orElse: () => null);
    return null;
  }

  int toValue() => _value;

  @override
  String toString() {
    switch (_value) {
      case 0:
        return "TIP";
      case 2:
        return "WARNING";
      case 3:
        return "ERROR";
      case 4:
        return "DEBUG";
      case 1:
      default:
        return "LOG";
    }
  }

  static const TIP = const ConsoleMessageLevel._internal(0);
  static const LOG = const ConsoleMessageLevel._internal(1);
  static const WARNING = const ConsoleMessageLevel._internal(2);
  static const ERROR = const ConsoleMessageLevel._internal(3);
  static const DEBUG = const ConsoleMessageLevel._internal(4);

  bool operator ==(value) => value == _value;

  @override
  int get hashCode => _value.hashCode;
}

class ConsoleMessage {
  String message;
  ConsoleMessageLevel messageLevel;

  ConsoleMessage(
      {this.message = "", this.messageLevel = ConsoleMessageLevel.LOG});

  Map<String, dynamic> toMap() {
    return {"message": message, "messageLevel": messageLevel?.toValue()};
  }

  Map<String, dynamic> toJson() {
    return this.toMap();
  }

  @override
  String toString() {
    return toMap().toString();
  }
}
