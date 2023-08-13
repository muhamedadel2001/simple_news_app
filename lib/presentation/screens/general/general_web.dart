import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../business_logic/app_cubit.dart';
import '../../../data/remote/response/general_response/general_response.dart';
import '../../widgets/default_appbar.dart';

class GeneralWebView extends StatefulWidget {
  final GeneralArticles generalModel;
  const GeneralWebView({
    Key? key,
    required this.generalModel,
  }) : super(key: key);

  @override
  State<GeneralWebView> createState() => _GeneralWebViewState();
}

class _GeneralWebViewState extends State<GeneralWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..loadRequest(
          Uri.parse(widget.generalModel.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: AppCubit.get(context).title[AppCubit.get(context).currIndex]),
      body: WebViewWidget(controller: controller),
    );
  }
}
