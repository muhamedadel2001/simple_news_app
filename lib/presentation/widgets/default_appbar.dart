import 'package:flutter/material.dart';
import 'package:newsapp/presentation/style/colors.dart';
import 'package:sizer/sizer.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(6.h);
  final String title;
  const DefaultAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,style:  TextStyle(color: Colors.white,fontSize: 20.sp),),
      backgroundColor: skyBlue,
      centerTitle: true,
      elevation: 4,

    );
  }
}
