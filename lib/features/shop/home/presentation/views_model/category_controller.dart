import 'package:get/get.dart';
import 'package:t_store/core/utlis/loaders/t_loaders.dart';
import 'package:t_store/data/repositories/categories/category_repository.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/shop/home/model/category_model.dart';
import 'package:t_store/features/shop/product_details/model/product_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();
  final CategoryRepository _categoryRepository = Get.put(CategoryRepository());
  final ProductRepository _productRepository = ProductRepository.instance;
  final RxBool isLoading = false.obs;
  final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;


  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try{
      isLoading.value = true;

      final List<CategoryModel> categoriesList = await _categoryRepository.getAllCategories();

      allCategories.assignAll(categoriesList);
      
      featuredCategories.assignAll(allCategories.where((category)=> category.isFeatured && category.parentId.isEmpty).take(8).toList());
    }
    catch(e)
    {
      TLoaders.errorSnackBar(title: "Oh Snap!", message:e.toString(),);
    }
    finally{
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchProductsForCategory({required String categoryId, int limit =4}) async {
    try{
      final categoryProducts = await _productRepository.getProductsForCategory(categoryId: categoryId,limit: limit);
      return categoryProducts;
    }
    catch(e) {
      TLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
      return [];
    }
  }
}