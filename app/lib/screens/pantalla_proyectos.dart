import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/menu_inferior.dart';

class PantallaProyectos extends StatelessWidget {
  const PantallaProyectos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF402B1D), 
      body: Stack(
        children: [
          
          Positioned(
            top: 30,    
            left: 0,    
            child: Image.asset(
              'assets/fondo2.png',
              width: 385,   
              height: 620,  
              fit: BoxFit.fill, 
            ),
          ),

          Positioned(
            top: 255,  
            left: 320,  
            child: _BotonProyecto(
              width: 20,   
              height: 20,  
              color: Colors.transparent, 
              onTap: () async {
                final url = Uri.parse('https://github.com/grism13/PROYECTO---JUEGO-INGENIERIA.git');
                await launchUrl(url, mode: LaunchMode.externalApplication);
              },
            ),
          ),

          Positioned(
            top: 440,  
            left: 320, 
            child: _BotonProyecto(
              width: 20,   
              height: 20,  
              color: Colors.transparent, 
              onTap: () async {
                final url = Uri.parse('https://github.com/grism13/proyecto_juego.git');
                await launchUrl(url, mode: LaunchMode.externalApplication);
              },
            ),
          ),

          Positioned(
            top: 600,  
            left: 325, 
            child: _BotonProyecto(
              width: 20,   
              height: 20,  
              color: Colors.transparent, 
              onTap: () async {
                final url = Uri.parse('https://github.com/grism13/juangriegoproyecto.git');
                await launchUrl(url, mode: LaunchMode.externalApplication);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BotonProyecto extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final VoidCallback onTap;

  const _BotonProyecto({
    required this.width,
    required this.height,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
