import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_page.dart';
import '../blocs/home/home_bloc.dart';
import '../models/antivirus.dart';
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

      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          switch (state) {
            case HomeInitial():
              return const Center(
                child: Text('Данные еще не загружены'),
              );

            case HomeLoading():
              return const Center(
                child: CircularProgressIndicator(),
              );

            case HomeError(:final message):
              return Center(child: Text(message));

            case HomeLoaded(:final antiviruses):
              if (antiviruses.isEmpty) {
                return const Center(child: Text('Список пуст'));
              }

              return _buildContent(
                context,
                antiviruses,
                isWideScreen,
              );
          }
        },
      ),

      bottomNavigationBar: NavigationBar(
        height: 60,
        selectedIndex: 0,
        onDestinationSelected: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return ProfilePage(
                    name: name,
                    email: email,
                  );
                },
                transitionsBuilder: (
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                    ) {
                  final tween = Tween(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).chain(
                    CurveTween(curve: Curves.easeInOut),
                  );

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
              ),
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

  Widget _buildContent(
      BuildContext context,
      List<Antivirus> antiviruses,
      bool isWideScreen,
      ) {
    return Padding(
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
                  fontSize: 20,
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
                  itemCount: antiviruses.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          antiviruses[index].image,
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
                  itemCount: antiviruses.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isWideScreen ? 2 : 1,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: isWideScreen ? 16 : 8,
                    mainAxisExtent: 90,
                  ),
                  itemBuilder: (context, index) {
                    final antivirus = antiviruses[index];

                    return Card(
                      elevation: 2,
                      child: ListTile(
                        leading: Icon(
                          antivirus.icon,
                          color: Colors.green,
                        ),
                        title: Text(
                          antivirus.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          antivirus.description,
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
                              'name': antivirus.name,
                              'description': antivirus.description,
                              'image': antivirus.image,
                              'icon': antivirus.icon,
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
    );
  }
}