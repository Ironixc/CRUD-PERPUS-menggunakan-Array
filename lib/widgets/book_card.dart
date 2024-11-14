// lib/widgets/book_card.dart

import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String title;
  final String author;
  final String publisher;
  final int stock;
  final String imageUrl;
  final String description;

  const BookCard({
    Key? key,
    required this.title,
    required this.author,
    required this.publisher,
    required this.stock,
    required this.imageUrl,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            imageUrl.isNotEmpty
                ? Image.asset(
                    imageUrl,
                    width: 60,
                    height: 90,
                    fit: BoxFit.cover,
                  )
                : const SizedBox.shrink(),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text('By $author'),
                  Text('Publisher: $publisher'),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Stock: $stock',
                    style: TextStyle(
                      color: stock > 0 ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
