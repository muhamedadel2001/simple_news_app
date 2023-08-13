import 'package:flutter/material.dart';
import 'package:newsapp/data/remote/response/health_response/health_response.dart';
import 'package:sizer/sizer.dart';
import '../widgets/default_network_image.dart';
import '../../core/screens.dart' as screens;

class HealthItem extends StatelessWidget {
  const HealthItem({Key? key, required this.healthModel}) : super(key: key);
  final HealthArticles healthModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, screens.healthWeb,
          arguments: healthModel),
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
                      healthModel.title,
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
                        healthModel.description,
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
                  imageUrl: healthModel.urlToImage,
                  height: 20.h,
                  boxFit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
