import 'package:flutter/material.dart';
import 'package:superhero_app/data/model/superhero_response_detail.dart';

class SuperheroDetailScreen extends StatelessWidget {
  final SuperheroResponseDetail superHero;
  const SuperheroDetailScreen({super.key, required this.superHero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(superHero.name)),
      body: Column(
        children: [
          Image.network(
            superHero.url,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment(0, -0.6),
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 300,
                width: double.infinity,
                color: Colors.grey,
                child: Icon(Icons.broken_image, color: Colors.white, size: 50),
              );
            },
          ),
          Text(
            superHero.name,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Text(
            "Nombre: ${superHero.fullName}",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          Text("poder: ${superHero.stats.power}")
        ],
      ),
    );
  }
}
