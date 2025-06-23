// pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthService>(context).currentUser;

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Welcome, ${user?.email ?? 'User'}'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await Provider.of<AuthService>(context, listen: false).logout();
              },
            ),
          ],
        ),
        body: const Center(child: Text('This is the home page')),
      ),
    );
  }
}