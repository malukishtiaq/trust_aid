import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

import 'i_location_service.dart';

@Injectable(as: ILocationService)
class LocationService implements ILocationService {
  @override
  Future<Position?> getCurrentLocation() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return null;
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
