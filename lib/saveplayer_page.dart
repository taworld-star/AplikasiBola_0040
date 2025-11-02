// lib/screens/detail_pemain_page.dart
import 'package:flutter/material.dart';

class DetailPemainPage extends StatelessWidget {
  final Map<String, dynamic> playerData; // Data received from the previous screen

  const DetailPemainPage({Key? key, required this.playerData}) : super(key: key);

  // Helper function to convert height from cm to meters and format it
  String _formatHeight(int heightCm) {
    if (heightCm == 0) return '-'; // Handle case where height is not provided
    double heightM = heightCm / 100.0;
    return heightM.toStringAsFixed(2); // Format to 2 decimal places (e.g., 1.80)
  }

  @override
  Widget build(BuildContext context) {
    // Extract data safely, providing defaults if null
    final String nama = playerData['nama'] as String? ?? 'N/A';
    final String? posisi = playerData['posisi'];
    final String? nomorPunggung = playerData['nomorPunggung'];
    final String? kewarganegaraan = playerData['kewarganegaraan'];
    final int usia = playerData['usia'] as int? ?? 0;
    final int tinggiBadanCm = playerData['tinggiBadanCm'] as int? ?? 0;
    final String? jenisKelamin = playerData['jenisKelamin'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pemain'),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Go back to the previous screen (Tambah Pemain)
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Display Player Details
            _buildDetailRow('Nama', nama),
            _buildDetailRow('Posisi', posisi ?? '-'),
            _buildDetailRow('Nomor Punggung', nomorPunggung ?? '-'),
            _buildDetailRow('Kewarganegaraan', kewarganegaraan ?? '-'),
            _buildDetailRow('Usia', usia.toString()),
            _buildDetailRow('Tinggi Badan', _formatHeight(tinggiBadanCm)), // Formatted height
            _buildDetailRow('Jenis Kelamin', jenisKelamin ?? '-'),

            const SizedBox(height: 40), // Spacing before buttons

            // --- Buttons ---
            // Cancel Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton( // Outlined button style like in the image
                onPressed: () {
                  // As per PDF: "Tombol Cancel → mengembalikan pengguna ke halaman Tambah Pemain."
                  Navigator.pop(context); // Simply go back
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Theme.of(context).primaryColor, width: 1.5), // Outline color
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
                  // As per PDF: "Tombol Save → menutup semua halaman sebelumnya dan kembali ke Home."
                  // Use pushNamedAndRemoveUntil to clear the navigation stack
                  Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: Theme.of(context).primaryColor, // Solid color button
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
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start of the row
        children: [
          // Label part
          SizedBox(
            width: 150, // Fixed width for labels to align values
            child: Text(
              '$label:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
          ),
          // Value part - use Expanded to handle potentially long values
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