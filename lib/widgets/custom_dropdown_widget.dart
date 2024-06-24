import 'package:ecommerce_task/utils/app_colors.dart';
import 'package:provider/provider.dart';
import '../l10n/l10n.dart';
import '../provider/locale_provider.dart';
import 'package:flutter/material.dart';

class CustomDropDownWidget extends StatelessWidget {
  const CustomDropDownWidget({super.key, required this.provider,});

  final LocaleProvider provider;

  @override
  Widget build(BuildContext context) {

    return Container(
      color: AppColors.ratingColor,
      height: 50,
      width: 70,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<Locale>(
            iconEnabledColor: Colors.white,
            dropdownColor: Colors.blue,
            onChanged: (d){},
            value: provider.locale?? const Locale("en"),

            items:L10n.all.map<DropdownMenuItem<Locale>>((value) {
              return DropdownMenuItem<Locale>(
                value: value,
                child: Text(value.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                onTap: (){
                  final provider = Provider.of<LocaleProvider>(context, listen: false);
                  provider.setLocale(value);
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}