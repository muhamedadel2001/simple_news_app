import 'package:flutter/material.dart';
import 'package:newsapp/data/remote/response/general_response/general_response.dart';
import 'package:newsapp/presentation/widgets/default_network_image.dart';
import 'package:sizer/sizer.dart';
import '../../core/screens.dart' as screens;


class GeneralItem extends StatelessWidget {
  const GeneralItem({Key? key, required this.generalModel}) : super(key: key);
  final GeneralArticles generalModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, screens.generalWeb,
          arguments: generalModel),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
        decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20.sp),
        ),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          //mainAxisAlignment: MainAxisAlignment.center,
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
                      generalModel.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  //SizedBox(height: 3.h,),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(top: 1.2.h),
                      child: Text(
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                        generalModel.description,
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
                  imageUrl: generalModel.urlToImage,
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
