import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/features/personalization/my_address/presentation/views_model/address_controller.dart';

class AddNewAddressViewBody extends StatelessWidget {
  const AddNewAddressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final AddressController controller = AddressController.instance;
    return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: MediaQuery.sizeOf(context).width*0.0611,
            left: MediaQuery.sizeOf(context).width*0.0611,
            top: MediaQuery.sizeOf(context).height*0.0280,
            bottom: MediaQuery.sizeOf(context).height*0.0280,
          ),
          child:Obx(
            () {
              return Form(
                key: controller.addressFormKey,
                autovalidateMode: controller.autoValidateMode.value,
                child: Column(
                  children: [
                    TextFormField(
                      decoration:   InputDecoration(prefixIcon: const Icon(Iconsax.user_copy),
                          label: Text("Name".tr,),
                      ),
                      controller: controller.name,
                      validator: (value) {
                        if(value == null || value.isEmpty || value.trim() == ""){
                          return "Name is required.".tr;
                        }
                        else
                        {
                          return null;
                        }
                      },
                      onSaved: (value){
                        if(value!= null){
                          controller.name.text = value;
                        }
                      },
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(
                      decoration:  InputDecoration(prefixIcon: const Icon(Iconsax.mobile_copy),
                          label: Text("Phone Number".tr),
                      ),
                      controller: controller.phoneNumber,
                      validator: (value) {
                        if(value == null || value.isEmpty || value.trim() == ""){
                          return "Phone Number is required.".tr;
                        }
                        else
                        {
                          return null;
                        }
                      },
                      onSaved: (value){
                        if(value!= null){
                          controller.phoneNumber.text = value;
                        }
                      },
                    ),
                    const SizedBox(height: 16,),
                    Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                              decoration:  InputDecoration(prefixIcon: const Icon(Iconsax.building_4_copy),
                                  label: Text("Street".tr),
                              ),
                              controller: controller.street,
                              validator: (value) {
                                if(value == null || value.isEmpty || value.trim() == ""){
                                  return "Street is required.".tr;
                                }
                                else
                                {
                                  return null;
                                }
                              },
                              onSaved: (value){
                                if(value!= null){
                                  controller.street.text = value;
                                }
                              },
                            ),
                        ),
                        const SizedBox(width: 16,),
                        Expanded(
                            child: TextFormField(
                              decoration:  InputDecoration(prefixIcon: const Icon(Iconsax.code_copy),
                                  label: Text("PostalCode".tr),
                              ),
                              controller: controller.postalCode,
                              validator: (value) {
                                if(value == null || value.isEmpty || value.trim() == ""){
                                  return "PostalCode is required.".tr;
                                }
                                else
                                {
                                  return null;
                                }
                              },
                              onSaved: (value){
                                if(value!= null){
                                  controller.postalCode.text = value;
                                }
                              },
                            ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16,),
                    Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                              decoration:  InputDecoration(prefixIcon: const Icon(Iconsax.building_copy),
                                  label: Text("City".tr),
                              ),
                              controller: controller.city,
                              validator: (value) {
                                if(value == null || value.isEmpty || value.trim() == ""){
                                  return "City is required.".tr;
                                }
                                else
                                {
                                  return null;
                                }
                              },
                              onSaved: (value){
                                if(value!= null){
                                  controller.city.text = value;
                                }
                              },
                            ),
                        ),
                        const SizedBox(width: 16,),
                        Expanded(
                            child: TextFormField(
                              decoration:  InputDecoration(prefixIcon: const Icon(Iconsax.activity_copy),
                                  label: Text("State".tr),
                              ),
                              controller: controller.state,
                              validator: (value) {
                                if(value == null || value.isEmpty || value.trim() == ""){
                                  return "State is required.".tr;
                                }
                                else
                                {
                                  return null;
                                }
                              },
                              onSaved: (value){
                                if(value!= null){
                                  controller.state.text = value;
                                }
                              },
                            ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(
                      decoration: InputDecoration(prefixIcon: const Icon(Iconsax.global_copy),
                          label: Text("Country".tr),
                      ),
                      controller: controller.country,
                      validator: (value) {
                        if(value == null || value.isEmpty || value.trim() == ""){
                          return "Country is required.".tr;
                        }
                        else
                        {
                          return null;
                        }
                      },
                      onSaved: (value){
                        if(value!= null){
                          controller.country.text = value;
                        }
                      },
                    ),
                    const SizedBox(height: 24,),
                    SizedBox(
                        width:MediaQuery.sizeOf(context).width,
                        child: ElevatedButton(
                            onPressed: ()async{
                              await controller.addNewAddress();
                              },
                            child: Text("Save".tr),
                        ),
                    ),
                  ],
                ),
              );
            }
          ),
        ),
    );
  }
}
