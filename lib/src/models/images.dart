class Images {
  String imgXs;
  String imgSm;
  String imgMd;
  String imgLg;

  Images({
    this.imgXs,
    this.imgSm,
    this.imgMd,
    this.imgLg
  });

  Images.fromJsonMap(Map<String, dynamic> json) {
    this.imgXs = json['xs'];
    this.imgSm = json['sm'];
    this.imgMd = json['md'];
    this.imgLg = json['lg'];
  }
}