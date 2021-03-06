import 'package:flutter/material.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';
import 'package:shoes_app/src/widgets/zapato_size.dart';

class ZapatoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    cambiarStatusDark();
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(texto: 'For you'),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: const [
                  Hero(
                    tag: 'zapato-1',
                    child: ZapatoSizePreview(),
                  ),
                  ZapatoDescription(
                    titulo: 'Nike Air Max 720',
                    descripcion:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                ],
              ),
            ),
          ),
          AgregarCarritoBoton(monto: 180.0),
        ],
      ),
    );
  }
}
