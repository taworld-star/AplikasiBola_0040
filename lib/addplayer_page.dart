import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddplayerPage extends StatefulWidget {
  const AddplayerPage({super.key});

  @override
  State<AddplayerPage> createState() => _AddplayerPageState();
}

class _AddplayerPageState extends State<AddplayerPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _jerseyNumberController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController(); //in cm
  
  String? _selectedPosition;
  String? _selectedNationality;
  String? _selectedGender;

  final List<String> _positions = [
    'Penjaga Gawang',
    'Bek Tengah',
    'Gelandang Tengah',
    'Gelandang Serang',
    'Gelandang Bertahan',
    'Penyerang',
    'Bek Sayap Kanan',
    'Bek Sayap Kiri', 
  ];

  final List<String> _nationalities = [
    'Indonesia',
    'Inggris',
    'Spanyol',
    'Jerman',
    'Prancis',
    'Italia',
    'Belanda',
    'Brasil',
    'Argentina',
    'Portugal',
  ];

  void _savePlayer(){
    if (_formKey.currentState!.validate()) {
      // Process data.
      print('Nama: ${_nameController.text}');
      print('Posisi: $_selectedPosition');
      print('Nomor Punggung: ${_jerseyNumberController.text}');
      print('Kebangsaan: $_selectedNationality');
      print('Usia: ${_ageController.text}');
      print('Tinggi: ${_heightController.text}');
      print('Jenis Kelamin: $_selectedGender');

      Navigator.pushNamed(
        context, 
        '/home',
        arguments: {
          'nama': _nameController.text,
          'posisi': _selectedPosition,
          'nomorPunggung': _jerseyNumberController.text,
          'kebangsaan': _selectedNationality,
          'usia': int.tryParse(_ageController.text) ?? 0,
          'tinggi': int.tryParse(_heightController.text) ?? 0, // tryparse to int
          'jenisKelamin': _selectedGender,
        }
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _positionController.dispose();
    _jerseyNumberController.dispose();
    _nationalityController.dispose();
    _ageController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Pemain Baru'),
        backgroundColor: const Color(0xFF0066CC),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  'Masukkan detail pemain baru di bawah ini:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Nama'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                DropdownButtonFormField<String>(
                  value: _selectedPosition,
                  hint: const Text('Pilih Posisi'),
                  decoration: const InputDecoration(labelText: 'Pilih Posisi Pemain'),
                  items: _positions.map((position) {
                    return DropdownMenuItem(
                      value: position,
                      child: Text(position),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedPosition = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Posisi tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                TextFormField(
                  controller: _jerseyNumberController,
                  decoration: const InputDecoration(labelText: 'Nomor Punggung'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor punggung tidak boleh kosong';
                    }
                    int? num = int.tryParse(value);
                    if (num == null || num < 1 || num > 99) {
                      return 'Nomor punggung harus berupa angka antara 1 dan 99';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                DropdownButtonFormField<String>(
                  value: _selectedNationality,
                  hint: const Text('Pilih Kebangsaan'),
                  decoration: const InputDecoration(labelText: 'Kebangsaan'),
                  items: _nationalities.map((nationality) {
                    return DropdownMenuItem(
                      value: nationality,
                      child: Text(nationality),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedNationality = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Kebangsaan tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                TextFormField(
                  controller: _ageController,
                  decoration: const InputDecoration(labelText: 'Usia'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Usia tidak boleh kosong';
                    }
                    int? age = int.tryParse(value);
                    if (age == null || age < 10 || age > 50) {
                      return 'Usia harus antara 10 dan 50 tahun';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                TextFormField(
                  controller: _heightController,
                  decoration: const InputDecoration(labelText: 'Tinggi (cm)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tinggi tidak boleh kosong';
                    }
                    int? height = int.tryParse(value);
                    if (height == null || height < 100 || height > 250) {
                      return 'Tinggi badan harus antara 100 cm sampai 250 cm';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jenis Kelamin',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio<String>(
                          value: 'Laki-laki', groupValue: _selectedGender,
                          onChanged: (v) => setState(() => _selectedGender = v),
                          activeColor: Theme.of(context).primaryColor,
                        ),
                        Text('Laki-laki'),
                        const SizedBox(width: 20),
                        Radio<String>(
                          value: 'Perempuan', groupValue: _selectedGender,
                          onChanged: (v) => setState(() => _selectedGender = v),
                          activeColor: Theme.of(context).primaryColor,
                        ),
                        Text('Perempuan'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 239, 242, 245),
                  ),
                  onPressed: _savePlayer,
                  child: const Text('Simpan'),
                  
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}