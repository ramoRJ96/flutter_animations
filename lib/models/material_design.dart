import 'package:flutter/material.dart';
import 'package:flutter_animations/models/data.dart';

class MyDivider extends Divider {
  const MyDivider({Key? key}): super(key: key,
    color: Colors.blue,
    thickness: 1
  );
}

class MyScaffold extends Scaffold {

  final String title;
  final Widget destination;

  MyScaffold({Key? key,  required this.title, required this.destination }): super(key: key, 
    appBar: AppBar(title: Text(title)),
    body: destination
  );

}

class EmptyWidget extends Center {
  EmptyWidget({Key? key}) : super( key: key,
    child: Image.asset(Data().flutter)
  );
}
