import 'package:appscrip/view/home/home.dart';
import 'package:flutter/material.dart';

class DetailWidget {
  listTile(String? detail, IconData icon, String label) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.teal),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text.textWidget(
                      data: label,
                      weight: FontWeight.bold,
                      size: 16.0,
                      color: Colors.teal),
                  const SizedBox(height: 4),
                  text.textWidget(
                      data: detail ?? "N/A", size: 14.0, color: Colors.black87),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
