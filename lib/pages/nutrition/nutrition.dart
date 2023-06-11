import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:health/components/tabBar.dart';
import 'package:health/components/constants.dart';
import 'package:http/http.dart' as http;
import 'model/model.dart';
import 'components/my_nutrition_button.dart';

class Nutrition extends StatefulWidget {
  @override
  _NutritionState createState() => _NutritionState();
}

class _NutritionState extends State<Nutrition> {
  TextEditingController _queryController = TextEditingController();
  List<Beslenme> _result = [];

  Future<void> fetchNutritionData(String query) async {
    final url =
        Uri.parse('https://api.api-ninjas.com/v1/nutrition?query=$query');
    final response = await http.get(
      url,
      headers: {'X-Api-Key': 'bD6jXsZbS2olgz2XRBNuYg==WLZpgshaeZVUxOv8'},
    );
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      List<Beslenme> beslenmeler = [];
      for (var item in jsonData) {
        beslenmeler.add(Beslenme.fromJson(item));
      }
      setState(() {
        _result.insertAll(0, beslenmeler);
      });
    } else {
      setState(() {
        _result = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Column(
              children: [
                Text('NUTRITIONS',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontFamily: 'BrunoAce',
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 220,
                      height: 60,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                        controller: _queryController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32),
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 2),
                            ),
                            fillColor: Theme.of(context).colorScheme.secondary,
                            filled: true,
                            hintText: 'SEARCH FOOD',
                            focusColor: Theme.of(context).colorScheme.primary,
                            hintStyle: kLabelTextStyle),
                        cursorColor: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    MyNutritionButton(
                      onTap: () {
                        fetchNutritionData(_queryController.text);
                      },
                      text: 'Search',
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: _result.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 200,
                              width: 350,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage(
                                        'assets/fitness/fruit.jpg',
                                      ),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(32),
                                  color: Colors.limeAccent[400]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    _result[index].name ?? '',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Bungee',
                                        fontSize: 35),
                                  ),
                                  Text(
                                    'Calories: ${_result[index].calories ?? 0.0} kcal',
                                    style: kLabelTextStyle,
                                  ),
                                  Text(
                                    'sugar: ${_result[index].sugarG ?? 0.0} gr',
                                    style: kLabelTextStyle,
                                  ),
                                  Text(
                                    'protein: ${_result[index].proteinG ?? 0.0} gr',
                                    style: kLabelTextStyle,
                                  ),
                                  Text(
                                    'kolestrol: ${_result[index].cholesterolMg ?? 0.0} mg',
                                    style: kLabelTextStyle,
                                  ),
                                  Text(
                                    'Karbonhidrat: ${_result[index].carbohydratesTotalG ?? 0.0} gr',
                                    style: kLabelTextStyle,
                                  ),
                                ],
                              )),
                        ],
                      ));
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
