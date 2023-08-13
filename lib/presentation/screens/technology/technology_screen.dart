import 'package:flutter/material.dart';
import 'package:newsapp/presentation/views/technolgy_item.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/app_cubit.dart';

class TechnologyScreen extends StatefulWidget {
  const TechnologyScreen({Key? key}) : super(key: key);

  @override
  State<TechnologyScreen> createState() => _TechnologyScreenState();
}

class _TechnologyScreenState extends State<TechnologyScreen> {
  late AppCubit cubit;
  @override
  void didChangeDependencies() {
    cubit = AppCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => TechnologyItem(
            technologyModel: cubit.technologyResponse.articles[index]),
        separatorBuilder: (context, index) => Row(
              children: [
                Expanded(
                    child: Divider(
                  height: 1.h,
                  color: Colors.transparent,
                ))
              ],
            ),
        itemCount: cubit.technologyResponse.articles.length);
  }
}
