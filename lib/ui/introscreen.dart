import 'package:flutter/material.dart';
import 'package:global_fitness_app/shared/menu_bottom.dart';
import 'package:global_fitness_app/shared/menu_drawer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Global Fitness'),
      ),
      drawer: MenuDrawer(),
      bottomNavigationBar: MenuBottom(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fitness2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Text('If you think lifting is dangerous,\n try being weak',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22,
                  shadows: [
                    Shadow(
                      offset: Offset(1.0,1.0),
                      blurRadius: 2.0,
                      color: Colors.grey,
                    )
                  ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
