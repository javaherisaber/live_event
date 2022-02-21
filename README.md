# live_event
[![pub package](https://img.shields.io/pub/v/live_event.svg)](https://pub.dartlang.org/packages/live_event)

An event without data, using StreamController.

## Getting started
Have you been creating StreamControllers without data like this?
```dart
class MyBloc {
  final _someEvent = StreamController<void>();
  
  Stream get someEvent => _someEvent.stream;
  
  void logic() {
    _someEvent.sink.add(null);
  }
}
```

Now you don't need to pass null to indicate it's just an event:
```dart
import 'package:live_event/live_event.dart';

class MyBloc {
  final _someEvent = LiveEvent();
  
  Stream get someEvent => _someEvent.stream;
  
  void logic() {
    _someEvent.fire(); // here we don't need to pass null anymore!
  }
}
```

## Usage

To use this plugin, add [live_event](https://pub.dartlang.org/packages/live_event#-installing-tab-) as a dependency in your pubspec.yaml file.
```yaml
dependencies:
  live_event: ^lastVersion
```

## Example

```dart
import 'package:live_event/live_event.dart';

class MyBloc {
  final _someEvent = LiveEvent();
  
  Stream get someEvent => _someEvent.stream;
  
  void logic() {
    _someEvent.fire();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  late MyBloc bloc;
  
  @override
  void initState() {
    super.initState();
    bloc = MyBloc();
    
    bloc.someEvent.listen((_) {
      // do something about this event
    });
  }
}
```