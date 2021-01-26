import 'package:an_ordinary_form/model/tree.dart';
import 'package:an_ordinary_form/tree_nav.dart';
import 'package:flutter/material.dart';

const letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

class FormAppBody extends StatefulWidget {
  @override
  _FormAppBodyState createState() => _FormAppBodyState();
}

class _FormAppBodyState extends State<FormAppBody> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Material(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: TreeNav(
                  onSelected: (char) => setState(() => text += char),
                  tree: Tree.fromList(letters.split("")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  "Please Enter Your Name: $text",
                  textAlign: TextAlign.start,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () => setState(() => text += ' '),
              child: Icon(Icons.space_bar),
            ),
            SizedBox(width: 12),
            FloatingActionButton(
              onPressed: () => setState(() => text = ''),
              child: Icon(Icons.backspace),
            ),
          ],
        ),
      ),
    );
  }
}
