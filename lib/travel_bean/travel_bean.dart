class TravelBean {
  String name;
  String location;
  String url;

  TravelBean(this.name, this.location, this.url);

  static List<TravelBean> generateTravelBean() {
    return [
      TravelBean("Peach", "Spain ES1", "assets/images0/top1.jpg"),
      TravelBean("Grassland", "Spain ES2", "assets/images0/top2.jpg"),
      TravelBean("Starry sky", "Spain ES3", "assets/images0/top3.jpg"),
      TravelBean("Beauty Pic", "Spain ES4", "assets/images0/top4.jpg"),
    ];
  }

  static List<TravelBean> generateMostPopularBean() {
    return [
      TravelBean("Peach", "Spain ES", "assets/images0/bottom1.jpg"),
      TravelBean("Grassland", "Spain ES", "assets/images0/bottom2.jpg"),
      TravelBean("Starry sky", "Spain ES", "assets/images0/bottom3.jpg"),
      TravelBean("Beauty Pic", "Spain ES", "assets/images0/bottom4.jpg"),
    ];
  }
}
