import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/pages/get_started_screen.dart';
import 'package:recipe_app/pages/home_screen.dart';

import '../../pages/setting/setting_screen.dart';


part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);

  int selectedIndex=0;
  List screens=
  [
    HomeScreen(),
    GetStartedScreen(),
    SettingScreen(),


  ];

  bottomChange(int index){
    selectedIndex=index;
    print(index);
    emit(BottomChange());

  }

}


