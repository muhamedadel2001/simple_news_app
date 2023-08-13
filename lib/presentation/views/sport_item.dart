import 'package:flutter/material.dart';
import 'package:newsapp/data/remote/response/sport_response/sport_response.dart';
import 'package:sizer/sizer.dart';
import '../../core/screens.dart' as screens;

import '../widgets/default_network_image.dart';

class SportItem extends StatelessWidget {
  const SportItem({Key? key, required this.sportModel}) : super(key: key);
  final SportArticles sportModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, screens.sportWeb,
          arguments: sportModel),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
        decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20.sp),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      sportModel.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(top: 1.2.h),
                      child: Text(
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                        sportModel.description,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.sp),
                child: DefaultNetworkImage(
                  imageUrl: sportModel.urlToImage,
                  height: 20.h,
                  boxFit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );;
  }
}
