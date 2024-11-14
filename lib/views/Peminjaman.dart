import 'package:flutter/material.dart';

class BorrowView extends StatelessWidget {
  const BorrowView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.book, size: 100, color: Colors.blue),
          SizedBox(height: 20),
          Text(
            'Peminjaman Buku',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('Anda belum meminjam buku apa pun.'),
        ],
      ),
    );
  }
}
