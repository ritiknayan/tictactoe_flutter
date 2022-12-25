import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient {
  IO.Socket? socket;
  static SocketClient? _instance;
  SocketClient._internal() {
    socket = IO.io("http://192.168.29.160:3000", <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket!.on('connect', (_) => print('connect: ${socket!.id}'));
    socket!.on('disconnect', (_) => {print('disconnected due to $_')});
    socket!.on('fromServer', (_) => print(_));
    socket!.connect();
  }

  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    return _instance!;
  }
}
