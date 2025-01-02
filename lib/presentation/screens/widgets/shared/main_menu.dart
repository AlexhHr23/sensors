import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final String route;

  MenuItem(
    this.title, 
    this.icon, 
    this.route
  );
}

final menuItem = <MenuItem> [
  MenuItem('Giroscopio', Icons.downloading, '/gyroscope'),
  MenuItem('Acelerometro', Icons.speed, '/accelerometer'),
  MenuItem('Magnetometro', Icons.explore_outlined, '/magnetometer'),

  MenuItem('Girsocopio Ball', Icons.sports_basketball, '/gyroscope-ball'), 
  MenuItem('Brújula', Icons.explore, '/compass'),
];

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: menuItem.map((item) => HomeMenuItem(title: item.title, route: item.route, icon: item.icon)).toList(),
    );
  }
}



class HomeMenuItem extends StatelessWidget {

  final String title;
  final String route;
  final IconData icon;
  final List<Color> colors;

  const HomeMenuItem({
    super.key, 
    required this.title, 
    required this.route, 
    required this.icon, 
    this.colors = const [Colors.lightBlue, Colors.blue]
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(route),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white,),
            const SizedBox(height: 10),
            Text(title, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 12))
          ],
        ),
      ),
    );
  }
}