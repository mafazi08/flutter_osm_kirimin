import 'package:flutter/material.dart';

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
            // Set the pinned property to true
            pinned: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.person, size: 60, color: Colors.white,),
                Column(
                  children: [
                    // Set the style property of the Text widget
                    const Text(
                      "Nama",
                      style: TextStyle(fontSize: 20, color: Colors.white), // Set the font size to 20
                    ),
                    // Set the style property of the Text widget
                    const Text(
                      "0123456789", // Replace with the desired handphone number
                      style: TextStyle(fontSize: 20, color : Colors.white), // Set the font size to 20
                    ),
                  ],
                ),
              ],
            ),
            backgroundColor: const Color(0xFF70986C),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ListTile(
                    leading: Icon(Icons.list),
                    title: Text("Daftar Ekspedisi"),
                    onTap: () {
                      // Handle button press
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.delete),
                    title: Text("Hapus Riwayat Cek Resi"),
                    onTap: () {
                      // Handle button press
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.share),
                    title: Text("Bagikan"),
                    onTap: () {
                      // Handle button press
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.mail),
                    title: Text("Kontak Kami"),
                    onTap: () {
                      // Handle button press
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Handle button press
                      },
                      icon: Icon(Icons.exit_to_app),
                      label: Text("Keluar", style: TextStyle(fontSize: 20, color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF70986C),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),);
  }
}
