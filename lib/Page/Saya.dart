import 'package:flutter/material.dart';

class SayaPage extends StatelessWidget {
  const SayaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              color: Color(0xFF70986c),
            ),
          ),),
        SliverList(
            delegate: SliverChildListDelegate([
              Text("Nama"),
              Text("+6281234567891"),
            ]),),
      ],),
  );}
}