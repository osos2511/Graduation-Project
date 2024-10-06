class ApiEndPoints{
 static const String BaseUrl ="https://semsark.xyz/api/";
 static const String BasePriceUrl="http://semsark.xyz/api/";
 static _endPoints AllPropertyApi=_endPoints();

}
class _endPoints{
  final String Register="register";
  final String Login="login";
  final String Properties="properties";
  final String SearchLocation="properties/by-location/";
  final String propertytype="properties/by-type/";
  final String propertyprice="properties/prices?";
  final String BedRooms="property/bedrooms/";
  final String Rating="storerating";
  final String BathRooms="properties/by-bathrooms/";
  final String Area="property/area/";
  final String GetProfile="profile";
  final String EditProfile="user/edit";

}