import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/common/base/base_stateful_widget.dart';
import 'package:hornhuang_github_io/common/bmob/bmob_api.dart';
import 'package:hornhuang_github_io/common/route/app_link.dart';
import 'package:hornhuang_github_io/views/index/view/left_panel.dart';
import 'package:hornhuang_github_io/views/index/view/right_panel.dart';
import 'package:hornhuang_github_io/views/index/viewmodel/index_view_model.dart';
import 'package:provider/provider.dart';

class IndexPage extends StatefulWidget {
  static final String Route = "index";
  AppLink? link;

  IndexPage({Key? key, this.link}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return BaseStatefulWidget<IndexViewModel>(
      model: IndexViewModel(api: Provider.of(context) ?? BmobApi()),
      onModelReady: (model) {},
      builder: (context, model, child) {
        return Scaffold(
          body: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: LeftPanel()
              ),
              Expanded(
                  child: Container(
                    width: 512,
                    child: RightPanel(),
                  )
              ),
            ],
          ),
        );
      },
    );
  }
}
