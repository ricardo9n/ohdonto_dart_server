import 'package:shelf/shelf.dart';

//import 'apis/blog_api.dart';
//import 'apis/login_api.dart';
import 'apis/signup_api.dart';
import 'infra/custom_server.dart';
import 'infra/middleware_interception.dart';
//import 'infra/security/security_service_imp.dart';
import 'services/user_service.dart';
import 'utils/custom_env.dart';

void main() async {
  CustomEnv.fromFile('.env-dev');

  //var _securityService = SecurityServiceImp();

  var cascadeHandler = Cascade()
      //.add(LoginApi(_securityService).getHandler())
      .add(SignUpApi(UserService()).getHandler(
          // middlewares: [
          //   _securityService.authorization,
          //   _securityService.verifyJwt
          // ],
          ))
      .handler;

  var handler = Pipeline()
      .addMiddleware(logRequests()) // global Middlewares
      .addMiddleware(MiddlewareInterception().middlerware) // global Middlewares
      .addHandler(cascadeHandler);

  await CustomServer().initialize(
    handler: handler,
    address: 'localhost', //await CustomEnv.get<String>(key: 'server_address'),
    port: 8082, //await CustomEnv.get<int>(key: 'server_port'),
  );
}
