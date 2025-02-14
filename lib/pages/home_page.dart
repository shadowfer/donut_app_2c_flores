import 'package:donut_app_2c_flores/tabs/burger_tab.dart';
import 'package:donut_app_2c_flores/tabs/donut_tab.dart';
import 'package:donut_app_2c_flores/tabs/pancakes_tab.dart';
import 'package:donut_app_2c_flores/tabs/pizza_tab.dart';
import 'package:donut_app_2c_flores/tabs/smoothie_tab.dart';
import 'package:donut_app_2c_flores/utils/my_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = [
    const MyTab(iconPath: 'lib/icons/donut.png'),
    const MyTab(iconPath: 'lib/icons/burger.png'),
    const MyTab(iconPath: 'lib/icons/smoothie.png'),
    const MyTab(iconPath: 'lib/icons/pancakes.png'),
    const MyTab(iconPath: 'lib/icons/pizza.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            //icono izquierdo
            leading: Icon(Icons.menu, color: Colors.grey[800]),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Icon(Icons.person),
              )
            ],
          ),
          body: Column(
            children: [
              //Texto principal
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                child: Row(
                  children: [
                    Text(
                      'I want to ',
                      style: TextStyle(fontSize: 32),
                    ),
                    Text('Eat',
                        style: TextStyle(
                            //Tamaño de letras
                            fontSize: 32,
                            //Negritas
                            fontWeight: FontWeight.bold,
                            //Subrayado
                            decoration: TextDecoration.underline))
                  ],
                ),
              ),

              //Pestañas(TabBar)
              TabBar(tabs: myTabs),
              //Contenido de pestañas(TabBarView)
              Expanded(
                child: TabBarView(
                  children: [
                    DonutTab(),
                    BurgerTab(),
                    SmoothieTab(),
                    PancakesTab(),
                    PizzaTab(),
                    //Aquí se agregarán las pestañas de los demás productos.
                  ],
                ),
              )
              //Carrito(Car)
            ],
          )
          //Icono derecho
          ),
    );
  }
}
