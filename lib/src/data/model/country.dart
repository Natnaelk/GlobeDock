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
  Country(name: 'Cyprus', image: Images.GERMANY_FLAG),
  Country(name: 'Dubai', image: Images.AUSTRALIA_FLAG),
  Country(name: 'Finland', image: Images.CANADA_FLAG),
  Country(name: 'Czech Republic', image: Images.GERMANY_FLAG),
  Country(name: 'Malaysia', image: Images.AUSTRALIA_FLAG),
  Country(name: 'Russia', image: Images.CANADA_FLAG),
  Country(name: 'South Korea', image: Images.CANADA_FLAG),
  Country(name: 'Philippines ', image: Images.CANADA_FLAG),
];

List<Country> universities = [
  Country(
      name: 'Queen Mary University of London',
      image: Images.UNIVERSITY_PLACEHOLDER),
  Country(
      name: 'Queen Mary University of London',
      image: Images.UNIVERSITY_PLACEHOLDER),
  Country(
      name: 'Queen Mary University of London',
      image: Images.UNIVERSITY_PLACEHOLDER),
];
