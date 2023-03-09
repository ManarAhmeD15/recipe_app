import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:recipe_app/constants/color.dart';
import 'package:recipe_app/models/recipe_model.dart';

import '../models/recipe_api.dart';

class DetailsScreen extends StatefulWidget {
   DetailsScreen({Key? key,required this.recipe }) : super(key: key);
 final Recipe recipe;



   @override
  State<DetailsScreen> createState() => _DetailsScreenState();

}


class _DetailsScreenState extends State<DetailsScreen> {


  // List<Recipe> _detailes = [];
  //
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getDetails();
  //   print(_detailes);
  // }
  //
  // Future<void> getDetails() async {
  //
  //   _detailes = await RecipeApi.getDetails();
  //
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backColor,
          title: Text(widget.recipe.displayName.toString()),

        ),
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/1.5,
                  child: Image.network(
                    widget.recipe.images,

                    fit: BoxFit.cover,),
                ),
              ),

              Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Container(
                      clipBehavior: Clip.hardEdge,
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10)))),


              scrollingContainer(),

            ],
          ),
        ),
      ),
    );
  }

  scrollingContainer() {
    return DraggableScrollableSheet(
        initialChildSize: 0.5,
        maxChildSize: 1.0,
        minChildSize: 0.5,
        expand: true,
        builder: (context,scrollController){
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFirstSector(context),
                    _buildSecondContainer(context),
                    //_buildThirdContainer(context),

                    // Stack(
                    //   children: [
                    //     Align(
                    //       alignment: Alignment.bottomRight,
                    //       child: Container(
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             ElevatedButton(
                    //               style: ButtonStyle(
                    //                   backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
                    //                   shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    //                     borderRadius: BorderRadius.circular(22.0),
                    //                   ))),
                    //               onPressed: (){},
                    //               child: Padding(
                    //                 padding: const EdgeInsets.all(10.0),
                    //                 child: const Text('Purchase Now ',style: TextStyle(
                    //                   fontWeight: FontWeight.bold,
                    //                   color: AppColors.secondaryColor,
                    //                   fontSize: 20,
                    //                 ),),
                    //               ),
                    //             ),
                    //             Text(
                    //               "uyguyjhgyujhg",
                    //               //carItem!.price!,
                    //               style: TextStyle(
                    //                 fontWeight: FontWeight.bold,
                    //                 color: AppColors.primaryColor,
                    //                 fontSize: 20,
                    //               ),),
                    //
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),

                  ],

                ),
              ),

            ),

          );
        }

    );


  }

  _buildFirstSector(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 80,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,

              ),

            ),
          ),
          SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [


              Text('Specifications',
                style: TextStyle(fontSize: 22, color: Colors.grey,fontWeight: FontWeight.bold),),
              Row(
                children: [
                  Icon(Icons.star,color: Colors.amber,size: 20,),
                  Text(widget.recipe.rating.toString(),
                    style: TextStyle(fontSize: 22, color: AppColors.primaryColor,fontWeight: FontWeight.bold),),
                ],
              ),


            ],


          ),
          SizedBox(height: 10,),
          Text(widget.recipe.displayName.toString(),
            style: TextStyle(fontSize: 22, color:AppColors.backColor ,fontWeight: FontWeight.bold),),
          SizedBox(height: 17,),

          Text(widget.recipe.name,
            style: TextStyle(fontSize: 22, color: AppColors.backColor,fontWeight: FontWeight.bold),),



        ],
      ),
    );




  }

  _buildSecondContainer(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.symmetric(vertical: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "The Secret Recipe  :",
                style: TextStyle(fontSize: 25, color: Colors.grey,fontWeight: FontWeight.bold),
                maxLines: 6,),

            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "1. Remove chicken breasts from the refrigerator and allow them to come to room temperature for at least three minutes. Season well with salt and pepper and let it rest.\n \n"
                "2. Preheat oven to 425 degrees F°. Place a large stainless steel or cast iron skillet over high heat and add grapeseed oil. Add sprigs of thyme and smashed whole garlic cloves to the plate with the chicken.\n \n"
                "3. When the oil in the pan is hot, place chicken breasts skin-side down into the pan. Test the pan for heat first by lightly touching the chicken down—if you hear it sizzle, it’s ready. Don’t add the chicken to the pan until it’s sizzling hot. \n \n"
                "4. Dump the garlic and thyme on top of the chicken in the pan and lower the heat to medium. Don’t move the chicken until skin releases and browns on the edges, about 4 minutes. To sear the sides, tilt the chicken to the edge of the pan, about 10 seconds per side. \n \n"
                "5. Flip the chicken and add 6 tablespoons butter. As the butter melts, carefully and continuously spoon it over the chicken breasts, basting the skin until golden, about 3 minutes. Flip the chicken back over so that the skin side is down again, and baste that side of the chicken.",
            style: TextStyle(fontSize: 20, color: AppColors.backgroundColor,fontWeight: FontWeight.bold),
            maxLines: 30,),

        ],
      ),
    );


  }
}
