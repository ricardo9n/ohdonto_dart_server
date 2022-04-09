import 'package:shelf/shelf.dart';

class MiddlewareInterception {
  Middleware get middlerware => createMiddleware(
        responseHandler: (Response res) => res.change(
          headers: {
            'Content-Type': 'application/json',
            'xpto': '1234',
            'Access-Control-Allow-Origin': '*', // Required for CORS support to work
            'Access-Control-Allow-Credentials': 'true', // Required for cookies, authorization headers with HTTPS
            //'Access-Control-Allow-Headers': 'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale',
            'Access-Control-Allow-Headers': '*',
            'Access-Control-Allow-Methods': '*',//'POST, OPTIONS',
          },
        ),
      );
}
