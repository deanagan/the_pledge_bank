import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> accounts = [
    {
      'name': 'Smart Access',
      'balance': 5000.0,
      'available': 5000.0,
    },
    {
      'name': 'Lydia\'s Travel Fund',
      'balance': 2200.0,
      'available': 2200.0,
    },
    {
      'name': 'Ultimate Awards',
      'balance': 3000.0,
      'available': 3000.0,
    },
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            _buildTitle(),
            Expanded(child: _buildAccountList()),
            _buildTotalSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(backgroundColor: Colors.grey[300]),
          Row(
            children: [
              Icon(Icons.settings, color: Colors.black),
              SizedBox(width: 16),
              Icon(Icons.search, color: Colors.black),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Accounts',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildAccountList() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemCount: accounts.length,
      itemBuilder: (context, index) {
        final acc = accounts[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading: Icon(Icons.credit_card),
            title: Text(acc['name']),
            subtitle: Text('Available\nBalance'),
            isThreeLine: true,
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('\$${acc['balance'].toStringAsFixed(2)}', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('\$${acc['available'].toStringAsFixed(2)}', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTotalSection() {
    return Container(
      color: Colors.yellow[700],
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _buildSummaryRow('Total', '\$10,700.00', bold: true),
          SizedBox(height: 8),
          _buildSummaryRow('Credits', '\$10,700.00'),
          _buildSummaryRow('Debits', '-\$20.00'),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String amount, {bool bold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: bold ? TextStyle(fontWeight: FontWeight.bold) : null),
        Text(amount, style: bold ? TextStyle(fontWeight: FontWeight.bold) : null),
      ],
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.account_balance), label: 'Accounts'),
        BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Pay'),
        BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: 'Cards'),
        BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Features'),
      ],
    );
  }
}
