import 'package:flutter/material.dart';

import 'model/tree.dart';

class TreeNav extends StatefulWidget {
  final Tree<String> tree;
  final void Function(String value) onSelected;

  const TreeNav({Key key, this.tree, this.onSelected}) : super(key: key);

  @override
  _TreeNavState createState() => _TreeNavState();
}

class _TreeNavState extends State<TreeNav>
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
        child: InkWell(
          onTap: () => widget.onSelected(widget.tree.value),
          child: Center(
            child: Text(widget.tree.displayText),
          ),
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
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
