import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.shopping_cart, size: 100, color: Colors.green),
          SizedBox(height: 20),
          Text(
            'Keranjang Anda Kosong',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('Tambahkan buku ke keranjang Anda untuk meminjam.'),
        ],
      ),
    );
  }
}
