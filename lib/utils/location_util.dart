const GOOGLE_API_KEY = 'AIzaSyCbSnVZ15JUkLxWhD1VLXjpqnC4Y01aC0M';

class LocationUtils {
  static String generateLocatioPreviewImage({
    double latitude = 0,
    double longitude = 0,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }
}
