// lib/views/home_view.dart

import 'package:flutter/material.dart';
import '../widgets/book_card.dart'; // Import BookCard widget
import '../data/book_data.dart';    // Import book data
import 'package:Perpus/views/Peminjaman.dart';
import 'package:Perpus/views/profileview.dart';
import 'package:Perpus/views/Keranjang.dart';
import 'add_book_dialog.dart'; // Import AddBookDialog

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  // Maintain the book list here
  List<Map<String, dynamic>> bookList = bookData; // Initial book data

  // List of widgets for the navigation items
  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      HomeContent(bookList: bookList, onAddBook: _addBook), // Pass book list and add function
      const BorrowView(), // Borrow Page Content (Peminjaman)
      const ProfileView(nama: "Budi", alamat: "Malang", juara: 1), // Profile Page Content
      const CartView(), // Cart Page Content (Keranjang)
    ]);
  }

  // Function to add a new book
  void _addBook(String title, String author, String publisher, int stock, String imageUrl, String description) {
    setState(() {
      bookList.add({
        'title': title,
        'author': author,
        'publisher': publisher,
        'stock': stock,
        'imageUrl': imageUrl,
        'description': description,
      });
    });
  }

  // Function to change the current page index
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Perpustakaan',
            style: TextStyle(
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        backgroundColor: Colors.blue.shade500,
        automaticallyImplyLeading: false, // This removes the back arrow
      ),
      body: _pages[_currentIndex], // Displays the selected page content
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue.shade800,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Peminjaman',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Keranjang',
          ),
        ],
      ),
    );
  }
}

// Updated Home Page Content
class HomeContent extends StatelessWidget {
  final List<Map<String, dynamic>> bookList; // Accept the book list
  final Function(String, String, String, int, String, String) onAddBook; // Accept the add book function

  const HomeContent({super.key, required this.bookList, required this.onAddBook});

  void _showAddBookDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddBookDialog(onAddBook: onAddBook);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: bookList.length,  // Use the length of the book data list
        itemBuilder: (context, index) {
          final book = bookList[index];  // Get book data at the current index
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: BookCard(
              title: book['title'],
              author: book['author'],
              publisher: book['publisher'],
              stock: book['stock'],
              imageUrl: book['imageUrl'],
              description: book['description'],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddBookDialog(context); // Show the add book dialog
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
