import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/common/base/base_stateful_widget.dart';
import 'package:hornhuang_github_io/common/bmob/bmob_api.dart';
import 'package:hornhuang_github_io/common/route/app_link.dart';
import 'package:hornhuang_github_io/utils/app_util.dart';
import 'package:hornhuang_github_io/views/index/view/left_panel.dart';
import 'package:hornhuang_github_io/views/index/view/right_panel.dart';
import 'package:hornhuang_github_io/views/index/viewmodel/index_view_model.dart';
import 'package:hornhuang_github_io/widgets/top_nav_bar.dart';

class IndexPage extends StatefulWidget {
  static final String Route = "index";
  AppLink? link;

  IndexPage({Key? key, this.link}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  IndexViewModel viewModel = IndexViewModel(api: BmobApi());

  Widget _buildBackground() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        AppUtil.getImageAssets("gif/home.gif"),
        fit: BoxFit.fill,
      ),
    );
  }

  PreferredSizeWidget? _attachAppBar() {
    bool isPhone = AppUtil.ApplicationFrameWidth(context) < 1000;
    if (isPhone) {
      return AppBar(
        backgroundColor: Colors.blueGrey,
        leading: Text(''),
        elevation: 10,
        title: Text(
          '天气不错哦',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: <Widget>[TopNavigationBar.normalPopMenu(context)],
      );
    } else {
      return TopNavigationBar(preferredSize: AppBar().preferredSize);
    }
  }

  List<Widget> _attachContent(bool isNarrow) {
    return [
      Expanded(
          flex: isNarrow ? 0 : 1,
          child: LeftPanel(
            courses: viewModel.course,
            dynamics: viewModel.dynamics,
          )),
      Expanded(
        flex: isNarrow ? 1 : 0,
        child: Container(
          width: 256,
          child: RightPanel(
            messages: viewModel.messages,
          ),
        ),
      ),
    ];
  }

  Widget _buildBody(bool isNarrow) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: (AppUtil.ApplicationFrameHeight(context) -
                    kBottomNavigationBarHeight) /
                3 *
                2,
          ),
          Container(
            height: kBottomNavigationBarHeight,
            padding: EdgeInsets.all(isNarrow ? 8 : 0),
            width: double.infinity,
            child: Image.asset(
              AppUtil.getImageAssets("gif/arrowhead.gif"),
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            height: isNarrow ? 1080 : AppUtil.ApplicationFrameHeight(context) -
                kBottomNavigationBarHeight,
            padding: EdgeInsets.all(16),
            child: isNarrow
                ? Column(
                    children: _attachContent(isNarrow),
                  )
                : Row(
                    children: _attachContent(isNarrow),
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.fetchCourses();
    viewModel.fetchDynamics();
    viewModel.fetchMessages();
  }

  @override
  Widget build(BuildContext context) {
    return BaseStatefulWidget<IndexViewModel>(
      model: viewModel,
      onModelReady: (model) {},
      builder: (context, model, child) {
        return Scaffold(
          appBar: _attachAppBar(),
          body: Stack(
            children: [
              _buildBackground(),
              _buildBody(AppUtil.isNarrow(context)),
            ],
          ),
        );
      },
    );
  }
}
