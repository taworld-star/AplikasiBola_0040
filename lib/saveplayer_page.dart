// lib/screens/detail_pemain_page.dart
import 'package:flutter/material.dart';

class _savePlayerPage extends StatelessWidget {
  final Map<String, dynamic> playerData;

  const _savePlayerPage({Key? key, required this.playerData}) : super(key: key);

  // Helper function to convert height from cm to meters and format it
  String _formatHeight(int heightCm) {
    if (heightCm == 0) return '-';
    double heightM = heightCm / 100.0;
    return heightM.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    // --- CORRECTED DATA EXTRACTION ---
    final String nama = playerData['nama'] as String? ?? 'N/A';
    final String? posisi = playerData['posisi'] as String?; // Access from map
    final String? nomorPunggung = playerData['nomorPunggung'] as String?; // Access from map
    final String? kewarganegaraan = playerData['kewarganegaraan'] as String?; // Access from map
    final int usia = playerData['usia'] as int? ?? 0;
    final int tinggiBadanCm = playerData['tinggiBadanCm'] as int? ?? 0;
    final String? jenisKelamin = playerData['jenisKelamin'] as String?; // Access from map
    // --- END OF CORRECTION ---

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pemain'),
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
            _buildDetailRow('Nama', nama),
            _buildDetailRow('Posisi', posisi ?? '-'), // Use extracted 'posisi'
            _buildDetailRow('Nomor Punggung', nomorPunggung ?? '-'), // Use extracted 'nomorPunggung'
            _buildDetailRow('Kewarganegaraan', kewarganegaraan ?? '-'), // Use extracted 'kewarganegaraan'
            _buildDetailRow('Usia', usia.toString()),
            _buildDetailRow('Tinggi Badan', _formatHeight(tinggiBadanCm)), // Formatted height
            _buildDetailRow('Jenis Kelamin', jenisKelamin ?? '-'), // Use extracted 'jenisKelamin'

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