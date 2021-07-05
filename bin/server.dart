import 'package:back_shelf/routes.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf_io.dart' as io;

void main() async {
  var app = Router();

  app.mount('/', Routes().router);

  var server = await io.serve(app, 'localhost', 8083);

  print('${server.address.host}:${server.port}');
}
