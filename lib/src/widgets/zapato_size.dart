import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/zapato_model.dart';
import 'package:shoes_app/src/pages/zapato_desc_page.dart';

class ZapatoSizePreview extends StatelessWidget {
  final bool fullScreen;

  const ZapatoSizePreview({
    Key? key,
    this.fullScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    const ZapatoDescriptionPage(),
              ));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: fullScreen ? 5 : 30,
          vertical: fullScreen ? 5 : 0,
        ),
        child: Container(
          width: double.infinity,
          height: fullScreen ? 405 : 430,
          decoration: BoxDecoration(
            color: const Color(0xffFFCF53),
            borderRadius: !fullScreen
                ? BorderRadius.circular(50)
                : const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
          ),
          child: Column(
            children: [
              _ZapatoConSombra(),
              if (!fullScreen) _ZapatoTallas(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _TallaZapatoCaja(7),
          _TallaZapatoCaja(7.5),
          _TallaZapatoCaja(8),
          _TallaZapatoCaja(8.5),
          _TallaZapatoCaja(9),
          _TallaZapatoCaja(9.5),
        ],
      ),
    );
  }
}

class _TallaZapatoCaja extends StatelessWidget {
  final double talla;

  const _TallaZapatoCaja(
    this.talla,
  );

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);

    return GestureDetector(
      onTap: () {
        final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
        zapatoModel.talla = talla;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          talla.toString().replaceAll('.0', ''),
          style: TextStyle(
            color: talla == zapatoModel.talla
                ? Colors.white
                : const Color(0xffF1A23A),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: talla == zapatoModel.talla
              ? const Color(0xffF1A23A)
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (talla == zapatoModel.talla)
              const BoxShadow(
                color: Color(0xffF1A23A),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
          ],
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  const _ZapatoConSombra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);

    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Stack(
        children: [
          Positioned(bottom: 20, right: 0, child: _ZapatoSombra()),
          Image(
            image: AssetImage(zapatoModel.assetImage),
          ),
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffEAA14E),
              blurRadius: 40,
            ),
          ],
        ),
      ),
    );
  }
}
