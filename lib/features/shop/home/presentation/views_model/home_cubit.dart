import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/shop/home/presentation/views_model/home_states.dart';

class HomeCubit extends Cubit<HomeStates>
{
  HomeCubit():super(HomeInitialState());
  int currentImageIndex =0;
  void updateImageIndex(int index)
  {
    currentImageIndex = index;
    emit(UpdateRoundedImageIndexState());
  }
}