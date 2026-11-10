import 'package:flutter/material.dart';
import '../routes.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String email;

  const ProfilePage({
    super.key,
    this.name = 'Пользователь',
    this.email = '',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Профиль'),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Добро пожаловать\nв AVpedia!',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 30),

                      ClipOval(
                        child: Image.asset(
                          'assets/images/gary.jpeg',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        email,
                        style: const TextStyle(fontSize: 16),
                      ),

                      const SizedBox(height: 40),

                      SizedBox(
                        width: 300,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              AppRoutes.login,
                                  (route) => false,
                            );
                          },
                          icon: const Icon(Icons.logout),
                          label: const Text('Выйти'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade50,
                            foregroundColor: Colors.red.shade800,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/my_icon.jpg',
                      width: 20,
                      height: 20,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Артём, ИКБО-66-23',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: NavigationBar(
        height: 60,
        selectedIndex: 1,
        onDestinationSelected: (index) {
          if (index == 0) {
            Navigator.pop(context);
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Каталог',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}