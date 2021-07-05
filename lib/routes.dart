import 'package:back_shelf/utils/api.dart';
import 'package:back_shelf/utils/my_response.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class Routes {
  Router get router {
    var router = Router();

    final _endpoints = ['users', 'products', 'categories'];

    router.get('/', (Request request) async {
      var users = await Api().getUsers();
      return MyResponse().json(200, users);
    });

    router.get('/<route>', (Request request, String route) async {
      if (_endpoints.contains(route)) {
        var result;
        switch (route) {
          case 'users':
            result = await Api().getUsers();
            break;
          case 'products':
            result = await Api().getProducts();
            break;
          case 'categories':
            result = await Api().getCategories();
            break;
          default:
        }
        return MyResponse().json(200, result);
      } else {
        return MyResponse().json(400, {
          'message': 'Informe uma rota válida',
          'rotas': _endpoints,
        });
      }
    });

    return router;
  }
}
