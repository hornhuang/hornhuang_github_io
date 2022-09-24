import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/common/animated/animated_scale.dart';

import '../styles.dart';

import 'package:flutter/cupertino.dart';

class EnlargeWidget extends StatefulWidget {
  EnlargeWidget(this.child, { Key? key, required this.height, this.scaleOnHover = true, this.multiple = 1.15})
      : super(key: key);
  final Widget child;
  final double height;
  final double multiple; // 缩放倍数
  final bool scaleOnHover;
  final ValueNotifier<bool> _isMouseOverNotifier = ValueNotifier(false);

  @override
  _EnlargeWidgetState createState() => _EnlargeWidgetState();
}

class _EnlargeWidgetState extends State<EnlargeWidget> {
  GlobalKey anchorKey = GlobalKey();

  PopupMenuButton _popMenu() {
    return PopupMenuButton(
      itemBuilder: (context) => _getPopupMenu(context),
      onSelected: (value) {
        _selectValueChange(value);
      },
      onCanceled: () {
        setState(() {

        });
      },
    );
  }

  _selectValueChange(String value) {
    setState(() {});
  }

  _showMenu(BuildContext context) {
    RenderObject? renderBox =  anchorKey.currentContext!.findRenderObject();
    var offset = (renderBox as RenderBox).localToGlobal(Offset(0.0, renderBox.size.height));
    final RelativeRect position = RelativeRect.fromLTRB(
        offset.dx,//取点击位置坐弹出x坐标
        offset.dy,//取text高度做弹出y坐标（这样弹出就不会遮挡文本）
        offset.dx,
        offset.dy);
    var pop = _popMenu();
    showMenu(
      context: context,
      items: pop.itemBuilder(context),
      position: position,//弹出框位置
    ).then((newValue) {
      if (!mounted) return null;
      if (newValue == null) {
        if (pop.onCanceled != null) {
          pop.onCanceled!();
        }
        return null;
      }
      if (pop.onSelected != null) pop.onSelected!(newValue);
    });
  }

  _getPopupMenu(BuildContext context) {
    return <PopupMenuEntry>[
      PopupMenuItem(
        value: "复制",
        child: Text("复制"),
      ),
      PopupMenuItem(
        value: "收藏",
        child: Text("收藏"),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget._isMouseOverNotifier,
      builder: (_, bool isMouseOver, __) {
        double scale = isMouseOver ? widget.multiple : 1;
        return AnimatedScale(
          begin: 1,
          end: scale,
          duration: Times.fast,
          curve: Curves.easeOut,
          child: MouseRegion(
            onEnter: (_) {
              widget._isMouseOverNotifier.value = true && widget.scaleOnHover;
              // _showMenu(context);
            },
            onExit: (_) => widget._isMouseOverNotifier.value = false,
            child: widget.child,
          ),
        );
      },
    );
  }
}