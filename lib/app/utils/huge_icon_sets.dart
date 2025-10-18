import 'dart:ui';

import 'package:hugeicons/hugeicons.dart';

class IconsSets {

  IconsSets._();

  // Convert your list of maps to a single map for fast lookup
  static final Map<String, dynamic> iconsMap = {
    "Store": HugeIcons.strokeRoundedStore01,
    "Shopping": HugeIcons.strokeRoundedShoppingCart01,
    "Tag": HugeIcons.strokeRoundedTag01,
    "BarCode": HugeIcons.strokeRoundedBarCode01,
    "Menu": HugeIcons.strokeRoundedMenuRestaurant,
    "Cookie": HugeIcons.strokeRoundedCookie,
    "Coffee": HugeIcons.strokeRoundedCoffee01,
    "Drink": HugeIcons.strokeRoundedDrink,
    "Natural": HugeIcons.strokeRoundedNaturalFood,
    "Organic": HugeIcons.strokeRoundedOrganicFood,
    "Pizza": HugeIcons.strokeRoundedPizza01,
    "IceCream": HugeIcons.strokeRoundedIceCream01,
    "Street Food": HugeIcons.strokeRoundedStreetFood,
    "Serving Food": HugeIcons.strokeRoundedServingFood,
    "Hotel": HugeIcons.strokeRoundedHotel01,
    "Car": HugeIcons.strokeRoundedCar01,
    "Bus": HugeIcons.strokeRoundedBus01,
    "Train": HugeIcons.strokeRoundedSpeedTrain01,
    "Airplane": HugeIcons.strokeRoundedAirplane01,
    "Fuel": HugeIcons.strokeRoundedFuel,
    "Taxi": HugeIcons.strokeRoundedTaxi,
    "Parking": HugeIcons.strokeRoundedParkingAreaCircle,
    "Ship": HugeIcons.strokeRoundedCargoShip,
    "Motorbike": HugeIcons.strokeRoundedMotorbike01,
    "Home": HugeIcons.strokeRoundedHome03,
    "TrafficLight": HugeIcons.strokeRoundedTrafficLight,
    "Bulb": HugeIcons.strokeRoundedBulb,
    "Tools": HugeIcons.strokeRoundedTools,
    "Wifi": HugeIcons.strokeRoundedHomeWifi,
    "CreditCard": HugeIcons.strokeRoundedBitcoinCreditCard,
    "Money": HugeIcons.strokeRoundedMoney01,
    "Bank": HugeIcons.strokeRoundedBank,
    "Invoice": HugeIcons.strokeRoundedInvoice,
    "Telephone": HugeIcons.strokeRoundedTelephone,
    "Television": HugeIcons.strokeRoundedTelevisionTable,
    "Hospital": HugeIcons.strokeRoundedHospital02,
    "Computer": HugeIcons.strokeRoundedComputer,
    "Book": HugeIcons.strokeRoundedBook01,
    "School": HugeIcons.strokeRoundedSchool,
    "Library": HugeIcons.strokeRoundedLibrary,
    "Printer": HugeIcons.strokeRoundedPrinter,
    "Baby": HugeIcons.strokeRoundedBaby01,
    "Restaurant": HugeIcons.strokeRoundedRestaurant,
    "Food & Drink": HugeIcons.strokeRoundedSpoonAndFork,
    "Doctor": HugeIcons.strokeRoundedDoctor01,
    "Education": HugeIcons.strokeRoundedStudyDesk,
    "Gift": HugeIcons.strokeRoundedGift,
    "Maintenance": HugeIcons.strokeRoundedLicenseMaintenance,
    "Milk": HugeIcons.strokeRoundedMilkBottle,
    "Tea": HugeIcons.strokeRoundedTea,
    "Wallet": HugeIcons.strokeRoundedWallet01,
    "Cash": HugeIcons.strokeRoundedCash01,
    "Trading": HugeIcons.strokeRoundedAppleStocks,
    "Salary": HugeIcons.strokeRoundedSaveMoneyDollar,
    "Electricity": HugeIcons.strokeRoundedPlugSocket,
    "Medicine": HugeIcons.strokeRoundedMedicine01,
    "Vacation": HugeIcons.strokeRoundedBeach,
    "Movie": HugeIcons.strokeRoundedFilmRoll02,
    "Jewellery": HugeIcons.strokeRoundedEarRings02,
    "Electronics": HugeIcons.strokeRoundedChip,
    "Entertainment": HugeIcons.strokeRoundedGame,
    "Health": HugeIcons.strokeRoundedHealth,
    "Tax": HugeIcons.strokeRoundedTaxes,
    "Birthday": HugeIcons.strokeRoundedBirthdayCake,
    "Cricket": HugeIcons.strokeRoundedCricketBat,
    "Ticket": HugeIcons.strokeRoundedTicket01,
    "Labor": HugeIcons.strokeRoundedLabor,
    "Interest": HugeIcons.strokeRoundedMoneyReceive01,
    "Savings": HugeIcons.strokeRoundedPiggyBank,
    "Profit": HugeIcons.strokeRoundedProfit,
    "Discount": HugeIcons.strokeRoundedDiscount,
    "Voucher": HugeIcons.strokeRoundedCoupon01,
    "Miscellaneous": HugeIcons.strokeRoundedMenuCircle,
    "Emergency": HugeIcons.strokeRoundedAlert01,
    "Other": HugeIcons.strokeRoundedMore,
    "Charity": HugeIcons.strokeRoundedCharity,
    "Party": HugeIcons.strokeRoundedParty,
    "Wedding": HugeIcons.strokeRoundedWedding,
    "Perfume": HugeIcons.strokeRoundedPerfume,
    "Dryer": HugeIcons.strokeRoundedHairDryer,
    "Gardening": HugeIcons.strokeRoundedPlant02,
    "Cleaning": HugeIcons.strokeRoundedClean,
    "Furnished": HugeIcons.strokeRoundedSofa01,
    "Internet": HugeIcons.strokeRoundedInternet,
    "Yoga": HugeIcons.strokeRoundedYoga02,
    "Dental": HugeIcons.strokeRoundedDentalCare,
    "Gym": HugeIcons.strokeRoundedEquipmentGym03,
    "Juice": HugeIcons.strokeRoundedSoftDrink02,
    "Water": HugeIcons.strokeRoundedRainDrop

  };

  static HugeIcon? getIconByKeyBySize(String key, double? size) {
    return HugeIcon(icon: iconsMap[key], size: size,); // O(1) lookup
  }


  static HugeIcon? getIconByKey(String key) {
    return HugeIcon(icon: iconsMap[key], color: Color(0xff1f6a4e),); // O(1) lookup
  }
}
