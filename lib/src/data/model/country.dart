import 'package:globedock/src/common/images.dart';

class Country {
  final String name;
  final String image;

  Country({required this.name, required this.image});
}

List<Country> countries = [
  Country(name: 'USA', image: Images.US_FLAG),
  Country(name: 'UK', image: Images.UK_FLAG),
  Country(name: 'Poland', image: Images.POLAND_FLAG),
  Country(name: 'Germany', image: Images.GERMANY_FLAG),
  Country(name: 'Australia', image: Images.AUSTRALIA_FLAG),
  Country(name: 'Canada', image: Images.CANADA_FLAG),
  Country(name: 'Canada', image: Images.CANADA_FLAG),
  Country(name: 'Canada', image: Images.CANADA_FLAG),
  Country(name: 'Canada', image: Images.CANADA_FLAG),
];
