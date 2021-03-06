import 'dart:math';

import 'package:flutter/material.dart';

class AnimationListDemo extends StatefulWidget {
  const AnimationListDemo({Key? key}) : super(key: key);

  @override
  _AnimationListDemoState createState() => _AnimationListDemoState();
}

class _AnimationListDemoState extends State<AnimationListDemo> {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();
  List<String> items = ['Banane', 'Poire', 'Pêche', 'Abricot'];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller, 
          decoration: InputDecoration(
            hintText: 'Ajouter un fruit',
          ),
          onSubmitted: (fruit) {
            _addItem(fruit);
            controller.clear();
          },
        ),
        Expanded(
            child: AnimatedList(
                key: _key,
                initialItemCount: items.length,
                itemBuilder: (context, index, animation) {
                  return slideTile(items[index], index, animation);
                })),
      ],
    );
  }

  Widget slideTile(String name, int index, Animation<double> animation) {
    return SlideTransition(
      position: animation
          .drive(Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))),
      child: ListTile(
        title: Text(name),
        leading: Text(index.toString()),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            _removeItem(index);
          },
        ),
      ),
    );
  }

  _addItem(String name) {
    int index = items.isEmpty ? 0 : Random().nextInt(items.length);
    items.insert(index, name);
    _key.currentState!.insertItem(index);
  }

  _removeItem(int index) {
    String name = items[index];
    items.removeAt(index);
    _key.currentState!.removeItem(index, (context, animation) {
      return slideTile(name, index, animation); 
    });
  }
}
