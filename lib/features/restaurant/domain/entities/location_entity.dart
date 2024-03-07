class LocationEntity {
  final String address1;
  final String address2;
  final String address3;
  final String city;
  final String zipCode;
  final String country;
  final String state;
  final List<String> displayAddress;

  LocationEntity({
    required this.address1,
    required this.address2,
    required this.address3,
    required this.city,
    required this.zipCode,
    required this.country,
    required this.state,
    required this.displayAddress,
  });
}
