import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/common/base/base_stateful_widget.dart';
import 'package:hornhuang_github_io/common/bmob/bmob_api.dart';
import 'package:hornhuang_github_io/common/route/app_link.dart';
import 'package:hornhuang_github_io/utils/app_util.dart';
import 'package:hornhuang_github_io/views/index/view/left_panel.dart';
import 'package:hornhuang_github_io/views/index/viewmodel/index_view_model.dart';
import 'package:hornhuang_github_io/widgets/enlarge_widget.dart';
import 'package:hornhuang_github_io/widgets/top_nav_bar.dart';
import 'package:universal_html/html.dart' as html;

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
        backgroundColor: Theme.of(context).accentColor,
        leading: Text(''),
        elevation: 10,
        title: Text('Welcome!'),
        actions: <Widget>[TopNavigationBar.normalPopMenu(context)],
      );
    } else {
      return TopNavigationBar(preferredSize: AppBar().preferredSize);
    }
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: AppUtil.ApplicationFrameHeight(context)/3*2,),
          Container(
            height: AppUtil.ApplicationFrameHeight(context),
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: LeftPanel(
                        courses: viewModel.course,
                        dynamics: viewModel.dynamics,
                      )),
                  // Container(
                  //   width: 256,
                  //   child: RightPanel(messages: viewModel.messages,),
                  // ),
                ],
              ))
        ],
      ),
    );
  }

  Widget _buildFloatingWidget() {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(8),
        height: 72,
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "给我留言",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8,),
            Text(
              "想看什么? 点这里来 GitHub 给我留言～",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 8,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onTap: () {
        html.window.open("https://github.com/hornhuang/hornhuang.github.io/issues/new", 'new tab');
      },
    );
  }

  Widget _buildEnlargeWidget(Widget child) {
    GlobalKey anchorKey = GlobalKey();
    return EnlargeWidget(child, key: anchorKey, height: 50,  scaleOnHover: true);
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
                _buildBody(),
              ],
            ),
          floatingActionButton: _buildEnlargeWidget(
              _buildFloatingWidget()
          ),
        );
      },
    );
  }
}
