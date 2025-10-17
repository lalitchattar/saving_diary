import 'package:hugeicons/hugeicons.dart';

class IconsSets {
  IconsSets._();

  // Convert your list of maps to a single map for fast lookup
  static final Map<String, HugeIcon> iconsMap = {
    "Store": HugeIcon(icon: HugeIcons.strokeRoundedStore01),
    "Shopping": HugeIcon(icon: HugeIcons.strokeRoundedShoppingCart01),
    "Tag": HugeIcon(icon: HugeIcons.strokeRoundedTag01),
    "BarCode": HugeIcon(icon: HugeIcons.strokeRoundedBarCode01),
    "Menu": HugeIcon(icon: HugeIcons.strokeRoundedMenuRestaurant),
    "Cookie": HugeIcon(icon: HugeIcons.strokeRoundedCookie),
    "Coffee": HugeIcon(icon: HugeIcons.strokeRoundedCoffee01),
    "Drink": HugeIcon(icon: HugeIcons.strokeRoundedDrink),
    "Natural Food": HugeIcon(icon: HugeIcons.strokeRoundedNaturalFood),
    "Organic Food": HugeIcon(icon: HugeIcons.strokeRoundedOrganicFood),
    "Pizza": HugeIcon(icon: HugeIcons.strokeRoundedPizza01),
    "IceCream": HugeIcon(icon: HugeIcons.strokeRoundedIceCream01),
    "Street Food": HugeIcon(icon: HugeIcons.strokeRoundedStreetFood),
    "Serving Food": HugeIcon(icon: HugeIcons.strokeRoundedServingFood),
    "Hotel": HugeIcon(icon: HugeIcons.strokeRoundedHotel01),
    "Car": HugeIcon(icon: HugeIcons.strokeRoundedCar01),
    "Bus": HugeIcon(icon: HugeIcons.strokeRoundedBus01),
    "Train": HugeIcon(icon: HugeIcons.strokeRoundedSpeedTrain01),
    "Airplane": HugeIcon(icon: HugeIcons.strokeRoundedAirplane01),
    "Fuel": HugeIcon(icon: HugeIcons.strokeRoundedFuel),
    "Taxi": HugeIcon(icon: HugeIcons.strokeRoundedTaxi),
    "Parking": HugeIcon(icon: HugeIcons.strokeRoundedParkingAreaCircle),
    "Ship": HugeIcon(icon: HugeIcons.strokeRoundedCargoShip),
    "Motorbike": HugeIcon(icon: HugeIcons.strokeRoundedMotorbike01),
    "Home": HugeIcon(icon: HugeIcons.strokeRoundedHome03),
    "TrafficLight": HugeIcon(icon: HugeIcons.strokeRoundedTrafficLight),
    "Bulb": HugeIcon(icon: HugeIcons.strokeRoundedBulb),
    "Tools": HugeIcon(icon: HugeIcons.strokeRoundedTools),
    "Wifi": HugeIcon(icon: HugeIcons.strokeRoundedHomeWifi),
    "CreditCard": HugeIcon(icon: HugeIcons.strokeRoundedBitcoinCreditCard),
    "Money": HugeIcon(icon: HugeIcons.strokeRoundedMoney01),
    "Bank": HugeIcon(icon: HugeIcons.strokeRoundedBank),
    "Invoice": HugeIcon(icon: HugeIcons.strokeRoundedInvoice),
    "Telephone": HugeIcon(icon: HugeIcons.strokeRoundedTelephone),
    "Television": HugeIcon(icon: HugeIcons.strokeRoundedTelevisionTable),
    "Hospital": HugeIcon(icon: HugeIcons.strokeRoundedHospital02),
    "Computer": HugeIcon(icon: HugeIcons.strokeRoundedComputer),
    "Book": HugeIcon(icon: HugeIcons.strokeRoundedBook01),
    "School": HugeIcon(icon: HugeIcons.strokeRoundedSchool),
    "Library": HugeIcon(icon: HugeIcons.strokeRoundedLibrary),
    "Printer": HugeIcon(icon: HugeIcons.strokeRoundedPrinter),
    "Gif": HugeIcon(icon: HugeIcons.strokeRoundedGif01),
    "Baby": HugeIcon(icon: HugeIcons.strokeRoundedBaby01),
    "Restaurant": HugeIcon(icon: HugeIcons.strokeRoundedRestaurant),
  };

  static HugeIcon? getIconByKey(String key) {
    return iconsMap[key]; // O(1) lookup
  }
}
