import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/common_widgets/texts/t_section_heading.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/core/utlis/loaders/t_loaders.dart';
import 'package:t_store/core/utlis/popups/t_full_screen_loader.dart';
import 'package:t_store/data/repositories/address/address_repository.dart';
import 'package:t_store/features/personalization/my_address/model/address_model.dart';
import 'package:t_store/features/personalization/my_address/presentation/views/add_new_address_view.dart';
import 'package:t_store/features/personalization/my_address/presentation/views/widgets/t_single_address.dart';

class AddressController extends GetxController
{
  static AddressController get instance => Get.find();
  Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final AddressRepository _addressRepository = Get.put(AddressRepository());

  final TextEditingController name = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController street = TextEditingController();
  final TextEditingController postalCode = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();
  Rx<AutovalidateMode>  autoValidateMode = AutovalidateMode.disabled.obs;
  RxBool refreshData = true.obs;
  final GetStorage _storage = GetStorage();

  Future<List<AddressModel>> getAllUserAddresses() async{
    try{
      final allAddresses = await _addressRepository.fetchUserAddresses();
      selectedAddress.value = allAddresses.firstWhere((selected) => selected.selectedAddress ,orElse: ()=> AddressModel.empty());
      return allAddresses;
    }
    catch(e)
    {
      TLoaders.errorSnackBar(title: "Oh Snap!".tr,message: e.toString());
      return [];
    }
  }
  bool isArabic() {
    final String language = _storage.read("lang");
    return language == "ar";
  }

  Future<void> selectAddress(AddressModel newSelectedAddress) async{
    try{
      Get.defaultDialog(
        title: "",
        onWillPop:  () async {return false;},
        barrierDismissible:  false,
        backgroundColor:  Colors.transparent,
        content:  const Center(child:  CircularProgressIndicator(color: TColors.primaryColor,)),
      );

      if(selectedAddress.value.id.isNotEmpty){
        await _addressRepository.updateSelectedField(selectedAddress.value.id, false);
      }
        newSelectedAddress.selectedAddress = true;
        selectedAddress.value = newSelectedAddress;
        await _addressRepository.updateSelectedField(selectedAddress.value.id, true);
        Get.back();
    }
    catch(e)
    {
      TLoaders.errorSnackBar(title: "Error in Selection".tr,message: e.toString());
    }
  }

  Future<void> addNewAddress() async {
    try{
      if(!addressFormKey.currentState!.validate()){
        autoValidateMode.value= AutovalidateMode.always;
      }
      else {
        TFullScreenLoader.openLoadingDialog("Storing Address...".tr, TImages.docerAnimation);
        final address = AddressModel(
          id: '',
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          city: city.text.trim(),
          state: state.text.trim(),
          postalCode: postalCode.text.trim(),
          country: country.text.trim(),
          selectedAddress: true,
        );
        final id = await _addressRepository.addAddress(address);
        address.id = id;
        await selectAddress(address);
        TFullScreenLoader.stopLoading();
        TLoaders.successSnackBar(title: "Congratulations".tr, message: "Your address has been saved successfully.".tr);
        refreshData.toggle();
        resetFormFields();
        Navigator.of(Get.context!).pop();
      }
    }
    catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Address not found".tr,message: e.toString());
    }
  }

  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          padding:  const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TSectionHeading(title: "Select address".tr , showActionButton: false,),
              FutureBuilder<List<AddressModel>>(
                  future: getAllUserAddresses(),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return const Center(child: CircularProgressIndicator(color: TColors.primaryColor,),);
                    }
                    else if(!snapshot.hasData || snapshot.data == null || (snapshot.data?.isEmpty ?? true))
                    {
                      return Center(child: Text("No Data Found!".tr),);
                    }
                    else if(snapshot.hasError)
                    {
                      return Center(child:  Text("Something went wrong.".tr),);
                    }
                    else{
                      final List<AddressModel> addressesList = snapshot.data!;
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                          child: ListView.separated(
                              itemBuilder: (_, index) {
                                final AddressModel address = addressesList[index];
                                return TSingleAddress(
                                    address: address,
                                    onTap: () async {
                                      await selectAddress(address);
                                      Get.back();
                                    }
                                );
                              },
                              separatorBuilder: (_, __) => const SizedBox(height: 8,),
                              itemCount: addressesList.length
                          ),
                        ),
                      );
                    }
                  },
              ),
               const SizedBox(height: 40,),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                  child: ElevatedButton(onPressed: () => Get.to(() => const AddNewAddressView()), child: const Text("Add new address")),
                ),
              ),
            ],
          ),
        ),
    );
  }
  
  void resetFormFields(){
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    autoValidateMode.value = AutovalidateMode.disabled;
    addressFormKey.currentState?.reset();
  }

  @override
  void dispose() {
    name.dispose();
    phoneNumber.dispose();
    street.dispose();
    postalCode.dispose();
    city.dispose();
    state.dispose();
    country.dispose();
    super.dispose();
  }
}