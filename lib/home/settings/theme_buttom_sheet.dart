import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../providers/app_config_provider.dart';
class LanguageButtomSheet extends StatefulWidget {
  const LanguageButtomSheet({super.key});

  @override
  State<LanguageButtomSheet> createState() => _LanguageButtomSheetState();
}

class _LanguageButtomSheetState extends State<LanguageButtomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: (){
              ///change to english
            provider.changeLanguage('en');
            },
            child: provider.appLanguage == 'en'?
                getSelectedItemWidget(AppLocalizations.of(context)!.english):
            getUnSelectedItemWidget(AppLocalizations.of(context)!.english)
          ),

          SizedBox(height: 15),

          InkWell(
            onTap: (){
              ///change to arabic
            provider.changeLanguage('ar');
            },
            child: provider.appLanguage == 'ar'?
            getSelectedItemWidget(AppLocalizations.of(context)!.arabic):
            getUnSelectedItemWidget(AppLocalizations.of(context)!.arabic)

          )
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).primaryColor)
        ),
        Icon(Icons.check, size: 35,color: Theme.of(context).primaryColor)
      ],
    );
  }
  Widget getUnSelectedItemWidget(String text){
    return Text(text,
        style: Theme.of(context).textTheme.bodyMedium);
  }
}
