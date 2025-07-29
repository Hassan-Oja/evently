import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/home/tabs/Home/Add%20Event/widget/date_or_time_widget.dart';
import 'package:evently/ui/home/tabs/Home/widget/category_tab_item.dart';
import 'package:evently/ui/home/tabs/Home/widget/event_item.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:evently/widget/custom_elevated_bottom.dart';
import 'package:evently/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/theme_provider.dart';
import '../../../../../utils/app_theme.dart';

class AddEvent extends StatefulWidget {
  AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  int selectedIndex = 0;
  DateTime? selectedDate;
  String formatedDate = '';
  String formatedTime = '';
  TimeOfDay? selectedTime ;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<ThemeProvider>(context);

    List<String> eventsNameList = [
      AppLocalizations.of(context)!.category_sport,
      AppLocalizations.of(context)!.category_birthday,
      AppLocalizations.of(context)!.category_meeting,
      AppLocalizations.of(context)!.category_gaming,
      AppLocalizations.of(context)!.category_workshop,
      AppLocalizations.of(context)!.category_bookclub,
      AppLocalizations.of(context)!.category_exhibition,
      AppLocalizations.of(context)!.category_holiday,
      AppLocalizations.of(context)!.category_eating,
    ];
    List<String> eventImageList = [
      AppAssets.sportsImage,
      AppAssets.birthdayImage,
      AppAssets.meetingImage,
      AppAssets.gamingImage,
      AppAssets.workshopImage,
      AppAssets.bookClubImage,
      AppAssets.exhibitionImage,
      AppAssets.holidayImage,
      AppAssets.eatingImage,
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        title: Text(
          AppLocalizations.of(context)!.create_event,
          style: AppStyles.midum20primary,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(eventImageList[selectedIndex]),
              ),
              SizedBox(height: height * 0.02),
              SizedBox(
                height: height * 0.03,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        selectedIndex = index;
                        setState(() {});
                      },
                      child: CategoryTabItem(
                        borderColor: AppColors.primary,
                        unSelectedTextStyle: Theme.of(
                          context,
                        ).textTheme.headlineMedium!,
                        selectedTextStyle: Theme.of(
                          context,
                        ).textTheme.headlineSmall!,
                        selectedBgColor: AppColors.primary,
                        isSelected: selectedIndex == index,
                        eventName: eventsNameList[index],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: width * 0.02);
                  },
                  itemCount: eventsNameList.length,
                ),
              ),
              SizedBox(height: height * 0.02),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.title_new_event,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: height * 0.01),
                    CustomTextFormField(
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please Enter Event Title";
                        }
                        return null;
                      },
                      hintStyle: Theme.of(context).textTheme.titleMedium,
                      colorBorder: themeProvider.appTheme == ThemeMode.dark
                          ? AppColors.primary
                          : AppColors.gray,
                      controller: titleController,
                      prefixIcon: Image.asset(
                        AppAssets.newEventTitleIcon,
                        color: Theme.of(context).dividerColor,
                      ),
                      hintText: AppLocalizations.of(context)!.new_event_title,
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      AppLocalizations.of(context)!.new_description,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: height * 0.01),
                    CustomTextFormField(
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please Enter Event Description";
                        }
                        return null;
                      },
                      colorBorder: themeProvider.appTheme == ThemeMode.dark
                          ? AppColors.primary
                          : AppColors.gray,
                      hintStyle: Theme.of(context).textTheme.titleMedium,
                      maxLines: 5,
                      controller: descriptionController,
                      hintText: AppLocalizations.of(
                        context,
                      )!.new_event_description,
                    ),
                    SizedBox(height: height * 0.02),
                    DateOrTimeWidget(
                      iconName: AppAssets.calenderIcon,
                      eventDateOrTime: AppLocalizations.of(context)!.event_date,
                      chooseDateOrTime: selectedDate == null
                          ? AppLocalizations.of(context)!.choose_date
                          : formatedDate ,
                      onChooseDateOrTime: chooseDate,
                    ),
                    DateOrTimeWidget(
                      iconName: AppAssets.clockIcon,
                      eventDateOrTime: AppLocalizations.of(context)!.event_time,
                      chooseDateOrTime: selectedTime == null ?
                      AppLocalizations.of(context,)!.choose_time : formatedTime,
                      onChooseDateOrTime: chooseTime,
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      AppLocalizations.of(context)!.event_location,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: height * 0.01),
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.02,
                        vertical: height * 0.01,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.primary, width: 2),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.02,
                              vertical: height * 0.01,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColors.primary,
                            ),
                            child: Image.asset(AppAssets.locationIcon),
                          ),
                          SizedBox(width: width * 0.04),
                          Text(
                            AppLocalizations.of(context)!.choose_event_location,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: AppColors.primary,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    CustomElevatedBottom(
                      onPressed: () {
                        addEvent();
                      },
                      text: AppLocalizations.of(context)!.add_event,
                    ),
                    SizedBox(height: height * 0.02),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void chooseDate() async {
    var chooseDate = await showDatePicker(
      initialDate: DateTime.now(),
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    selectedDate = chooseDate;
    if(selectedDate != null){
      formatedDate = DateFormat('dd/MM/yyyy').format(selectedDate!);
      setState(() {});
    }
  }

  void chooseTime() async {
    var chooseDate = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    selectedTime = chooseDate ;
    if(selectedTime != null){
      formatedTime = selectedTime!.format(context);
      setState(() {

      });
    }
  }

  void addEvent() {
    if (formKey.currentState?.validate() == true) {
      //todo : add event
    }
  }
}
