import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/featrues/on_boarding/presentation/views_model/on_boarding_states.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates>
{
  OnBoardingCubit():super(OnBoardingInitialState());

  int? currentPageIndex = 0;
  final pageController = PageController();
  void updatingPageSwappingIndex(index) {
    currentPageIndex = index;
    emit(OnBoardingSwappingUpdateState());
  }
  void dotNavigationClicked(index) {
    currentPageIndex = index;
    pageController.jumpToPage(index);
    emit(OnBoardingDotNavigationIndexUpdateState());
  }

  void nextPage()
  {
    if(currentPageIndex == 2)
      {

      }
    else
      {
        int page = currentPageIndex!+1;
        pageController.jumpToPage(page);
        emit(OnBoardingNextPageState());
      }
  }

  void skipPage()
  {
    if(currentPageIndex !=2)
      {
        currentPageIndex = 2;
        pageController.jumpToPage(2);
        emit(OnBoardingSkipPageState());
      }
  }
}