class OnboardingModel {
  final String title;
  final String subtitle;
  final String? imagePath;
  final double? imageWidth;
  final double? imageHeight;
  final String? featureTitle1;
  final String? featureDesc1;
  final String? featureTitle2;
  final String? featureDesc2;
  final String? tag1;
  final String? tag2;

  OnboardingModel({
    required this.title,
    required this.subtitle,
    this.imagePath,
    this.imageWidth,
    this.imageHeight,
    this.featureTitle1,
    this.featureDesc1,
    this.featureTitle2,
    this.featureDesc2,
    this.tag1,
    this.tag2,
  });
}
