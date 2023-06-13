import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SayaPage extends StatefulWidget {
  const SayaPage({super.key});

  @override
  State<SayaPage> createState() => _SayaPageState();
}

class _SayaPageState extends State<SayaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
              leading: const Icon(Icons.add_a_photo_rounded),
              title: const Text("Nama")),
          SliverToBoxAdapter(
            child: Container(
              child:
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(children: [
                    Icon(Icons.list), Text("Daftar Ekspedisi"),],),
                  Row(children: [
                    Icon(Icons.delete), Text("Hapus Riwayat Cek Resi"),],),
                  Row(children: [
                    Icon(Icons.share), Text("Bagikan"),],),
                  Row(children: [
                    Icon(Icons.mail), Text("Kontak Kami"),],),
                  Row(children: [
                    Icon(Icons.exit_to_app), Text("Keluar"),],),
                ],),
            ),
          ),],
      ),);
  }
}
