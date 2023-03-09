import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_model.dart';

import '../pages/details_screen.dart';
import '../pages/login_screen.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

   // String? title;
   // String? rating;
   // String? cookTime;
   // String? thumbnailUrl;
  RecipeCard({
    required this.recipe,
     // this.title,
     // this.cookTime,
     // this.rating,
     // this.thumbnailUrl,
  });
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailsScreen(recipe: recipe, )));

      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: Offset(
                0.0,
                10.0,
              ),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.40),
              BlendMode.multiply,
            ),
            image: NetworkImage(recipe.images),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  recipe.name,
                  style: TextStyle(
                    fontSize: 19,
                      color: Colors.white
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              alignment: Alignment.center,
            ),
            Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 18,
                        ),
                        SizedBox(width: 7),
                        Text(recipe.rating.toString(),style: TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.schedule,
                          color: Colors.red,
                          size: 18,
                        ),
                        SizedBox(width: 7),
                        Text(recipe.totalTime,style: TextStyle(color: Colors.white),),
                      ],
                    ),
                  )
                ],
              ),
              alignment: Alignment.bottomLeft,
            ),
          ],
        ),
      ),
    );
  }
}