import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    /*
  status = 0 -> belum masuk tanggalnya
  status = 1 -> happy
  status = 2 -> biasa aja
  status = 3 -> sedih
  */
    int status = 0;

    IconData icon;
    Color iconColor;
    double iconSize;

    switch (status) {
      case 1:
        icon = FontAwesomeIcons.faceFrown;
        iconColor = AppColors.pastelRed;
        iconSize = 30.0;
        break;
      case 2:
        icon = FontAwesomeIcons.faceMeh;
        iconColor = AppColors.successStreak;
        iconSize = 30.0;
        break;
      case 3:
        icon = FontAwesomeIcons.faceLaugh;
        iconColor = AppColors.pastelGreenHealth;
        iconSize = 30.0;
        break;
      default:
        icon = FontAwesomeIcons.circle;
        iconColor = AppColors.activeCalendar;
        iconSize = 30.0;
    }

    return Scaffold(
      body: Center(
        child: Container(
          child: EasyDateTimeLine(
            initialDate: DateTime.now(),
            onDateChange: (selectedDate) {
              //selectedDate
            },

            //HEADER
            headerProps: EasyHeaderProps(
                monthPickerType: MonthPickerType.switcher,
                // ignore: deprecated_member_use
                selectedDateFormat: SelectedDateFormat.fullDateDMonthAsStrY,
                monthStyle: TextStyles.bold_24,
                selectedDateStyle: TextStyles.bold_24),

            //CONTAINER DAY
            dayProps: EasyDayProps(
              height: 130,
              width: 70,
              //ACTIVE STYLE
              activeDayStyle: DayStyle(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32),
                      ),
                      color: AppColors.baseColor),
                  dayNumStyle: TextStyles.bold_24,
                  dayStrStyle: TextStyles.bold_16,
                  monthStrStyle: TextStyles.regular_14),

              //INACTIVE STYLE
              inactiveDayStyle: DayStyle(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                  color: AppColors.inactiveCalendar,
                ),
                dayNumStyle: TextStyles.regular_16,
                dayStrStyle: TextStyles.regular_14,
                monthStrStyle: TextStyles.regular_14,
              ),

              //DAY BUILDER
            ),

            //TIMELINE
            timeLineProps: EasyTimeLineProps(separatorPadding: 8),

            //DAYBUILDER
            itemBuilder: ((context, dayNumber, dayName, monthName, fullDate,
                isSelected) {
              return Container(
                height: 130,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                    color: isSelected
                        ? AppColors.baseColor
                        : AppColors.inactiveCalendar),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected
                              ? AppColors.baseColor
                              : AppColors.activeCalendar),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(dayName, style: TextStyles.regular_14),
                          Text(
                            dayNumber,
                            style: TextStyles.bold_16,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),

                    //ICON
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.solidSmile,
                            size: 40,
                            color: AppColors.pastelGreenHealth,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
