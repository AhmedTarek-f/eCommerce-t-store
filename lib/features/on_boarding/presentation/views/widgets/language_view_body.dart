import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:t_store/common_widgets/images/t_rounded_image.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:t_store/features/on_boarding/presentation/views_model/language_controller.dart';

class LanguageViewBody extends StatelessWidget {
  const LanguageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final LanguageController controller = Get.put(LanguageController());
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width*0.0611,
        vertical: MediaQuery.sizeOf(context).height*0.028,
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height*0.2,),
          Lottie.asset(
              TImages.languageAnimation,
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height*0.2,
              fit: BoxFit.contain,
          ),
          const SizedBox(height: 32,),
          Center(child: Text("Select the language", style: Theme.of(context).textTheme.headlineSmall,)),
          const SizedBox(height: 16,),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
              child: Obx(
                ()=> ElevatedButton(
                    onPressed: (){
                      if(controller.language.value != "en") {
                        controller.selectLanguage("en");
                      }
                    },
                  style: ElevatedButton.styleFrom(
                      backgroundColor:controller.language.value == "en"? TColors.primaryColor : TColors.darkerGrey,
                    side: const BorderSide(color: Colors.transparent),

                  ),
                    child: const Text("English"),
                ),
              ),
          ),
          const SizedBox(height: 8,),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Obx(
            () => ElevatedButton(
                onPressed: (){
                  if(controller.language.value != "ar") {
                    controller.selectLanguage("ar");
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor:controller.language.value == "ar"? TColors.primaryColor : TColors.darkerGrey,
                  side: const BorderSide(color: Colors.transparent),
                ),
                child: const Text("Arabic"),
              ),
            ),
          ),
          const  Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment:MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              ElevatedButton(
                onPressed: (){
                  Get.off(()=> const OnBoardingView());
                },
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),backgroundColor: isDarkMode?TColors.primaryColor:Colors.black,
                ),
                child: const Icon(Icons.arrow_forward_ios_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
