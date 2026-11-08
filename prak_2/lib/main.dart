import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Антивирусы',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        scaffoldBackgroundColor: Colors.green.shade50,
      ),
      home: const AntivirusPage(),
    );
  }
}

class AntivirusPage extends StatelessWidget {
  const AntivirusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Антивирусы',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 180, // Добавлено для красивого отображения картинки
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  'assets/images/antivirus.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // заголовок
            const Text(
              'Защита компьютера',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),
            // описание
            const Text(
              'Антивирусные программы предназначены '
                  'для защиты устройства от вредоносных программ '
                  'и других угроз.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 15),
            const Divider(
              color: Colors.green,
              thickness: 1,
            ),
            const SizedBox(height: 10),
            // раздел
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
            // список антивирусов
            const AntivirusItem(
              number: 1,
              name: 'Kaspersky',
            ),
            const AntivirusItem(
              number: 2,
              name: 'Dr.Web',
            ),
            const AntivirusItem(
              number: 3,
              name: '360 Total Security',
            ),
            const AntivirusItem(
              number: 4,
              name: 'Microsoft Defender',
            ),
            const SizedBox(height: 10),
            // описание 2
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Использование антивируса помогает '
                    'обеспечить безопасность устройства.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            const Spacer(),
            // иконка внизу
            Image.asset(
              'assets/images/my_icon.jpg',
              width: 32,
              height: 32,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 2),
            // создатель
            const Text(
              'Артём, группа ИКБО-66-23',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AntivirusItem extends StatelessWidget {
  final int number;
  final String name;

  const AntivirusItem({
    super.key,
    required this.number,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        bottom: 8,
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.green.shade200,
        ),
      ),
      child: Row(
        children: [
          Text(
            '$number. ',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}