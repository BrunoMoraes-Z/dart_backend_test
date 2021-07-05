import 'film_api.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

void main() async {
  var app = Router();

  app.mount('/films/', FilmApi().router);

  app.get('/user/<name|.*>', (Request request, String name) {
    final param = name.isNotEmpty ? name : 'World';
    return Response.ok('Hello $param!');
  });

  var server = await io.serve(app, 'localhost', 8083);
  print('${server.address.address}:${server.port}');
}
