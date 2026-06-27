import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PantallaAcertijo extends StatelessWidget {
  const PantallaAcertijo({super.key});

  @override
  Widget build(BuildContext context) {
    
    final List<String> fotos = [
      'assets/imagenes/DSC05915.JPG',
      'assets/imagenes/DSC05957.JPG',
      'assets/imagenes/DSC05992.JPG',
      'assets/imagenes/5.png', 
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF402B1D), 
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            
            Text(
              'FOTOS Y PROYECTOS',
              textAlign: TextAlign.center,
              style: GoogleFonts.pixelifySans(
                color: Colors.white,
                fontSize: 30,
                letterSpacing: 4,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 100), 
                itemCount: fotos.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 25), 
                    decoration: BoxDecoration(
                      color: Colors.grey[800], 
                      border: Border.all(color: Colors.grey[400]!, width: 4), 
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(4, 4), 
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        
                        Image.asset(
                          fotos[index],
                          fit: BoxFit.cover,
                          height: 220, 
                        ),
                        
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                          decoration: const BoxDecoration(
                            border: Border(top: BorderSide(color: Colors.black, width: 3)),
                            color: Colors.black45,
                          ),
                          child: Text(
                            'MEMORIA FOTOGRÁFICA 00${index + 1}',
                            style: GoogleFonts.pixelifySans(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
