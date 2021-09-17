import 'package:flutter/material.dart';
import 'package:global_fitness_app/ui/bmi_screen.dart';
import 'package:global_fitness_app/ui/introscreen.dart';
import 'package:global_fitness_app/ui/sessions_screen.dart';
import 'package:global_fitness_app/ui/weather_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }
  List<Widget> buildMenuItems(BuildContext context){
    final List<String> menuTitles =[
      'Home',
      'BMI Calculator',
      'Weather',
      'Training',
    ];
    List<Widget> menuItems = [];
    menuItems.add(DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
      ),
      child: Text('Global Fitness',
        style: TextStyle(
          fontSize: 28,
          color: Colors.white,
        ),
      ),
    ));
    menuTitles.forEach((element) {
      Widget screen = Container();
      menuItems.add(ListTile(
        title: Text(element,
        style: TextStyle(
          fontSize: 18,
        ),
        ),
        onTap: (){
          switch(element){
            case'Home':
              screen =  IntroScreen();
              break;
            case'BMI Calculator':
              screen =  BMIScreen();
              break;
            case'Weather':
              screen =  WeatherScreen();
              break;
              case'Training':
              screen =  SessionsScreen();
              break;
          }
          Navigator.of(context).pop();
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => screen),
          );
        },
      ));
    });
    return menuItems;
  }
}
