import 'package:simplife/librairies.dart';

class CustomReorderableListView extends StatefulWidget {
  final List<Widget> children;
  final bool reverse;
  final ScrollController? scrollController;
  final bool primary;
  final ScrollPhysics? physics;
  final EdgeInsets? padding;
  final bool shrinkWrap;

  CustomReorderableListView({
    required this.children,
    this.reverse = false,
    this.scrollController,
    this.primary = false,
    this.physics,
    this.padding = const EdgeInsets.symmetric(vertical: 8.0),
    this.shrinkWrap = false,
  });

  @override
  _CustomReorderableListViewState createState() => _CustomReorderableListViewState();
}

class _CustomReorderableListViewState extends State<CustomReorderableListView> {
  late List<Widget> _children;

  @override
  void initState() {
    super.initState();
    _children = List.from(widget.children);
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final item = _children.removeAt(oldIndex);
      _children.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      buildDefaultDragHandles: false,
      onReorder: _onReorder,
      reverse: widget.reverse,
      scrollController: widget.scrollController,
      primary: widget.primary,
      physics: widget.physics,
      padding: widget.padding,
      shrinkWrap: widget.shrinkWrap,
      children: _children.asMap().entries.map((entry) {
        int idx = entry.key;
        Widget child = entry.value;
        return ReorderableDragStartListener(
          key: ValueKey(idx),
          index: idx,
          child: child,
        );
      }).toList(),
    );
  }
}
