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

  String? _selectedFoot;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}