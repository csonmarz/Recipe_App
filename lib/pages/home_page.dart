import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/recipe.api.dart';
import '../widgets/recipe.dart';
import 'body.dart';
import 'loading.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getRecipe();
  }

Future<void> getRecipe() async {
  _recipes= await RecipeApi.getRecipe();
  setState(() {
    _isLoading= false;
  });
  print(_recipes);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width:10),
            Text('Food Recipe'),
          ],
        ),
      ),
      body: _isLoading? const Loading() : Body(recipes: _recipes),
    );
  }
}