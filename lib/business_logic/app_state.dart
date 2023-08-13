part of 'app_cubit.dart';

abstract class AppState {}

class AppInitial extends AppState {}

class AppChangeBottomNavBar extends AppState {}

class AppLoadingHealthState extends AppState {}

class AppSuccessHealthState extends AppState {}

class AppErrorHealthState extends AppState {}

class AppLoadingGeneralState extends AppState {}

class AppSuccessGeneralState extends AppState {}

class AppErrorGeneralState extends AppState {}

class AppLoadingTechnologyState extends AppState {}

class AppSuccessTechnologyState extends AppState {}

class AppErrorTechnologyState extends AppState {}

class AppLoadingSportState extends AppState {}

class AppSuccessSportState extends AppState {}

class AppErrorSportState extends AppState {}
