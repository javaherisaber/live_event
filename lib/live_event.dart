library live_event;

import 'dart:async';

/// Event without data, It is used to only trigger an action.
class LiveEvent {
  LiveEvent({bool sync = false}) : _streamController = StreamController(sync: sync);

  LiveEvent.broadCast({bool sync = false})
      : _streamController = StreamController.broadcast(sync: sync);

  final StreamController _streamController;

  Stream<void> get stream => _streamController.stream;

  /// Use this method to trigger your event
  void fire() => _streamController.isClosed ? _doNothing() : _streamController.sink.add(null);

  /// Make sure to close your event in your dispose strategy
  void close() => _streamController.close();

  void _doNothing() {}
}
