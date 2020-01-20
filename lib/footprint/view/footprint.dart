import 'package:flutter/material.dart';
import 'package:footprint_calculator/footprint/bloc/footprint_bloc.dart';
import 'package:provider/provider.dart';

Provider footprint() => Provider<FootprintBloc>(
      create: (_) => FootprintBloc(),
      child: Footprint(),
    );

class Footprint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //child: _statsPlaceHolder(),
      child: Stack(
        children: <Widget>[
          StatsPlaceholder(),
          CalculatorButton(),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //FootprintBloc bloc = Provider.of<FootprintBloc>(context);
    return Positioned(
      child: FloatingActionButton(
        //onPressed: () => bloc.navigateToFootprintStep1(context),
        child: Icon(Icons.add),
      ),
      bottom: 16,
      right: 16,
    );
  }
}


class StatsPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset(
                "assets/icons/stats.png",
                height: 80.0,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Aquí aparecerán tus estadísticas una vez calcules tu huella.",
                  textAlign: TextAlign.center,
                ))
          ],
        ),
      ),
    );
  }
}
