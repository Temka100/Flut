import 'package:flutter/material.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String email;

  const ProfilePage({
    super.key,
    this.name = '',
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final displayedName =
    name.isEmpty ? 'Пользователь AVpedia' : name;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Мой профиль'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/images/gary.jpeg',
                  width: 110,
                  height: 110,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Профиль пользователя',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 24),

              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: Colors.green,
                  ),
                  title: const Text('Имя'),
                  subtitle: Text(displayedName),
                ),
              ),

              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.email,
                    color: Colors.green,
                  ),
                  title: const Text('Email'),
                  subtitle: Text(email),
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                          (route) => false,
                    );
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('Выйти'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
