import '../../widgets.dart';

class lineChartTitlesWidget {
  final List<String> titles;
  final TextStyle style;
  final int gapsBetweenTitles;
  final TextAlign textAlign;

  lineChartTitlesWidget({
    required this.titles,
    required this.style,
    this.gapsBetweenTitles = 1,
    this.textAlign = TextAlign.left,
  });

  Widget getTitlesWidget(double value, TitleMeta meta) {
    int index = value.toInt();
    if (index >= 0 && index < titles.length) {
      return Center(
        child: Text(
          titles[index],
          style: style,
          textAlign: textAlign,
        ),
      );
    }
    return Container();
  }
}

