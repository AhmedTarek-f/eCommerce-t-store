import 'package:get/get.dart';
import 'package:t_store/core/utlis/loaders/t_loaders.dart';
import 'package:t_store/data/repositories/banners/banners_repository.dart';
import 'package:t_store/features/shop/home/model/banner_model.dart';

class BannerController extends GetxController{
  static BannerController get instance => Get.find();
  final BannersRepository _bannersRepository = Get.put(BannersRepository());

  final RxInt currentImageIndex =0.obs;
  final RxBool isLoading = false.obs;
  final RxList<BannerModel> allActiveBanners = <BannerModel>[].obs;


  void updateImageIndex(int index)
  {
    currentImageIndex.value = index;
  }

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  Future<void> fetchBanners() async {
    try{
      isLoading.value = true;

      final List<BannerModel> bannersList = await _bannersRepository.getAllBanners();

      allActiveBanners.assignAll(bannersList);
    }
    catch(e)
    {
      TLoaders.errorSnackBar(title: "Oh Snap!".tr, message:e.toString().tr,);
    }
    finally{
      isLoading.value = false;
    }
  }
}