import 'package:shelf/shelf.dart';

class MiddlewareInterception {
  Middleware get middlerware => createMiddleware(
        responseHandler: (Response res) => res.change(
          headers: {
            'Content-Type': 'text/html',
            'xpto': '1234',
            'Access-Control-Allow-Origin': '*',
          },
        ),
      );
}
