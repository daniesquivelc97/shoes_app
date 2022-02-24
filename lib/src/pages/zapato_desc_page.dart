import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/models/zapato_model.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';
import 'package:shoes_app/src/widgets/zapato_size.dart';

class ZapatoDescriptionPage extends StatelessWidget {
  const ZapatoDescriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                const Hero(
                  tag: 'zapato-1',
                  child: ZapatoSizePreview(fullScreen: true),
                ),
                Positioned(
                  top: 40,
                  child: FloatingActionButton(
                    child: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 60,
                    ),
                    onPressed: () {
                      cambiarStatusDark();
                      Navigator.pop(context);
                    },
                    elevation: 0,
                    highlightElevation: 0,
                    backgroundColor: Colors.transparent,
                  ),
                )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    ZapatoDescription(
                      titulo: 'Nike Air Max 720',
                      descripcion:
                          "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                    ),
                    _MontoBuyNow(),
                    _ColoresYMas(),
                    _BotonesLikeCartSettings(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {
  const _BotonesLikeCartSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _BotonSombrado(
            Icon(
              Icons.star,
              color: Colors.red,
              size: 25,
            ),
          ),
          _BotonSombrado(
            Icon(
              Icons.add_shopping_cart,
              color: Colors.grey.withOpacity(0.4),
              size: 25,
            ),
          ),
          _BotonSombrado(
            Icon(
              Icons.settings,
              color: Colors.grey.withOpacity(0.4),
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}

class _BotonSombrado extends StatelessWidget {
  final Icon icon;

  const _BotonSombrado(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: icon,
      width: 55,
      height: 55,
      decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                spreadRadius: -5,
                blurRadius: 20,
                offset: Offset(0, 10))
          ]),
    );
  }
}

class _ColoresYMas extends StatelessWidget {
  const _ColoresYMas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: const [
                Positioned(
                  left: 90,
                  child: _BotonColor(
                      Color(0xffC6D642), 4, 'assets/imgs/verde.png'),
                ),
                Positioned(
                  left: 60,
                  child: _BotonColor(
                      Color(0xffFFAD29), 3, 'assets/imgs/amarillo.png'),
                ),
                Positioned(
                  left: 30,
                  child:
                      _BotonColor(Color(0xff2099F1), 2, 'assets/imgs/azul.png'),
                ),
                _BotonColor(Color(0xff364D56), 1, 'assets/imgs/negro.png'),
              ],
            ),
          ),
          const BotonNaranja(
            texto: 'More releated items',
            alto: 30,
            ancho: 170,
            color: Color(0xffFFC675),
          )
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String urlImagen;

  const _BotonColor(this.color, this.index, this.urlImagen);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
          zapatoModel.assetImage = urlImagen;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  const _MontoBuyNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: Row(
          children: [
            const Text(
              '\$180.0',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Bounce(
              delay: const Duration(seconds: 1),
              from: 8,
              child: const BotonNaranja(
                texto: 'Buy now',
                ancho: 110,
                alto: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
