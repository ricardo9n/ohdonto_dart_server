import 'package:shelf/shelf_io.dart' as shelf_io;

import './server_handler.dart';

void main() async {
  print('running server');
  var _server = ServerHandler();
  final server = await shelf_io.serve(_server.handler, 'localhost', 8090);
  print('finished');
}
