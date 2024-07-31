import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FarmerScreen extends StatefulWidget {
  @override
  _FarmerScreenState createState() => _FarmerScreenState();
}

class _FarmerScreenState extends State<FarmerScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Products'),
        backgroundColor: Colors.green[800],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('products').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final products = snapshot.data!.docs;
          if (products.isEmpty) {
            return Center(child: Text('No products found.'));
          }
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ListTile(
                leading: Icon(Icons.local_offer),
                title: Text(product['name'] ?? 'Unnamed Product'),
                subtitle: Text(product['origin'] ?? 'Unknown Origin'),
                onTap: () {
                  // Handle on tap event, e.g., navigate to product details page
                },
              );
            },
          );
        },
      ),
    );
  }
}
