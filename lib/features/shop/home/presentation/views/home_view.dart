import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/featrues/shop/home/presentation/views/widgets/home_view_body.dart';
import 'package:t_store/featrues/shop/home/presentation/views_model/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
      child: const HomeViewBody()),
    );
  }
}
