import 'package:flutter/material.dart';

class MenuInferior extends StatelessWidget {
  final Function(int) onTabSelected;
  final int indiceActual; 

  MenuInferior({required this.onTabSelected, this.indiceActual = 0});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        
        color: indiceActual == 0 ? Colors.transparent : const Color(0xFF402B1D), 
        child: Stack(
          alignment: Alignment.center,
          children: [
          Image.asset(
            'assets/menu.png',
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: BotonAnimado(
                    imagePath: 'assets/1.png',
                    onTap: () => onTabSelected(0),
                  ),
                ),
                Expanded(
                  child: BotonAnimado(
                    imagePath: 'assets/2.png',
                    onTap: () => onTabSelected(1),
                  ),
                ),
                Expanded(
                  child: BotonAnimado(
                    imagePath: 'assets/3.png',
                    onTap: () => onTabSelected(2),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }
}

class BotonAnimado extends StatefulWidget {
  final String imagePath;
  final VoidCallback onTap;

  BotonAnimado({
    required this.imagePath,
    required this.onTap,
  });

  @override
  _BotonAnimadoState createState() => _BotonAnimadoState();
}

class _BotonAnimadoState extends State<BotonAnimado> {
  
  double ancho = 32;
  double alto = 32;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          ancho = 25;
          alto = 25;
        });
        
        Future.delayed(Duration(milliseconds: 150), () {
          setState(() {
            ancho = 32;
            alto = 32;
          });
          widget.onTap(); 
        });
      },
      child: Center(
        child: AnimatedContainer(
          width: ancho,
          height: alto,
          duration: Duration(milliseconds: 150),
          curve: Curves.decelerate, 
          child: Image.asset(
            widget.imagePath,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
