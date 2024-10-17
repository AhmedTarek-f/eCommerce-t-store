import 'package:get/get.dart';
import 'package:t_store/features/personalization/my_address/presentation/views_model/address_controller.dart';
import 'package:t_store/features/shop/checkout/presentation/views_model/checkout_controller.dart';

class GeneralBindings extends Bindings {

  @override
  void dependencies() {
    Get.put(AddressController());
    Get.put(CheckoutController());
  }
}
