import '../../../data/api/api_url.dart';
import '../../app_images/app_images.dart';

class ImageHandler{
  static String imagesHandle(String? url) {
    if (url == null || url.isEmpty) {
      return AppImages.vectorImage;
    }

    if (url.startsWith('http')) {
      return url;
    } else {
      return ApiUrl.imageUrl + url;
    }
  }
}