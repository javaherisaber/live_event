import 'package:live_event/live_event.dart';

class MyBloc {
  final _someEvent = LiveEvent();

  Stream get someEvent => _someEvent.stream;

  void triggerTheEvent() {
    _someEvent.fire();
  }

  void dispose() {
    _someEvent.close();
  }
}