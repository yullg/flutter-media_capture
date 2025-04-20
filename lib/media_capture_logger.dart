import 'package:scaffold/scaffold.dart';

final class SpeechesLogger extends LoggerForward {
  static const kLoggerName = "media_capture";

  static SpeechesLogger? _instance;

  factory SpeechesLogger() {
    return _instance ??= SpeechesLogger._();
  }

  SpeechesLogger._() : super(const Logger(kLoggerName));
}
