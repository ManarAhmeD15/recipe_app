import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipe_app/models/recipe_model.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0",
        "tag":"list.recipe.popular",
        });

    final response = await http.get(
        uri, headers: {
      "x-rapidapi-key": "006932b830mshe71d95effe75d53p18a118jsn60077f28187a",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    //print(response.body);
     List _temp = [];
     //List _detail=[];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
      //_temp.add(i['display']);
      //_detail.add(i['display']);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }

  // static Future<List<Recipe>> getDetails() async {
  //   var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
  //       {"limit": "18", "start": "0",
  //         "tag":"list.recipe.popular",
  //       });
  //
  //   final response = await http.get(
  //       uri, headers: {
  //     "x-rapidapi-key": "006932b830mshe71d95effe75d53p18a118jsn60077f28187a",
  //     "x-rapidapi-host": "yummly2.p.rapidapi.com",
  //     "useQueryString": "true"
  //   });
  //
  //   Map data = jsonDecode(response.body);
  //   List _detail=[];
  //
  //   for (var i in data['feed']) {
  //     //_detail.add(i['display']);
  //   }
  //
  //   return Recipe.recipesFromSnapshot(_detail);
  // }

}