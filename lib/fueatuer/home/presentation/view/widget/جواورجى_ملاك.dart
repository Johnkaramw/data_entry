// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class gaorgymalak extends StatefulWidget {
  const gaorgymalak({super.key});

  @override
  State<gaorgymalak> createState() => _gaorgymalakState();
}

class _gaorgymalakState extends State<gaorgymalak> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _streetController = TextEditingController();
  final _levelController = TextEditingController();
  File? _imageFile;
  List<Map<String, dynamic>> _childrenDetails = [];
  int? _editingIndex;

  final String _storageKey =
      'gaorgymalakChildrenDetails'; // مفتاح خاص بهذه الصفحة

  @override
  void initState() {
    super.initState();
    _loadChildrenDetails(); // استرجاع البيانات عند بدء التطبيق
  }

  Future<void> _loadChildrenDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_storageKey);
    if (data != null) {
      setState(() {
        _childrenDetails = List<Map<String, dynamic>>.from(jsonDecode(data));
      });
    }
  }

  Future<void> _saveChildrenDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_storageKey, jsonEncode(_childrenDetails));
  }

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _saveChildDetails() async {
    final name = _nameController.text;
    final phone = _phoneController.text;
    final street = _streetController.text;
    final level = _levelController.text;

    if (name.isEmpty ||
        phone.isEmpty ||
        street.isEmpty ||
        level.isEmpty ||
        (_imageFile == null && _editingIndex == null)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجى إدخال جميع البيانات'),
        ),
      );
      return;
    }

    if (_editingIndex != null) {
      setState(() {
        _childrenDetails[_editingIndex!] = {
          'name': name,
          'phone': phone,
          'street': street,
          'level': level,
          'image': _imageFile != null
              ? base64Encode(_imageFile!.readAsBytesSync())
              : _childrenDetails[_editingIndex!]['image'],
        };
        _editingIndex = null;
      });
    } else {
      setState(() {
        _childrenDetails.add({
          'name': name,
          'phone': phone,
          'street': street,
          'level': level,
          'image': base64Encode(_imageFile!.readAsBytesSync()),
        });
      });
    }

    await _saveChildrenDetails();
    _resetFields();
    Navigator.of(context).pop(); // إغلاق BottomSheet
  }

  void _deleteChildDetails(int index) async {
    setState(() {
      _childrenDetails.removeAt(index);
    });
    await _saveChildrenDetails();
  }

  void _editChildDetails(int index) {
    final child = _childrenDetails[index];
    setState(() {
      _nameController.text = child['name'];
      _phoneController.text = child['phone'];
      _streetController.text = child['street'];
      _levelController.text = child['level'];
      _imageFile = null;
      _editingIndex = index;
    });
    _showBottomSheet(); // عرض BottomSheet لتعديل البيانات
  }

  void _resetFields() {
    _nameController.clear();
    _phoneController.clear();
    _streetController.clear();
    _levelController.clear();
    _imageFile = null;
    _editingIndex = null;
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'اسم الطفل',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'رقم الموبايل',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _streetController,
                decoration: const InputDecoration(
                  labelText: 'اسم الشارع',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _levelController,
                decoration: const InputDecoration(
                  labelText: 'المستوى الدراسي',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  _imageFile != null
                      ? CircleAvatar(
                          backgroundImage: FileImage(_imageFile!),
                          radius: 40,
                        )
                      : const CircleAvatar(
                          child: Icon(Icons.person, size: 40),
                          radius: 40,
                        ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _pickImage,
                    child: const Text('إضافة صورة'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _saveChildDetails,
                child: Text(
                    _editingIndex == null ? 'حفظ البيانات' : 'تعديل البيانات'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showFullImage(String imageData) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: MemoryImage(base64Decode(imageData)),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إدارة بيانات الأطفال'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/image/back.jpeg'), // تحديد مسار الصورة في الخلفية
            fit: BoxFit.cover,
          ),
        ),
        child: _childrenDetails.isEmpty
            ? const Center(
                child: Text('لا توجد بيانات أطفال مضافة'),
              )
            : ListView.builder(
                itemCount: _childrenDetails.length,
                itemBuilder: (context, index) {
                  final child = _childrenDetails[index];
                  final imageData = child['image'];

                  return Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      leading: GestureDetector(
                        onTap: () => _showFullImage(imageData),
                        child: imageData != null
                            ? CircleAvatar(
                                backgroundImage:
                                    MemoryImage(base64Decode(imageData)),
                              )
                            : const CircleAvatar(
                                child: Icon(Icons.person),
                              ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('الاسم: ${child['name']}'),
                          Text('الموبايل: ${child['phone']}'),
                          Text('اسم الشارع: ${child['street']}'),
                          Text('المستوى: ${child['level']}'),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => _editChildDetails(index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteChildDetails(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _resetFields(); // التأكد من عدم وجود بيانات قديمة
          _showBottomSheet(); // عرض BottomSheet لإضافة البيانات
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
