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
  final TextEditingController _heightController =
      TextEditingController(); //in cm

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

  void _savePlayer() {
    if (_formKey.currentState!.validate()) {
      // Prepare player data
      final playerData = {
        'name': _nameController.text,
        'position': _selectedPosition,
        'jerseyNumber': _jerseyNumberController.text,
        'nationality': _selectedNationality,
        'age': int.tryParse(_ageController.text) ?? 0,
        'heightCm': int.tryParse(_heightController.text) ?? 0, // tryparse to int
        'gender': _selectedGender,
      };

      // Navigate to SavePlayerPage with player data
      Navigator.pushNamed(context, '/save_player', arguments: playerData);
    } else {
      // Show error message if validation fails
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please check the input data.'),
          backgroundColor: Colors.red,
        ),
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
        title: const Text('Add New Player'),
        backgroundColor: const Color(0xFFEF0107),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
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
                  'Enter Player Details',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name cannot be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                DropdownButtonFormField<String>(
                  value: _selectedPosition,
                  hint: const Text('Choose Position'),
                  decoration: const InputDecoration(
                    labelText: 'Choose Player Position',
                  ),
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
                      return 'Position cannot be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                TextFormField(
                  controller: _jerseyNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Jersey Number',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Jersey number cannot be empty';
                    }
                    int? num = int.tryParse(value);
                    if (num == null || num < 1 || num > 99) {
                      return 'Jersey number must be a number between 1 and 99';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                DropdownButtonFormField<String>(
                  value: _selectedNationality,
                  hint: const Text('Choose Nationality'),
                  decoration: const InputDecoration(labelText: 'Nationality'),
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
                      return 'Nationality cannot be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                TextFormField(
                  controller: _ageController,
                  decoration: const InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Age cannot be empty';
                    }
                    int? age = int.tryParse(value);
                    if (age == null || age < 10 || age > 50) {
                      return 'Age must be between 10 and 50 years';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                TextFormField(
                  controller: _heightController,
                  decoration: const InputDecoration(labelText: 'Height (cm)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Height cannot be empty';
                    }
                    int? height = int.tryParse(value);
                    if (height == null || height < 100 || height > 250) {
                      return 'Height must be between 100 cm and 250 cm';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gender',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio<String>(
                          value: 'Male',
                          groupValue: _selectedGender,
                          onChanged: (v) => setState(() => _selectedGender = v),
                          activeColor: Theme.of(context).primaryColor,
                        ),
                        Text('Male'),
                        const SizedBox(width: 20),
                        Radio<String>(
                          value: 'Female',
                          groupValue: _selectedGender,
                          onChanged: (v) => setState(() => _selectedGender = v),
                          activeColor: Theme.of(context).primaryColor,
                        ),
                        Text('Female'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: const Color.fromARGB(255, 239, 242, 245),
                //   ),
                //   onPressed: _savePlayer,
                //   child: const Text('Simpan'),

                // ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEF0107),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: _savePlayer,
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
