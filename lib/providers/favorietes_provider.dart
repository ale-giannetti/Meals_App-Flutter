import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';


class FavoritesMealsNotifier extends StateNotifier<List<Meal>>{
  FavoritesMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal){
    final mealsIsFavorite = state.contains(meal);

    if(mealsIsFavorite){
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
    state = [...state, meal];
    return true;
    }
    
  }
}

final favoritesMealsProvider = StateNotifierProvider<FavoritesMealsNotifier, List<Meal>>(
  (ref) {
    return FavoritesMealsNotifier();
  }
);