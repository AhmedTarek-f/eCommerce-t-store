import 'package:get/get.dart';
import 'package:t_store/core/utlis/loaders/t_loaders.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/shop/product_details/model/product_model.dart';

class SearchInStoreController extends GetxController {
  static SearchInStoreController get instance => Get.find();

  final ProductRepository _productRepository = ProductRepository.instance;
  final RxList<ProductModel> products = <ProductModel>[].obs;
  final RxList<ProductModel> productsSearchList = <ProductModel>[].obs;
  RxBool isLoading = false.obs;


  @override
  void onInit() {
    fetchAllProducts();
    super.onInit();
  }

  Future<void> fetchAllProducts() async {
    try{
      isLoading.value = true;
      final productsList = await _productRepository.getAllProducts();
      products.assignAll(productsList);
      isLoading.value = false;
    }catch (e) {
      isLoading.value =false;
      TLoaders.errorSnackBar(title: "Oh Snap!", message:  e.toString());
    }
  }

  void searchForAProduct(String productTitle) {
    productsSearchList.clear();
    if(products.isNotEmpty) {
      for(int i =0 ; i< products.length ; i++) {
        if(products[i].title.toLowerCase().contains(productTitle.toLowerCase())){
          productsSearchList.add(products[i]);
        }
      }
    }
  }

}