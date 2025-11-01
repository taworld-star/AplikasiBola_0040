// lib/screens/home_page.dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // Navigation functions (will be implemented later)
  void _navigateToPlayer(BuildContext context) {
    // Navigator.pushNamed(context, '/player_list'); // Example route
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navigasi ke Player belum diimplementasikan')),
    );
  }

  void _navigateToJadwal(BuildContext context) {
    // Navigator.pushNamed(context, '/jadwal'); // Example route
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navigasi ke Jadwal belum diimplementasikan')),
    );
  }

  void _navigateToKlasemen(BuildContext context) {
    // Navigator.pushNamed(context, '/klasemen'); // Example route
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navigasi ke Klasemen belum diimplementasikan')),
    );
  }

  void _navigateToMerchandise(BuildContext context) {
    // Navigator.pushNamed(context, '/merchandise'); // Example route
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navigasi ke Merchandise belum diimplementasikan')),
    );
  }

  void _navigateToSettings(BuildContext context) {
    // Navigator.pushNamed(context, '/settings'); // Example route
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navigasi ke Pengaturan belum diimplementasikan')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arsenal FC App'), // Matches the image
        backgroundColor: Theme.of(context).primaryColor, // Uses the theme's primary color
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
            const SizedBox(height: 12),
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
            const SizedBox(height: 24),

            // --- Berita Terbaru Section ---
            Text(
              'Berita Terbaru Arsenal FC',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 12),
            // News articles are displayed side-by-side
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // First News Article
                Expanded(
                  child: _buildNewsCard(
                    context,
                    'Persib Bandung\nResmi Rekrut Pemain\nBaru',
                    'Persib Bandung telah resmi merekrut pemain baru untuk memperkuat skuad mereka di musim depan. Pemain tersebut diharapkan memberikan kontribusi besar bagi tim.',
                  ),
                ),
                const SizedBox(width: 16), // Spacing between news cards
                // Second News Article
                Expanded(
                  child: _buildNewsCard(
                    context,
                    'Persib Bandung\nResmi Rekrut Pemain\nBaru',
                    'Persib Bandung telah resmi merekrut pemain baru untuk memperkuat skuad mereka di musim depan. Pemain tersebut diharapkan memberikan kontribusi besar bagi tim.',
                  ),
                ),
              ],
            ),
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
      elevation: 2.0, // Adds a shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: const Color(0xFFE0F7FA), // Light cyan background for news, similar to image
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
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(fontSize: 12, color: Colors.grey[800]),
            ),
            // You could add an image here if the news had one
          ],
        ),
      ),
    );
  }
}