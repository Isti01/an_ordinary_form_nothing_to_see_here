import 'package:flutter/material.dart';

import 'input_card.dart';
import 'model/tree.dart';

class TreeNav<T extends Comparable> extends StatefulWidget {
  final Tree<T> tree;
  final void Function(T value) onSelected;

  const TreeNav({Key key, this.tree, this.onSelected}) : super(key: key);

  @override
  _TreeNavState<T> createState() => _TreeNavState<T>();
}

class _TreeNavState<T extends Comparable> extends State<TreeNav<T>>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();

    if (!widget.tree.isLeaf) {
      final length = widget.tree.hasRight && widget.tree.hasLeft ? 2 : 1;
      _controller = TabController(length: length, vsync: this);
    }
  }

  List<Tab> get tabs => [
        if (widget.tree.hasLeft) Tab(child: Text(widget.tree.left.displayText)),
        if (widget.tree.hasRight)
          Tab(child: Text(widget.tree.right.displayText)),
      ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (widget.tree.isLeaf) {
      return Material(
        color: Colors.white,
        child: InputCard(
          text: widget.tree.displayText,
          onTap: () => widget.onSelected(widget.tree.value),
        ),
      );
    }
    final theme = Theme.of(context);
    return Column(
      children: [
        Material(
          color: theme.primaryColor,
          child: TabBar(
            controller: _controller,
            tabs: tabs,
            indicatorColor: theme.accentColor,
          ),
        ),
        Flexible(
          child: TabBarView(
            controller: _controller,
            children: [
              if (widget.tree.hasLeft)
                TreeNav(
                  tree: widget.tree.left,
                  onSelected: widget.onSelected,
                ),
              if (widget.tree.hasRight)
                TreeNav(
                  tree: widget.tree.right,
                  onSelected: widget.onSelected,
                ),
            ],
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
