class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final String? playStoreLink;
  final String? appStoreLink;
  final String? appGalleryLink;
  final String? microsoftStoreLink;
  final String? demoLink;
  final String? imageUrl;

  const Project({
    required this.title,
    required this.description,
    required this.technologies,
    this.playStoreLink,
    this.appStoreLink,
    this.appGalleryLink,
    this.microsoftStoreLink,
    this.demoLink,
    this.imageUrl,
  });
}

class SocialLink {
  final String platform;
  final String url;
  final String iconUrl; // URL from FontAwesome or similar if needed

  const SocialLink({
    required this.platform,
    required this.url,
    required this.iconUrl,
  });
}




