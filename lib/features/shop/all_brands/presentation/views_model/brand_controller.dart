import 'package:get/get.dart';
import 'package:t_store/core/utlis/loaders/t_loaders.dart';
import 'package:t_store/data/repositories/brand/brand_repository.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/shop/all_brands/model/brand_model.dart';
import 'package:t_store/features/shop/product_details/model/product_model.dart';

class BrandController extends GetxController{
  static BrandController get instance => Get.find();

  final BrandRepository _brandRepository = Get.put(BrandRepository());
  final ProductRepository _productRepository = ProductRepository.instance;
  RxList<BrandModel> allBrandsList = <BrandModel>[].obs;
  RxList<BrandModel> featuredBrandsList = <BrandModel>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    fetchFeaturedBrands();
    super.onInit();
  }

  Future<void> fetchFeaturedBrands() async {
    try{
      isLoading.value=true;
      final listOfAllBrands = await _brandRepository.getAllBrands();
      allBrandsList.assignAll(listOfAllBrands);
      featuredBrandsList.assignAll(allBrandsList.take(4));
    }
    catch(e) {
      TLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
    }
    finally{
      isLoading.value=false;
    }
  }

  Future<List<ProductModel>> getBrandProducts({required String brandId, int limit = -1}) async{
    try{
      final List<ProductModel> products = await _productRepository.getProductsForBrand(brandId: brandId , limit: limit);
      return products;
    }catch (e){
      TLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
      return [];
    }
  }

  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try{
      final List<BrandModel> brands = await _brandRepository.getBrandsForCategory(categoryId);
      return brands;
    }
    catch(e) {
      TLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
      return [];
    }
  }
}