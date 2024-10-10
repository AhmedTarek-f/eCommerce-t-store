import 'package:get/get.dart';
import 'package:t_store/core/constants/enums.dart';
import 'package:t_store/core/utlis/loaders/t_loaders.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/shop/product_details/model/product_model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final RxBool isLoading = false.obs;
  final ProductRepository _productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProductsList = <ProductModel>[].obs;
  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  Future<void> fetchFeaturedProducts() async {
    try{
      isLoading.value = true;
      final products  = await _productRepository.getFeaturedProducts();
      featuredProductsList.assignAll(products);
    }
    catch(e)
    {
      TLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
    }
    finally{
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try{
      final products  = await _productRepository.getAllFeaturedProducts();
      return products;
    }
    catch(e)
    {
      TLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
      return [];
    }
  }

  String getProductPrice(ProductModel product)
  {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    if(product.productType == ProductType.single.toString())
      {
        return (product.salePrice >0 ? product.salePrice : product.price).toString();
      }
    else {
      for(var variation in product.productVariations!)
        {
          double priceToConsider = variation.salePrice >0.0 ? variation.salePrice : variation.price;

          if(priceToConsider < smallestPrice)
            {
              smallestPrice = priceToConsider;
            }

          if(priceToConsider > largestPrice)
            {
              largestPrice = priceToConsider;
            }
        }

      if(smallestPrice.isEqual(largestPrice))
        {
          return largestPrice.toString();
        }else{
        return "$smallestPrice -\$$largestPrice";
      }
    }
  }

  String? calculateSalePercentage(double originalPrice , double? salePrice)
  {
    if(salePrice == null || salePrice <0.0) return null;
    if(originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice)/ originalPrice) *100;
    return percentage.toStringAsFixed(0);
  }

  String getProductStockStatus(int stock) {
    return stock > 0 ? "In Stock" : "Out of Stock";
  }
}