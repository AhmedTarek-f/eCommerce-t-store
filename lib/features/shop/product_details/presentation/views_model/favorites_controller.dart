import 'dart:convert';

import 'package:get/get.dart';
import 'package:t_store/core/utlis/loaders/t_loaders.dart';
import 'package:t_store/core/utlis/local_storage/t_local_storage.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/shop/product_details/model/product_model.dart';

class FavoritesController extends GetxController
{
  static FavoritesController get instance => Get.find();
  final RxMap<String, bool> favorites = <String,bool>{}.obs;
  
  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

 void initFavorites() {
    final json = TLocalStorage.instance().readData("favorites");
    if(json != null) {
      final storedFavorites = jsonDecode(json) as Map<String,dynamic>;
      favorites.assignAll(storedFavorites.map((key,value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavorite(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId) {
    if(!favorites.containsKey(productId)){
      favorites[productId] = true;
      saveFavoritesToStorage();
      TLoaders.customToast(message: "Product has been added to the WishList.");
    }
    else {
      TLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoritesToStorage();
      favorites.refresh();
      TLoaders.customToast(message: "Product has been removed from the WishList.");
    }
  }

  void saveFavoritesToStorage() {
    final encodedFavorites = json.encode(favorites);
    TLocalStorage.instance().saveData("favorites", encodedFavorites);
  }

  Future<List<ProductModel>> favoriteProducts() async {
    return await ProductRepository.instance.getFavoriteProducts(favorites.keys.toList());
  }

}