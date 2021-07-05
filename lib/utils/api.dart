import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Api {
  final _links = {
    'categories':
        'https://gist.github.com/BrunoMoraes-Z/6d65e03bff185f664573430b1c6c6b64/raw/016d56b94dafd071865f1992a39e90a965d4e833/categories.json',
    'products':
        'https://gist.github.com/BrunoMoraes-Z/6d65e03bff185f664573430b1c6c6b64/raw/016d56b94dafd071865f1992a39e90a965d4e833/products.json',
    'users':
        'https://gist.github.com/BrunoMoraes-Z/6d65e03bff185f664573430b1c6c6b64/raw/016d56b94dafd071865f1992a39e90a965d4e833/users.json'
  };

  dynamic getCategories() async {
    var url = Uri.parse(_links['categories']!);
    var response = await http.get(url);
    return convert.json.decode(response.body);
  }

  dynamic getProducts() async {
    var url = Uri.parse(_links['products']!);
    var response = await http.get(url);
    return convert.json.decode(response.body);
  }

  dynamic getUsers() async {
    var url = Uri.parse(_links['users']!);
    var response = await http.get(url);
    return convert.json.decode(response.body);
  }
}
