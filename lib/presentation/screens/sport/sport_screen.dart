import 'package:flutter/material.dart';
import 'package:newsapp/business_logic/app_cubit.dart';
import 'package:newsapp/presentation/views/sport_item.dart';
import 'package:sizer/sizer.dart';

class SportScreen extends StatefulWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  State<SportScreen> createState() => _SportScreenState();
}

class _SportScreenState extends State<SportScreen> {
  late AppCubit cubit;
  @override
  void didChangeDependencies() {
    cubit = AppCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) =>
            SportItem(sportModel: cubit.sportResponse.articles[index]),
        separatorBuilder: (context, index) => Row(
              children: [
                Expanded(
                    child: Divider(
                  height: 1.h,
                  color: Colors.transparent,
                ))
              ],
            ),
        itemCount: cubit.sportResponse.articles.length);
  }
}
