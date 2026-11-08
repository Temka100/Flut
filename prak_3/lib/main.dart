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
          style: TextStyle(
            fontWeight: FontWeight.bold,
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
            // Картинка и заголовок
            const AntivirusImage(),

            const SizedBox(height: 10),

            // Описание
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

            const SizedBox(height: 10),

            // Раздел
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

            // Список антивирусов
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

            // Описание 2
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

            // Иконка внизу
            Image.asset(
              'assets/images/my_icon.jpg',
              width: 32,
              height: 32,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 2),

            // Создатель
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

class AntivirusImage extends StatefulWidget {
  const AntivirusImage({super.key});
  @override
  State<AntivirusImage> createState() => _AntivirusImageState();
}
class _AntivirusImageState extends State<AntivirusImage> {
  int imageNumber = 0;
  final List<String> images = [
    'assets/images/cybersecurity-icons_1.jpg',
    'assets/images/cybersecurity-icons_2.jpg',
    'assets/images/cybersecurity-icons_3.jpg',
    'assets/images/cybersecurity-icons_4.jpg',
    'assets/images/cybersecurity-icons_5.jpg',
  ];
  final List<String> titles = [
    'Защита компьютера',
    'Оптимизация',
    'Очистка системы',
    'Безопасность',
    'Забота о близких',
  ];
  void nextImage() {
    setState(() {
      imageNumber++;
      if (imageNumber == images.length) {
        imageNumber = 0;
      }
    });
  }
  void previousImage() {
    setState(() {
      imageNumber--;
      if (imageNumber < 0) {
        imageNumber = images.length - 1;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: previousImage,
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.green,
                size: 35,
              ),
            ),
            GestureDetector(
              onTap: nextImage,
              child: Container(
                width: 230,
                height: 230,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.green,
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    images[imageNumber],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: nextImage,
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.green,
                size: 35,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          titles[imageNumber],
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ],
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
            '$number.',
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