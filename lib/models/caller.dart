import 'package:flutter/cupertino.dart';
import 'package:shopping/pages/home.dart';

class Caller extends StatelessWidget {
  String title, value;
  Caller({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
