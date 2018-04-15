class Project {
  final String name;
  final String company;
  final String price;
  final String duration;

  Project(this.name, this.company, this.price, this.duration);

  static List<Project> getDefaultProjectList() {

    List<Project> _projects = ([
      new Project("Star Finder App", "NASA", "160/hr", "6 months"),
      new Project("Fintech Website", "Chase", "180/hr", "4 months"),
      new Project("Mobile Game", "Runescape", "140/hr", "12 months"),
    ]);

    return _projects;
  }
}
