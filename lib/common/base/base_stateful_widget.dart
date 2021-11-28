import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'base_view_model.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;

  final T model;
  final Widget child;
  final Function(T) onModelReady;

  BaseView(this.model, this.builder, this.child, this.onModelReady, {Key? key})
      : super(key: key);


  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  late T model;

  void initState() {
    model = widget.model;
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }


  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
      create: (BuildContext context) {
        return model;
      },
    );
  }
}