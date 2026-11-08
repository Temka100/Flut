import 'package:flutter/material.dart';


class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;

    final Map<String, dynamic> antivirus =
    arguments is Map<String, dynamic>
        ? arguments
        : <String, dynamic>{};

    final String name = antivirus['name'] as String? ?? 'Антивирус';
    final String description =
        antivirus['description'] as String? ?? 'Описание отсутствует';
    final String? image = antivirus['image'] as String?;
    final IconData icon =
        antivirus['icon'] as IconData? ?? Icons.security;

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (image != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      image,
                      height: 250,
                      fit: BoxFit.contain,
                    ),
                  )
                else
                  Icon(
                    icon,
                    size: 100,
                    color: Colors.green,
                  ),

                const SizedBox(height: 24),

                Icon(
                  icon,
                  size: 55,
                  color: Colors.green,
                ),

                const SizedBox(height: 16),

                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18),
                ),

                const SizedBox(height: 30),

                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Назад в каталог'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}