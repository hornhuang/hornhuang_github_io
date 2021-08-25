import 'package:flutter/material.dart';

class TabItem extends StatefulWidget {
  String title;

  Icon? icon;
  bool isSelected;
  GestureTapCallback? ontap;
  int? flex;

  TabItem({this.title = "undefind", Key? key, this.icon = null, this.isSelected = false, this.ontap = null, this.flex = 1}) : super(key: key);

  @override
  _TabItemState createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {

  Widget _buildContent() {
    return Container(
      padding: EdgeInsets.all(8),
      child: Center(
        child: Text(
          widget.title,
          style: TextStyle(
              fontSize: widget.isSelected ? 20 : 16,
              fontWeight: widget.isSelected ? FontWeight.bold : FontWeight.normal
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
          child: _buildContent(),
          onTap: widget.ontap,
        )
    );
  }
}
