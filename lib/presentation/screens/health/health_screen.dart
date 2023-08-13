import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/app_cubit.dart';
import '../../views/health_item.dart';

class HealthScreen extends StatefulWidget {
  const HealthScreen({Key? key}) : super(key: key);

  @override
  State<HealthScreen> createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  late AppCubit cubit;

  @override
  void didChangeDependencies() {
    cubit = AppCubit.get(context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(8.sp),
          child: ListView.separated(
              itemBuilder: (context, index) =>
                  HealthItem(healthModel: cubit.healthResponse.articles[index]),
              separatorBuilder: (context, index) =>
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                            height: 1.h,
                            color: Colors.transparent,
                          ))
                    ],
                  ),
              itemCount: cubit.healthResponse.articles.length),
        );
      },
    );
  }
}
