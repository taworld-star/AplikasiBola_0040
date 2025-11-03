// lib/screens/detail_pemain_page.dart
import 'package:flutter/material.dart';

class SavePlayerPage extends StatelessWidget {
  final Map<String, dynamic> playerData;

  const SavePlayerPage({Key? key, required this.playerData}) : super(key: key);

  // Helper function to convert height from cm to meters and format it
  String _formatHeight(int heightCm) {
    if (heightCm == 0) return '-';
    double heightM = heightCm / 100.0;
    return '${heightM.toStringAsFixed(2)} meter';
  }

  @override
  Widget build(BuildContext context) {
    // --- CORRECTED DATA EXTRACTION ---
    final String nama = playerData['name'] as String? ?? 'N/A';
    final String? posisi = playerData['position'] as String?; // Access from map
    final String? nomorPunggung = playerData['jerseyNumber'] as String?; // Access from map
    final String? kewarganegaraan = playerData['nationality'] as String?; // Access from map
    final int usia = playerData['age'] as int? ?? 0;
    final int tinggiBadanCm = playerData['heightCm'] as int? ?? 0;
    final String? jenisKelamin = playerData['gender'] as String?; // Access from map
    // --- END OF CORRECTION ---

    return Scaffold(
      appBar: AppBar(
        title: const Text('Player Details'),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen (Tambah Pemain)
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Display Player Details using extracted data from map
            _buildDetailRow('Name', nama),
            _buildDetailRow('Position', posisi ?? '-'), // Use extracted 'posisi'
            _buildDetailRow('Jersey Number', nomorPunggung ?? '-'), // Use extracted 'nomorPunggung'
            _buildDetailRow('Nationality', kewarganegaraan ?? '-'), // Use extracted 'kewarganegaraan'
            _buildDetailRow('Age', usia.toString()),
            _buildDetailRow('Height', _formatHeight(tinggiBadanCm)), // Formatted height
            _buildDetailRow('Gender', jenisKelamin ?? '-'), // Use extracted 'jenisKelamin'

            const SizedBox(height: 40), // Spacing before buttons

            // --- Buttons ---
            // Cancel Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to Tambah Pemain page
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Theme.of(context).primaryColor, width: 1.5),
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to display a detail row (Label: Value)
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              '$label:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[700]),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
          ),
        ],
      ),
    );
  }
}