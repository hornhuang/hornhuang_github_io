import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/widgets/index/function_entry_card.dart';

class RightPanel extends StatefulWidget {
  const RightPanel({Key? key}) : super(key: key);

  @override
  _RightPanelState createState() => _RightPanelState();
}

class _RightPanelState extends State<RightPanel> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FunctionEntryCard()
      ],
    );
  }
}
