import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../models/user_model.dart';
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
      List<Map> userModelMap = users.map((e) => e.toMap()).toList();

      return Response.ok(jsonEncode(userModelMap));
    });

    // cadastro usuario
    router.post('/signup', (Request req) async {
      var body = await req.readAsString();
      var user = UserModel.fromSignUpMap(json.decode(body));
      user = _service.save2(user);
      print(user.toMap().toString());
      print(json.encode(user.toMap()));
      return Response.ok(json.encode(user.toMap()),
          headers: {'Content-Type': 'application/json; charset=UTF-8'});
    });

    router.post('/fksignup', (Request req) async {
      try {
        var body = await req.readAsString();
        var user = UserModel.fromSignUpMap(json.decode(body));

        var resposta = {
          "id": "1234567890",
          "name": "teste silva jr",
          "email": "teste@teste.com",
          "password": "t#sT3s33eSeE#"
        };

        user = _service.save2(user);

        print('body: ' + body);
        print("map2str: " + user.toMap().toString());
        print('json.encode: ' + json.encode(user.toMap()));
        print('json encode r: ' + json.encode(resposta));

        return Response.ok(json.encode(resposta));
      } on Exception catch (e) {
        print('opz: ' + e.toString());
      }
    });

    // /blog/noticias?id=1 // update
    router.put('/users/user', (Request req) {
      String? id = req.url.queryParameters['id'];
      // _service.save('');
      return Response.ok('Choveu hoje');
    });

    // /blog/noticias?id=1 // delete
    router.delete('/users/user', (Request req) {
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
