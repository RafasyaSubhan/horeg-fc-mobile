import 'package:flutter/material.dart';
import 'package:horeg_fc/screens/menu.dart';
import 'package:horeg_fc/screens/productlist_form.dart';
import 'package:horeg_fc/screens/product_entry_list.dart';
import 'package:horeg_fc/app_colors.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: ListView(
        children: [
          DrawerHeader( // Harusnya const DrawerHeader( -> Apus const biar bisa shade di colors
            decoration: BoxDecoration(
              color: AppColors.sage,
            ),
            child: Column(
              children: [
                Text(
                  "ℌ𝔬𝔯𝔢𝔤 𝔉ℭ'",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Product olahraga dengan kualitas terbaik di Horeg FC",
                    style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                )
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('Show Product'),
            // Bagian redirection ke Product
           onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductEntryListPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Add Product'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProductFormPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}