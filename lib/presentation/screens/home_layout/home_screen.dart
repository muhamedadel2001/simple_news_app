import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/business_logic/app_cubit.dart';
import 'package:newsapp/presentation/widgets/default_appbar.dart';
import 'package:sizer/sizer.dart';

import '../../style/colors.dart';

class HomeLayOut extends StatefulWidget {
  const HomeLayOut({Key? key}) : super(key: key);

  @override
  State<HomeLayOut> createState() => _HomeLayOutState();
}

class _HomeLayOutState extends State<HomeLayOut> {
  late AppCubit cubit;

  @override
  void didChangeDependencies() {
    cubit = AppCubit.get(context)
      ..getGeneral()
      ..getTechnology()
      ..getHealth()
      ..getSport();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: DefaultAppBar(title: cubit.title[cubit.currIndex]),
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                    colors: [
                      darkSkyBlue,
                      lightSkyBlue,
                      darkSkyBlue,
                    ],
                  ),
                ),
              ),
              BlocBuilder<AppCubit, AppState>(
                builder: (BuildContext context, state) {
                  if (state is AppLoadingHealthState ||
                      state is AppLoadingGeneralState ||
                      state is AppLoadingTechnologyState ||
                      state is AppLoadingSportState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  } else if (state is AppSuccessHealthState ||
                      state is AppSuccessGeneralState ||
                      state is AppSuccessTechnologyState ||
                      state is AppSuccessSportState ||
                      state is AppChangeBottomNavBar) {
                    return cubit.screens[cubit.currIndex];
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error,
                            size: 75.sp,
                            color: Colors.red,
                          ),
                          Text(
                            'Error Occurred',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    );
                  }
                },
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.blueGrey,
              elevation: 0,
              currentIndex: cubit.currIndex,
              onTap: (index) => cubit.changeBottomNavBar(index),
              items: [
                BottomNavigationBarItem(
                    icon: const Icon(Icons.all_inbox),
                    label: cubit.title[0],
                    backgroundColor: skyBlue),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.tv_rounded),
                    label: cubit.title[1],
                    backgroundColor: skyBlue),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.health_and_safety_rounded),
                    label: cubit.title[2],
                    backgroundColor: skyBlue),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.sports_baseball),
                    label: cubit.title[3],
                    backgroundColor: skyBlue),
              ]),
        );
      },
    );
  }
}
