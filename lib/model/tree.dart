import 'package:an_ordinary_form/util/min_max.dart';
import 'package:flutter/material.dart';

/// Tree but only the leaves have values
class Tree<T extends Comparable> {
  final T value;
  final Tree<T> right, left;
  final String displayText;

  Tree({this.value, @required this.displayText, this.right, this.left});

  bool get hasLeft => left != null;

  bool get hasRight => right != null;

  bool get isLeaf => !hasLeft && !hasRight;

  factory Tree.fromList(List<T> list) {
    if (list.isEmpty) return null;
    if (list.length == 1) {
      return Tree(
        value: list.first,
        displayText: list.first.toString(),
      );
    }

    final center = list.length ~/ 2;
    final left = list.sublist(0, center);
    final right = list.sublist(center);

    return Tree(
      left: Tree.fromList(left),
      right: Tree.fromList(right),
      displayText: "${list.reduce(min)} - ${list.reduce(max)}",
    );
  }
}
