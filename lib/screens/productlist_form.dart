import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';
import 'package:horeg_fc/widgets/left_drawer.dart';
import 'package:horeg_fc/screens/menu.dart';

class ProductFormPage extends StatefulWidget {
    const ProductFormPage({super.key});

    @override
    State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _name = "";
    String _description = "";
    int _harga = 0;
    String _category = "jersey";
    String _thumbnail = "";
    bool _isFeatured = false;

    final List<String> _categories = [
      'jersey',
      'football shoes',
      'ball',
      'photocard',
      'accessories',
    ];

    @override
    Widget build(BuildContext context) {
      final request = context.watch<CookieRequest>();
        return Scaffold(
                appBar: AppBar(
                  title: const Center(
                    child: Text(
                      'Create Product Form',
                    ),
                  ),
                  backgroundColor: Colors.indigo.shade900,
                  foregroundColor: Colors.white,
                ),
                drawer: LeftDrawer(),
                body: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          // === name ===
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Nama Product",
                                labelText: "Nama Product",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  _name = value!;
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Nama Product tidak boleh kosong!";
                                }
                                if(value.length < 4){
                                  return "Nama product minimal 4 karakter!";
                                }
                                return null;
                              },
                            ),
                          ),

                          // === description ===
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              maxLines: 5,
                              decoration: InputDecoration(
                                hintText: "Deskripsi",
                                labelText: "Deskripsi",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  _description = value!;
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Deskripsi tidak boleh kosong!";
                                }
                                if(value.length < 10){
                                  return "Deskripsi minimal 10 karakter!";
                                }
                                return null;
                              },
                            ),
                          ),

                          // === Harga ===
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Harga Product (contoh: 500000)",
                                labelText: "Harga Product",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (String? value) {
                                setState(() {
                                  _harga = int.tryParse(value ?? '0') ?? 0;
                                });
                              },
                              
                              // 4. Validator jadi penjaga utamanya
                              validator: (String? value){
                                if(value == null || value.isEmpty){
                                  return "Harga tidak boleh kosong!";
                                }
                                
                                final int? price = int.tryParse(value);
                                if(price == null){
                                  return "Harga harus berupa angka integer (contoh: 150000)";
                                }
                                
                                if(price <= 0){
                                  return "Harga harus lebih besar dari 0!";
                                }
                                return null;
                              },
                            ),
                          ),
                          // === Category ===
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: "Kategori",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              value: _category,
                              items: _categories
                                  .map((cat) => DropdownMenuItem(
                                        value: cat,
                                        child: Text(
                                            cat[0].toUpperCase() + cat.substring(1)),
                                      ))
                                  .toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _category = newValue!;
                                });
                              },
                            ),
                          ),

                          // === Thumbnail URL ===
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "URL Thumbnail (opsional)",
                                labelText: "URL Thumbnail",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  _thumbnail = value!;
                                });
                              },
                              validator: (String? value){
                                if(value == null || value.trim().isEmpty){
                                  return null;
                                }
                                final Uri? uri = Uri.tryParse(value);
                                if(uri == null || (!uri.isScheme('http') && !uri.isScheme('https://'))){
                                  return "Format URL tidak valid, gunakan https:// atau https://";
                                }
                                if(uri.host.isEmpty){
                                  return "URL harus memiliki domain, seperti google.com";
                                }
                                return null;
                              },
                            ),
                          ),

                          // === Is Featured ===
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SwitchListTile(
                              title: const Text("Tandai sebagai Product Unggulan"),
                              value: _isFeatured,
                              onChanged: (bool value) {
                                setState(() {
                                  _isFeatured = value;
                                });
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.indigo),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    // TODO: Replace the URL with your app's URL
                                    // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
                                    // If you using chrome,  use URL http://localhost:8000
                                    
                                    final response = await request.postJson(
                                      "http://localhost:8000/create-flutter/",
                                      jsonEncode({
                                        "name": _name,
                                        "description": _description,
                                        "price": _harga,
                                        "thumbnail": _thumbnail,
                                        "category": _category,
                                        "is_featured": _isFeatured,
                                      }),
                                    );
                                    if (context.mounted) {
                                      if (response['status'] == 'success') {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text("News successfully saved!"),
                                        ));
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MyHomePage()),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text("Something went wrong, please try again."),
                                        ));
                                      }
                                    }
                                  }
                                },
                                child: const Text(
                                  "Save",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                    ),
                  ),
                ),
              );
    }
}