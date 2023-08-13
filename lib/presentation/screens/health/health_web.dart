import 'package:flutter/material.dart';
import 'package:newsapp/business_logic/app_cubit.dart';
import 'package:newsapp/data/remote/response/health_response/health_response.dart';
import 'package:newsapp/presentation/widgets/default_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HealthWeb extends StatefulWidget {
  final HealthArticles healthModel;
  const HealthWeb({Key? key, required this.healthModel}) : super(key: key);

  @override
  State<HealthWeb> createState() => _HealthWebState();
}

class _HealthWebState extends State<HealthWeb> {
  late WebViewController controller;
  @override
  void initState() {
    controller=WebViewController()..loadRequest(Uri.parse(widget.healthModel.url));
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
