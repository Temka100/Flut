import 'package:flutter/material.dart';

import '../routes.dart';


class HomePage extends StatelessWidget {
  final String name;
  final String email;

  const HomePage({
    super.key,
    this.name = 'Пользователь',
    this.email = '',
  });

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/images/cybersecurity-icons_1.jpg',
      'assets/images/cybersecurity-icons_2.jpg',
      'assets/images/cybersecurity-icons_3.jpg',
      'assets/images/cybersecurity-icons_4.jpg',
      'assets/images/cybersecurity-icons_5.jpg',
    ];

    final List<String> names = [
      'Kaspersky',
      'Dr.Web',
      '360 Total Security',
      'Microsoft Defender',
      'Comodo Cloud Antivirus',
    ];

    final List<String> descriptions = [
      'Защита от вредоносных программ',
      'Антивирусная защита устройства',
      'Очистка и оптимизация системы',
      'Защита Windows от угроз',
      'Облачный антивирус с песочницей',
    ];

    final List<IconData> icons = [
      Icons.security,
      Icons.bug_report,
      Icons.cleaning_services,
      Icons.computer,
      Icons.filter_drama,
    ];

    final double screenWidth = MediaQuery.sizeOf(context).width;
    final bool isWideScreen = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AVpedia',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            fontFamily: 'Frank',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: EdgeInsets.all(isWideScreen ? 24 : 10),

        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Каталог антивирусов',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20, // Уменьшено на 2
                  ),
                ),

                const SizedBox(height: 4),

                const Text(
                  'Антивирусные программы предназначены '
                      'для защиты устройства от вредоносных программ '
                      'и других угроз.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),

                const SizedBox(height: 5),

                const Divider(
                  color: Colors.green,
                  thickness: 1,
                ),

                const SizedBox(height: 8),

                SizedBox(
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            images[index],
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 8),

                const Divider(
                  color: Colors.green,
                  thickness: 1,
                ),

                const SizedBox(height: 5),

                const Row(
                  children: [
                    Icon(
                      Icons.security,
                      color: Colors.green,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Популярные антивирусы',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                Expanded(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: names.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isWideScreen ? 2 : 1,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: isWideScreen ? 16 : 8,
                      mainAxisExtent: 90,
                    ),
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 2,
                        child: ListTile(
                          leading: Icon(
                            icons[index],
                            color: Colors.green,
                          ),
                          title: Text(
                            names[index],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            descriptions[index],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.green,
                            size: 18,
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.detail,
                              arguments: {
                                'name': names[index],
                                'description': descriptions[index],
                                'image': images[index],
                                'icon': icons[index],
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: NavigationBar(
        height: 60,
        selectedIndex: 0,
        onDestinationSelected: (index) {
          if (index == 1) {
            Navigator.pushNamed(
              context,
              AppRoutes.profile,
              arguments: {
                'name': name,
                'email': email,
              },
            );
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