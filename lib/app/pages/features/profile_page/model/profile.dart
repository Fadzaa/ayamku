class Profile {
  final String icon;
  final String name;
  final bool isDarkMode;
  final String? routes;

  Profile({
    required this.icon,
    required this.name,
    required this.isDarkMode,
    this.routes,
  });
}
