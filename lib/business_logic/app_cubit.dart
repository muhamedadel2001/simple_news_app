import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/data/remote/request/general_request.dart';
import 'package:newsapp/data/remote/request/healthe_request.dart';
import 'package:newsapp/data/remote/response/general_response/general_response.dart';
import 'package:newsapp/data/remote/response/health_response/health_response.dart';
import 'package:newsapp/presentation/screens/general/general_screen.dart';
import 'package:newsapp/presentation/screens/health/health_screen.dart';
import 'package:newsapp/presentation/screens/sport/sport_screen.dart';
import 'package:newsapp/presentation/screens/technology/technology_screen.dart';

import '../data/remote/request/sport_request.dart';
import '../data/remote/request/technology_request.dart';
import '../data/remote/response/sport_response/sport_response.dart';
import '../data/remote/response/technology_response/technology_response.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);
  AppCubit() : super(AppInitial());
  HealthResponse healthResponse = HealthResponse();
  GeneralResponse generalResponse = GeneralResponse();
  TechnologyResponse technologyResponse = TechnologyResponse();
  SportResponse sportResponse = SportResponse();
  int currIndex = 0;
  List<Widget> screens = [
    const GeneralScreen(),
    const TechnologyScreen(),
    const HealthScreen(),
    const SportScreen(),
  ];
  List<String> title = [
    'General',
    'Technology',
    'Health',
    'Sport',
  ];
  void changeBottomNavBar(int num) {
    currIndex = num;
    emit(AppChangeBottomNavBar());
  }

  void getHealth() {
    emit(AppLoadingHealthState());
    HealthRequest()
        .healthRequest(apiKey: '9fc2239f11f1455eb9f06f53df37be50')
        .then((value) {
      healthResponse = value;
      emit(AppSuccessHealthState());
    }).catchError((error) {
      emit(AppErrorHealthState());
    });
  }

  void getGeneral() {
    emit(AppLoadingGeneralState());
    GeneralRequest()
        .generalRequest(apiKey: '9fc2239f11f1455eb9f06f53df37be50')
        .then((value) {
      generalResponse = value;
      emit(AppSuccessGeneralState());
    }).catchError((error) {
      emit(AppErrorGeneralState());
    });
  }

  void getTechnology() {
    emit(AppLoadingTechnologyState());
    TechnologyRequest()
        .technologyRequest(apiKey: '9fc2239f11f1455eb9f06f53df37be50')
        .then((value) {
      technologyResponse = value;
      emit(AppSuccessTechnologyState());
    }).catchError((error) {
      emit(AppErrorTechnologyState());
    });
  }

  void getSport() {
    emit(AppLoadingSportState());
    SportRequest()
        .sportRequest(apiKey: '9fc2239f11f1455eb9f06f53df37be50')
        .then((value) {
      sportResponse = value;
      emit(AppSuccessSportState());
    }).catchError((error) {
      emit(AppErrorSportState());
    });
  }
}
