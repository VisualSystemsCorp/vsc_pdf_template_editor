import 'dart:async';

class Debouncer {
  final void Function() action;
  Timer? _timer;

  Debouncer(this.action);

  void trigger(Duration duration) {
    cancelQueued();
    _timer = Timer(duration, action);
  }

  void dispose() {
    cancelQueued();
    _timer = null;
  }

  /// Cancels any queued trigger.
  void cancelQueued() {
    _timer?.cancel();
    _timer = null;
  }
}
