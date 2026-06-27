import 'package:flutter/material.dart';
import 'pantalla_inicio.dart';
import 'pantalla_proyectos.dart';
import 'pantalla_acertijo.dart';
import 'pantalla_contacto.dart'; 
import '../widgets/menu_inferior.dart';

class PantallaPrincipal extends StatefulWidget {
  @override
  _PantallaPrincipalState createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  
  int indiceActual = 0;

  final List<Widget> pantallas = [
    PantallaInicio(),
    PantallaProyectos(),
    PantallaAcertijo(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      body: Stack(
        children: [
          
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 350),
            switchInCurve: Curves.easeOutBack, 
            switchOutCurve: Curves.easeIn,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: Tween<double>(begin: 0.9, end: 1.0).animate(animation),
                  child: child,
                ),
              );
            },
            child: SizedBox(
              
              key: ValueKey<int>(indiceActual),
              width: double.infinity,
              height: double.infinity,
              child: pantallas[indiceActual],
            ),
          ),
          MenuInferior(
            indiceActual: indiceActual,
            onTabSelected: (int index) {
              setState(() {
                indiceActual = index;
              });
            },
          ),
        ],
      ),
    );
  }
}
