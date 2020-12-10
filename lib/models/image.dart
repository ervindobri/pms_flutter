

class Image{
  String fileName;
  String url;
  String localization;
  String description;
  String date;
  double tDSM;
  double tDSS;

  Image(this.fileName, this.url, this.localization,[ this.description = "", this.date = "",
      this.tDSM = 0.0, this.tDSS = 0.0]);

  @override
  String toString() {
    return 'Image{localization: $localization, fileName: $fileName, description: $description, date: $date, tDSM: $tDSM, tDSS: $tDSS}';
  }

}