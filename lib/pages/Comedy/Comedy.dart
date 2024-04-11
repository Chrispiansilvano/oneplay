import 'package:flutter/material.dart';
import 'package:oneplay/pages/Comedy/ComedyList.dart';

class Comedy extends StatefulWidget {
  const Comedy({super.key});

  @override
  State<Comedy> createState() => _ComedyState();
}

class _ComedyState extends State<Comedy> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          height: MediaQuery.of(context).size.height,
          child: const ComedyList(tag: "comedy")),
    );
  }
}
