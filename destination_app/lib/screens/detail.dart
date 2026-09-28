import 'package:flutter/material.dart';

import '../models/destinationModels.dart';


class Detail extends StatefulWidget {
  final DestinationModel dest;

  const Detail({super.key, required this.dest});

  @override
  State<Detail> createState() => _DetailState();
}


class _DetailState extends State<Detail> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Destinasi"),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: _isFavorite ? "Hapus dari favorit" : "Tambah ke favorit",
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
            },
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? const Color.fromARGB(255, 255, 0, 0) : Colors.grey,
            ),
          ),
        ],
      ),


      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.30),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: Image.network(
                    widget.dest.imageUrl,
                    height: 250,
                    width: 170,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 250,
                      width: 350,
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.broken_image,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Nama Destinasi
            Center(
              child: Column(
                children: [
                  Text(
                    widget.dest.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Lokasi: ${widget.dest.location}",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoChip(
                  Icons.category,
                  Color.fromARGB(255, 248, 42, 135),
                  "Kategori: ${widget.dest.category}",
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),

            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      _buildInfoRow(
                        Icons.room_service,
                        "Fasilitas",
                        widget.dest.attraction,
                      ),
                      const Divider(height: 16),
                      _buildInfoRow(
                        Icons.punch_clock_outlined,
                        "Waktu Buka",
                        widget.dest.openingHours,
                      ),
                      const Divider(height: 16),
                      _buildInfoRow(
                        Icons.airplane_ticket_outlined,
                        "Info Tiket",
                        widget.dest.ticketInfo,
                      ),
                      const Divider(height: 16),
                      _buildInfoRow(
                        Icons.info,
                        "Info Lebih",
                        widget.dest.wikipediaUrl,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Deskripsi 
            Text(
              "Apa sih itu ${widget.dest.name}?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.dest.description,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  //  Chip Info Singkat
  Widget _buildInfoChip(IconData icon, Color color, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        // color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
  // ini buatt widget untuk Info Row di Card
  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        const SizedBox(width: 10),
        SizedBox(
          width: 80,
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
        ),
        const Text(": "),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
