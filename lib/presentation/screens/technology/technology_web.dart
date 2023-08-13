import 'package:flutter/material.dart';
import 'package:newsapp/data/remote/response/technology_response/technology_response.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../business_logic/app_cubit.dart';
import '../../widgets/default_appbar.dart';

class TechnologyWeb extends StatefulWidget {
  final TechnologyArticles technologyModel;
  const TechnologyWeb({Key? key, required this.technologyModel}) : super(key: key);

  @override
  State<TechnologyWeb> createState() => _TechnologyWebState();
}

class _TechnologyWebState extends State<TechnologyWeb> {
 late WebViewController controller;
 @override
  void initState() {
   controller=WebViewController()..loadRequest(Uri.parse(widget.technologyModel.url));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
          title: AppCubit.get(context).title[AppCubit.get(context).currIndex]),
      body: WebViewWidget(controller: controller),
    );
  }
}
