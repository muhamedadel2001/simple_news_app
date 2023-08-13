import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/app_cubit.dart';
import '../../views/general_item.dart';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({Key? key}) : super(key: key);

  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
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
                  GeneralItem(generalModel: cubit.generalResponse.articles[index]),
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
              itemCount: cubit.generalResponse.articles.length),
        );
      },
    );
  }
}
