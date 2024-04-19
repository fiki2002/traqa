import 'package:ably_flutter/ably_flutter.dart' as ably;
import 'package:traqa/core/core.dart';

abstract interface class OrderDataSource {
  Future<void> connectToTraqaChannel();
  Stream<ably.Message> getOrderUpdates();
}

class OrderDataSourceImpl extends OrderDataSource {
  late final ably.Realtime _ablyRealtime;
  late ably.RealtimeChannel _traqaChannel;
  late final ably.ClientOptions _clientOptions;

  OrderDataSourceImpl() {
    _clientOptions = ably.ClientOptions(key: ablyApiKey);
    _ablyRealtime = ably.Realtime(options: _clientOptions);
    _traqaChannel = _ablyRealtime.channels.get('traqa');
  }

  @override
  Future<void> connectToTraqaChannel() async {
    await _traqaChannel.attach();
  }

  @override
  Stream<ably.Message> getOrderUpdates() {
    return _traqaChannel.subscribe().map((message) => message);
  }
}
