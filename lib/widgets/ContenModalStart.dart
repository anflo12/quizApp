// ignore: file_names
import 'package:flutter/material.dart';
import 'package:quizapp/utils/themeData.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class ContentModalStart extends StatelessWidget {
  const ContentModalStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 45),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Selecciona una dificultad",
                  style: AppTheme.textTheme.headline6
                      ?.copyWith(color: Colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          backgroundColor: AppTheme.primaryColor),
                      onPressed: null,
                      child: Text(
                        "Facíl",
                        style: AppTheme.textTheme.bodyText2,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: AppTheme.primaryColor),
                      onPressed: null,
                      child: Text(
                        "Medio",
                        style: AppTheme.textTheme.bodyText2,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: AppTheme.primaryColor),
                      onPressed: null,
                      child: Text(
                        "Pro",
                        style: AppTheme.textTheme.bodyText2,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Selecciona una categoria",
                  style: AppTheme.textTheme.headline6
                      ?.copyWith(color: Colors.black),
                ),
                const SizedBox(
                  height: 12,
                ),
                TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    style: DefaultTextStyle.of(context)
                        .style
                        .copyWith(fontSize: 14, color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "Busca o selecciona una categoria",
                      hintStyle: TextStyle(color: Colors.white),
                      fillColor: AppTheme.primaryColor,
                      filled: true,
                    ),
                  ),
                  suggestionsCallback: (pattern) {
                    return ["oki", "oki2"].toList();
                  },
                  suggestionsBoxDecoration: const SuggestionsBoxDecoration(
                    shadowColor: AppTheme.primaryColor,
                    color: AppTheme.primaryColor,
                  ),
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(
                        suggestion.toString(),
                        style: AppTheme.textTheme.headline6
                            ?.copyWith(fontWeight: FontWeight.w400),
                      ),
                    );
                  },
                  onSuggestionSelected: (suggestion) {},
                ),
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: 300,
                    decoration: const BoxDecoration(
                        gradient: AppTheme.gradientBackground),
                    child: TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Center(
                        child: Text(
                          "A jugar",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
