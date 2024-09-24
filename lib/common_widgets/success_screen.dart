import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, this.onPressed});
  final String image;
  final String title;
  final String subTitle;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.sizeOf(context).height*0.1307,
            bottom: MediaQuery.sizeOf(context).height*0.0513,
            right: MediaQuery.sizeOf(context).width*0.1120,
            left: MediaQuery.sizeOf(context).width*0.1120,
          ),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: MediaQuery.sizeOf(context).width*0.6,
              ),
              const SizedBox(height: 32,),
              Text(title,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              const SizedBox(height: 16,),
              Text(subTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              const SizedBox(height: 32,),
      
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text("Continue"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
