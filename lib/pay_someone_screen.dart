import 'package:flutter/material.dart';

class PaySomeoneScreen extends StatelessWidget {
  const PaySomeoneScreen({super.key});

  final List<Map<String, String>> contacts = const [
    {'name': 'Stephen Curry', 'details': '123-456 7890 1234'},
    {'name': 'Test Pty Ltd', 'details': 'TEST PAYMENT SYSTEMS\n1234 27537972412645'},
    {'name': 'Tony Parker', 'details': '012-556 2009 4918 1'},
    {'name': 'Chase Centre', 'details': '334-342 9456 9432'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: BackButton(color: Colors.white),
        title: const Text('Pay someone', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () {}, // Placeholder for add contact
            icon: const Icon(Icons.add, color: Colors.white),
          )
        ],
      ),
      body: Column(
        children: [
          _buildSearchField(),
          _buildFilterChips(),
          Expanded(child: _buildContactList()),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          filled: true,
          fillColor: Colors.grey[900],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    final filters = ['All', 'Bank account', 'PayID', 'BPAY'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 8,
        children: filters.map((filter) {
          final isSelected = filter == 'All';
          return FilterChip(
            selected: isSelected,
            label: Text(filter),
            onSelected: (_) {},
            backgroundColor: Colors.transparent,
            selectedColor: Colors.white,
            labelStyle: TextStyle(color: isSelected ? Colors.black : Colors.white),
            side: const BorderSide(color: Colors.white),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildContactList() {
    return ListView(
      children: [
        _buildAlphaHeader('R'),
        _buildAlphaHeader('S'),
        _buildContactItem('Shal Lawyers Associa', '062-293 1033 7288'),
        _buildContactItem('SMS Pty Ltd', 'DEFT PAYMENT SYSTEMS\n96503 27437572432679'),
        _buildAlphaHeader('T'),
        _buildContactItem('Teresita Alivio', '012-556 2009 4918 1'),
        _buildContactItem('Top 1 Removals', '062-265 1156 3376'),
      ],
    );
  }

  Widget _buildAlphaHeader(String letter) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(letter, style: const TextStyle(color: Colors.grey, fontSize: 16)),
    );
  }

  Widget _buildContactItem(String name, String details) {
    return ListTile(
      title: Text(name, style: const TextStyle(color: Colors.white)),
      subtitle: Text(details, style: const TextStyle(color: Colors.grey)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      onTap: () {
        // TODO: Add navigation to pay details
      },
    );
  }
}
