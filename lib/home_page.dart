// lib/screens/home_page.dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Map<String, String>> newsItems = [
    {
      'title': 'Arsenal Puncaki\nKlasemen Liga\nInggris',
      'content': 'Arsenal berhasil mempertahankan posisi puncak klasemen Premier League setelah mengalahkan Crystal Palace 1-0 di Emirates Stadium.',
    },
    {
      'title': 'Arsenal Lolos\nPerempat Final\nCarabao Cup',
      'content': 'Arsenal melaju ke perempat final Carabao Cup usai mengalahkan Brighton 2-0. The Gunners akan menghadapi Crystal Palace di babak selanjutnya.',
    },
    {
      'title': 'Tiga Pemain\nKunci Arsenal\nSegera Pulih',
      'content': 'Arsenal akan mendapat tambahan kekuatan setelah jeda internasional November. Tiga pemain penting diprediksi kembali pulih dari cedera.',
    },
    {
      'title': 'Gabriel \nUpdate Cedera\nACL',
      'content': 'Gabriel memberikan update positif tentang pemulihannya dari cedera ACL. Striker Brasil ini menargetkan comeback di musim 2025/26',
    },
    {
      'title': 'Arsenal Rekrut\nDelapan Pemain\nBaru',
      'content': 'Arsenal menandatangani delapan pemain baru di bursa transfer musim panas. Salah satunya adalah bek Piero Hincapie yang sudah tampil perdana.',
    },
  ];
  // --- End of Dummy News Data ---

  // Navigation functions to add player page
  void _navigateToPlayer(BuildContext context) {
    Navigator.pushNamed(context, '/add_player');
  }

  void _navigateToJadwal(BuildContext context) {
    // Navigator.pushNamed(context, '/jadwal'); // Example route
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Match schedule navigation has not been implemented yet')),
    );
  }

  void _navigateToKlasemen(BuildContext context) {
    // Navigator.pushNamed(context, '/klasemen'); // Example route
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('League standings navigation has not been implemented yet')),
    );
  }

  void _navigateToMerchandise(BuildContext context) {
    // Navigator.pushNamed(context, '/merchandise'); // Example route
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Merchandise navigation has not been implemented yet')),
    );
  }

  void _navigateToSettings(BuildContext context) {
    // Navigator.pushNamed(context, '/settings'); // Example route
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Settings navigation has not been implemented yet')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arsenal FC App'), // Matches the image
        backgroundColor: Theme.of(context).primaryColor, // Use the theme's primary color
        centerTitle: true, // Centers the title
        actions: [
          // Gear icon for settings
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => _navigateToSettings(context),
          ),
        ],
      ),
      body: SingleChildScrollView( // Use SingleChildScrollView for scrollable content
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align content to the start
          children: <Widget>[
            // --- Jadwal Pertandingan Section ---
            Text(
              'Jadwal Pertandingan Arsenal FC',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity, // Make container full width
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFFE0F7FA), // Light blue background for match info, similar to image
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Arsenal FC team
                      Text(
                        'Arsenal FC',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'VS',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red), // 'VS' often highlighted
                      ),
                      // Sunderland AFC team
                      Text(
                        'Sunderland AFC',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tanggal: 09 November 2025', // Static data
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Waktu: 00:30 WIB', // Static data
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Lokasi: Stadium of Light', // Static data
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // --- Menu Section ---
            Text(
              'Menu',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround, // Distribute items evenly
              children: <Widget>[
                // Player Menu Item
                _buildMenuItem(context, Icons.person, 'Player', _navigateToPlayer),
                // Jadwal Menu Item
                _buildMenuItem(context, Icons.access_time, 'Jadwal', _navigateToJadwal),
                // Klasemen Menu Item
                _buildMenuItem(context, Icons.bar_chart, 'Klasemen', _navigateToKlasemen),
                // Merchandise Menu Item
                _buildMenuItem(context, Icons.shopping_bag_outlined, 'Merchandise', _navigateToMerchandise),
              ],
            ),
            const SizedBox(height: 12),

            // --- Berita Terbaru Section ---
            Text(
              'Berita Terbaru Arsenal FC',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: newsItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: index == newsItems.length - 1 ? 0 : 16,
                    ),
                    child: SizedBox(
                      width: 280,
                      child: _buildNewsCard(
                        context,
                        newsItems[index]['title']!,
                        newsItems[index]['content']!,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  // Helper widget for menu items
  Widget _buildMenuItem(BuildContext context, IconData icon, String label, Function onTap) {
    return InkWell(
      onTap: () => onTap(context),
      borderRadius: BorderRadius.circular(10.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Use minimum space
          children: <Widget>[
            Icon(icon, size: 30, color: Theme.of(context).primaryColor),
            const SizedBox(height: 6),
            Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }

  // Helper widget for news cards
  Widget _buildNewsCard(BuildContext context, String title, String content) {
    return Card(
     // margin: const EdgeInsets.all(8.0),
     shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: const Color.fromARGB(255, 176, 239, 255), // Light grey background for news cards
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                content,
                style: TextStyle(fontSize: 12, color: Colors.grey[800]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}