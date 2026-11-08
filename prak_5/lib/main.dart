import 'package:flutter/material.dart';
import 'pages/login_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AVpedia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        scaffoldBackgroundColor: Colors.green.shade50,
      ),
      /*home: const AntivirusPage(),*/
      home: const LoginPage(),
    );
  }
}

class AntivirusPage extends StatelessWidget {
  const AntivirusPage({super.key});

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Каталог антивирусов',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Антивирусные программы предназначены '
                  'для защиты устройства от вредоносных программ '
                  'и других угроз.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 10),

            const Divider(
              color: Colors.green,
              thickness: 1,
            ),

            const SizedBox(height: 15),

            //горизонтальный список изображений
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
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

            const SizedBox(height: 15),

            const Divider(
              color: Colors.green,
              thickness: 1,
            ),

            const SizedBox(height: 10),

            Row(
              children: const [
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

            const SizedBox(height: 10),

            //вертикальный список карточек
            Expanded(
              child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(
                      bottom: 8,
                    ),
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
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.green,
                        size: 18,
                      ),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${names[index]}',
                            ),
                            duration: const Duration(
                              seconds: 2,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 5),

            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/my_icon1.jpg',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Артём, ИКБО-66-23',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
