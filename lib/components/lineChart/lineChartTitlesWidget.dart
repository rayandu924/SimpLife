import '../../widgets.dart';

class lineChartTitlesWidget {
  final List<String> titles;
  final TextStyle style;
  final int gapsBetweenTitles;
  final TextAlign textAlign;
  final bool isLooped;

  lineChartTitlesWidget({
    this.titles = const ['ERROR'],
    this.style = Title1,
    this.gapsBetweenTitles = 1,
    this.textAlign = TextAlign.center,
    this.isLooped = false, // variable ajoutée
  });

  Widget getTitlesWidgetDefault(double value, TitleMeta meta) {
    int index = value.toInt();
    if (isLooped) {
      index = index % titles.length; // boucler à travers les titres
    }
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

  Widget getTitlesWidgetInteger(double value, TitleMeta meta) {
    int index = value.toInt();
    return Center(
      child: Text(
        index.toString(),
        style: style,
        textAlign: textAlign,
      ),
    );
  }
}
