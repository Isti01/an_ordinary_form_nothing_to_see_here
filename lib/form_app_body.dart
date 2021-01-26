import 'package:an_ordinary_form/constants.dart';
import 'package:an_ordinary_form/model/tree.dart';
import 'package:an_ordinary_form/tree_nav.dart';
import 'package:flutter/material.dart';

class FormAppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: TreeNav<String>(
          onSelected: print,
          tree: Tree.fromList(letters.split("")),
        ),
      ),
    );
  }
}
