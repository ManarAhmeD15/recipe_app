import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/constants/color.dart';
import 'package:recipe_app/layout/layout.dart';
import 'package:recipe_app/pages/details_screen.dart';
import 'package:recipe_app/pages/login_screen.dart';

import '../models/recipe_api.dart';
import '../models/recipe_model.dart';
import '../widgets/recipe_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Recipe> _recipes = [];
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecipes();
    print(_recipes);
  }

  Future<void>
  getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  //Recipe? item;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(
                width: 10,
              ),
              Text(
                "Food Recipe ",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    //fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: _recipes.length,
          itemBuilder: (context, index) {
            return RecipeCard(
              recipe: _recipes[index],

              // title: _recipes[index].name,
              // cookTime: _recipes[index].totalTime,
              // rating: _recipes[index].rating.toString(),
              // thumbnailUrl: _recipes[index].images);
            );},
        ),
        //)
      ),
    );
  }
}