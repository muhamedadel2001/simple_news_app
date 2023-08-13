import 'package:flutter/material.dart';
import 'package:newsapp/data/remote/response/sport_response/sport_response.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../business_logic/app_cubit.dart';
import '../../widgets/default_appbar.dart';

class SportWeb extends StatefulWidget {
  const SportWeb({Key? key, required this.sportModel}) : super(key: key);
  final SportArticles sportModel;

  @override
  State<SportWeb> createState() => _SportWebState();
}

class _SportWebState extends State<SportWeb> {
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..loadRequest(Uri.parse(widget.sportModel.url));
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
