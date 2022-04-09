import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../models/signup_model.dart';
import '../models/user_model.dart';
import '../models/signup_model.dart';
import '../services/generic_service.dart';
import 'api.dart';

class SignUpApi extends Api {
  final GenericService<UserModel> _service;

  SignUpApi(this._service);

  @override
  Handler getHandler({List<Middleware>? middlewares}) {
    Router router = Router();

    // listagem
    router.get('/users/list', (Request req) {
      List<UserModel> users = _service.findAll();
      List<Map> userModelMap = users.map((e) => e.toJson()).toList();

      return Response.ok(jsonEncode(userModelMap));
    });

    // nova noticias
    router.post('/signup', (Request req) async {
      var body = await req.readAsString();
      var user = UserModel.fromJsonSignUp(json.decode(body));
      var nuser = _service.save2(user);
      print(nuser.toJson().toString());

      return Response.ok(json.encode(nuser.toJson()),
          headers: {'Content-type': 'application/json'});
    });

    // /blog/noticias?id=1 // update
    router.put('/blog/noticias', (Request req) {
      String? id = req.url.queryParameters['id'];

      // _service.save('');

      return Response.ok('Choveu hoje');
    });

    // /blog/noticias?id=1 // delete
    router.delete('/blog/noticias', (Request req) {
      String? id = req.url.queryParameters['id'];

      // _service.delete(1);
      return Response.ok('Choveu hoje');
    });

    return createHandler(
      router: router,
      middlewares: middlewares,
    );
  }
}
