import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:recipeapp/widgets/recipe_card.dart';

import '../widgets/recipe.dart';

class Body extends StatelessWidget {
  const Body({Key? key,
   required List<Recipe> recipes,

  }) : _recipes= recipes,super(key: key);

  final List<Recipe> _recipes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child:
        ListView.builder(
          itemCount: _recipes.length,
          itemBuilder: (context, index) {
            return RecipeCard(
              title: _recipes[index].name, 
              cookTime: _recipes[index].totalTime, 
              rating: _recipes[index].toString(), 
              thumbnailUrl: _recipes[index].images,
            );
          },
          ),
        ),
      ],
    );
  }
}