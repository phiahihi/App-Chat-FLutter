import 'dart:ui';

import 'package:flutter/material.dart';

class boxChat extends StatelessWidget {
  boxChat({Key? key,required this.text, required this.isMe}) : super(key: key);
  bool isMe;
  String text;

  @override
  Widget build(BuildContext context) {
    return isMe
        ? Align(
      alignment: Alignment.topRight,
          child: Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(10),
            // constraints: BoxConstraints(
            //   maxWidth: MediaQuery.of(context).size.width * 80,
            // ),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color.fromRGBO(246, 105, 105, 1)),
            child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 18),),
          ))
        : Align(
        alignment: Alignment.topLeft,
        child: Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(10),
          // constraints: BoxConstraints(
          //   maxWidth: MediaQuery.of(context).size.width * 80,
          // ),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.white),
          child: Text(text, style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 18),),
        ));
  }
}
