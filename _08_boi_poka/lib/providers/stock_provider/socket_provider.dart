import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

// This provider handles the WebSocket connection
final socketProvider = StateNotifierProvider<SocketNotifier, IO.Socket>((ref) {
  final socket = IO.io(
    'http://192.168.255.225:3000:3000',
    IO.OptionBuilder().setTransports(['websocket']).build(),
  );

  return SocketNotifier(socket);
});

// This is the notifier that listens to socket events
class SocketNotifier extends StateNotifier<IO.Socket> {
  SocketNotifier(IO.Socket state) : super(state) {
    // Listen for stock updates
    state.on('stock_update', (stockData) {
      // Handle stock data updates here
    });

    // Handle connection and disconnection events
    state.on('connect', (_) {
      print('Connected to WebSocket');
    });

    state.on('disconnect', (_) {
      print('Disconnected from WebSocket');
    });
  }

  // Disconnect the socket when done
  void disconnect() {
    state.disconnect();
  }
}
