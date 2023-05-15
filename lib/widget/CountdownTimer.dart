import 'dart:async';

class CountdownTimer {
  late Duration duration;
  late Duration tick;

  CountdownTimer(this.duration, this.tick);

  late StreamController<CountdownTimer> controller;
  late StreamSubscription<CountdownTimer> subscription;

  void listen(void Function(CountdownTimer count) listener) {
    controller = StreamController.broadcast(
      onListen: _onListen,
      onCancel: _onCancel,
    );
    subscription = controller.stream.listen(listener);
  }

  void start() async {
    while (duration.inSeconds > 0) {
      await Future.delayed(tick);
      duration -= tick;
      controller.add(this);
      if (duration.inSeconds == 0) {
        controller.close();
      }
    }
  }

  CountdownTimer get currentCount => this;

  bool get isActive => !controller.isClosed;

  void _onListen() {}

  void _onCancel() {}

  void cancel() {
    subscription.cancel();
    controller.close();
  }

  Duration get remaining => duration;
}