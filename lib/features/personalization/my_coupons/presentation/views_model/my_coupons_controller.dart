import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/core/utlis/loaders/t_loaders.dart';
import 'package:t_store/data/repositories/coupons/coupons_repository.dart';
import 'package:t_store/features/personalization/my_coupons/model/coupons_model.dart';

class MyCouponsController extends GetxController
{
  static MyCouponsController get instance => Get.find();
  final CouponsRepository _couponsRepository = Get.put(CouponsRepository());
  final GetStorage _storage = GetStorage();

  bool isArabic() {
    final String language = _storage.read("lang");
    return language == "ar";
  }

  Future<List<CouponsModel>> fetchAllMyCoupons() async {
    try{
      return await _couponsRepository.fetchMyCoupons();
    }
    catch(e) {
      TLoaders.errorSnackBar(title: "Oh Snap!".tr , message: e.toString());
      return [];
    }
  }

  Future<List<CouponsModel>> fetchAllMyCouponsAr() async {
    try{
      return await _couponsRepository.fetchMyCouponsAr();
    }
    catch(e) {
      TLoaders.errorSnackBar(title: "Oh Snap!".tr , message: e.toString());
      return [];
    }
  }
}