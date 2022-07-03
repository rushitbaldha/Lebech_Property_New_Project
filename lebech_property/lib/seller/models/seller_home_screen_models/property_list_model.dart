// import 'dart:convert';
//
// PropertyListModule propertyListModuleFromJson(String str) => PropertyListModule.fromJson(json.decode(str));
//
// String propertyListModuleToJson(PropertyListModule data) => json.encode(data.toJson());
//
// class PropertyListModule {
//   PropertyListModule({
//     required this.status,
//     required this.message,
//     required this.data,
//   });
//
//   bool status;
//   String message;
//   Data data;
//
//   factory PropertyListModule.fromJson(Map<String, dynamic> json) => PropertyListModule(
//     status: json["status"] ?? false,
//     message: json["message"] ?? "",
//     data: Data.fromJson(json["data"] ?? {}),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "data": data.toJson(),
//   };
// }
//
// class Data {
//   Data({
//     required this.data,
//   });
//
//   List<Datum> data;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x ?? {}))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//   };
// }
//
// class Datum {
//   Datum({
//     this.id,
//     this.title,
//     this.carpetArea,
//     this.superArea,
//     this.rent,
//     this.createdAt,
//     this.cityId,
//     this.propertyTypeId,
//     this.status,
//     this.detail,
//     this.propertyTenant,
//     this.propertyOwner,
//     this.propertyImages,
//     this.city,
//     this.propertyType,
//   });
//
//   int id;
//   String title;
//   String carpetArea;
//   String superArea;
//   Rent rent;
//   String createdAt;
//   int cityId;
//   int propertyTypeId;
//   String status;
//   String detail;
//   PropertyTenant propertyTenant;
//   PropertyOwner propertyOwner;
//   List<PropertyImage> propertyImages;
//   City city;
//   PropertyType propertyType;
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//     id: json["id"],
//     title: json["title"],
//     carpetArea: json["carpet_area"] == null ? null : json["carpet_area"],
//     superArea: json["super_area"] == null ? null : json["super_area"],
//     rent: Rent.fromJson(json["rent"]),
//     createdAt: DateTime.parse(json["created_at"]),
//     cityId: json["city_id"],
//     propertyTypeId: json["property_type_id"],
//     status: json["status"],
//     detail: json["detail"],
//     propertyTenant: PropertyTenant.fromJson(json["property_tenant"]),
//     propertyOwner: PropertyOwner.fromJson(json["property_owner"]),
//     propertyImages: List<PropertyImage>.from(json["property_images"].map((x) => PropertyImage.fromJson(x))),
//     city: City.fromJson(json["city"]),
//     propertyType: PropertyType.fromJson(json["property_type"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//     "carpet_area": carpetArea == null ? null : carpetArea,
//     "super_area": superArea == null ? null : superArea,
//     "rent": rent.toJson(),
//     "created_at": "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
//     "city_id": cityId,
//     "property_type_id": propertyTypeId,
//     "status": status,
//     "detail": detail,
//     "property_tenant": propertyTenant.toJson(),
//     "property_owner": propertyOwner.toJson(),
//     "property_images": List<dynamic>.from(propertyImages.map((x) => x.toJson())),
//     "city": city.toJson(),
//     "property_type": propertyType.toJson(),
//   };
// }
//
// class City {
//   City({
//     this.id,
//     this.name,
//     this.status,
//     this.stateId,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   int id;
//   String name;
//   String status;
//   int stateId;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   factory City.fromJson(Map<String, dynamic> json) => City(
//     id: json["id"],
//     name: json["name"],
//     status: json["status"],
//     stateId: json["state_id"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "status": status,
//     "state_id": stateId,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//   };
// }
//
// class PropertyImage {
//   PropertyImage({
//     this.id,
//     this.image,
//     this.propertyImageDefault,
//     this.status,
//     this.propertyId,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   int id;
//   String image;
//   String propertyImageDefault;
//   String status;
//   int propertyId;
//   String createdAt;
//   String updatedAt;
//
//   factory PropertyImage.fromJson(Map<String, dynamic> json) => PropertyImage(
//     id: json["id"],
//     image: json["image"],
//     propertyImageDefault: json["default"],
//     status: json["status"],
//     propertyId: json["property_id"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "image": image,
//     "default": propertyImageDefault,
//     "status": status,
//     "property_id": propertyId,
//     "created_at": createdAt,
//     "updated_at": updatedAt,
//   };
// }
//
// class PropertyOwner {
//   PropertyOwner({
//     this.id,
//     this.age,
//     this.occupation,
//     this.restrictionVisitors,
//     this.restrictionTenant,
//     this.businessman,
//     this.selfEmployed,
//     this.salaried,
//     this.goverment,
//     this.retired,
//     this.noPreference,
//     this.callDay,
//     this.call9Am12Pm,
//     this.call12Pm3Pm,
//     this.call3Pm6Pm,
//     this.call6Pm9Pm,
//     this.callAnytime,
//     this.utility,
//     this.security,
//     this.occupants,
//     this.crossVentilation,
//     this.commonWall,
//     this.fromTime,
//     this.toTime,
//     this.propertyId,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   int id;
//   String age;
//   String occupation;
//   String restrictionVisitors;
//   String restrictionTenant;
//   String businessman;
//   String selfEmployed;
//   String salaried;
//   String goverment;
//   String retired;
//   String noPreference;
//   String callDay;
//   String call9Am12Pm;
//   String call12Pm3Pm;
//   String call3Pm6Pm;
//   String call6Pm9Pm;
//   String callAnytime;
//   String utility;
//   String security;
//   String occupants;
//   String crossVentilation;
//   String commonWall;
//   String fromTime;
//   String toTime;
//   int propertyId;
//   String createdAt;
//   String updatedAt;
//
//   factory PropertyOwner.fromJson(Map<String, dynamic> json) => PropertyOwner(
//     id: json["id"],
//     age: json["age"],
//     occupation: json["occupation"],
//     restrictionVisitors: json["restriction_visitors"],
//     restrictionTenant: json["restriction_tenant"],
//     businessman: json["businessman"],
//     selfEmployed: json["self_employed"],
//     salaried: json["salaried"],
//     goverment: json["goverment"],
//     retired: json["retired"],
//     noPreference: json["no_preference"],
//     callDay: json["call_day"],
//     call9Am12Pm: json["call_9am_12pm"],
//     call12Pm3Pm: json["call_12pm_3pm"],
//     call3Pm6Pm: json["call_3pm_6pm"],
//     call6Pm9Pm: json["call_6pm_9pm"],
//     callAnytime: json["call_anytime"],
//     utility: json["utility"],
//     security: json["security"] == null ? null : json["security"],
//     occupants: json["occupants"] == null ? null : json["occupants"],
//     crossVentilation: json["cross_ventilation"] == null ? null : json["cross_ventilation"],
//     commonWall: json["common_wall"],
//     fromTime: json["from_time"] == null ? null : json["from_time"],
//     toTime: json["to_time"] == null ? null : json["to_time"],
//     propertyId: json["property_id"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "age": age,
//     "occupation": occupation,
//     "restriction_visitors": restrictionVisitors,
//     "restriction_tenant": restrictionTenant,
//     "businessman": businessman,
//     "self_employed": selfEmployed,
//     "salaried": salaried,
//     "goverment": goverment,
//     "retired": retired,
//     "no_preference": noPreference,
//     "call_day": callDay,
//     "call_9am_12pm": call9Am12Pm,
//     "call_12pm_3pm": call12Pm3Pm,
//     "call_3pm_6pm": call3Pm6Pm,
//     "call_6pm_9pm": call6Pm9Pm,
//     "call_anytime": callAnytime,
//     "utility": utility,
//     "security": security == null ? null : security,
//     "occupants": occupants == null ? null : occupants,
//     "cross_ventilation": crossVentilation == null ? null : crossVentilation,
//     "common_wall": commonWall,
//     "from_time": fromTime == null ? null : fromTime,
//     "to_time": toTime == null ? null : toTime,
//     "property_id": propertyId,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//   };
// }
//
// class PropertyTenant {
//   PropertyTenant({
//     this.id,
//     this.bachelors,
//     this.nonVegetarians,
//     this.pets,
//     this.companyLease,
//     this.poojaRoom,
//     this.study,
//     this.store,
//     this.servantRoom,
//     this.facing,
//     this.garden,
//     this.pool,
//     this.mainRoad,
//     this.carParking,
//     this.lift,
//     this.flatFloor,
//     this.water,
//     this.electricity,
//     this.ceramicTiles,
//     this.granite,
//     this.marble,
//     this.marbonite,
//     this.mosaic,
//     this.normal,
//     this.vitrified,
//     this.wooden,
//     this.gym,
//     this.jogging,
//     this.liftAvailable,
//     this.pipeGas,
//     this.powerBackup,
//     this.reservedParking,
//     this.security,
//     this.swimmingPool,
//     this.intrestingDetail,
//     this.nearBy,
//     this.owner,
//     this.totalCarParking,
//     this.coveredCarParking,
//     this.openCarParking,
//     this.propertyId,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   int id;
//   String bachelors;
//   String nonVegetarians;
//   String pets;
//   String companyLease;
//   String poojaRoom;
//   String study;
//   String store;
//   String servantRoom;
//   String facing;
//   String garden;
//   String pool;
//   String mainRoad;
//   String carParking;
//   String lift;
//   String flatFloor;
//   String water;
//   String electricity;
//   String ceramicTiles;
//   String granite;
//   String marble;
//   String marbonite;
//   String mosaic;
//   String normal;
//   String vitrified;
//   String wooden;
//   String gym;
//   String jogging;
//   String liftAvailable;
//   String pipeGas;
//   String powerBackup;
//   String reservedParking;
//   String security;
//   String swimmingPool;
//   String intrestingDetail;
//   String nearBy;
//   String owner;
//   int totalCarParking;
//   int coveredCarParking;
//   int openCarParking;
//   int propertyId;
//   String createdAt;
//   String updatedAt;
//
//   factory PropertyTenant.fromJson(Map<String, dynamic> json) => PropertyTenant(
//     id: json["id"],
//     bachelors: json["bachelors"],
//     nonVegetarians: json["non_vegetarians"],
//     pets: json["pets"],
//     companyLease: json["company_lease"],
//     poojaRoom: json["pooja_room"],
//     study: json["study"],
//     store: json["store"],
//     servantRoom: json["servant_room"],
//     facing: json["facing"],
//     garden: json["garden"],
//     pool: json["pool"],
//     mainRoad: json["main_road"],
//     carParking: json["car_parking"],
//     lift: json["lift"],
//     flatFloor: json["flat_floor"],
//     water: json["water"],
//     electricity: json["electricity"],
//     ceramicTiles: json["ceramic_tiles"],
//     granite: json["granite"],
//     marble: json["marble"],
//     marbonite: json["marbonite"],
//     mosaic: json["mosaic"],
//     normal: json["normal"],
//     vitrified: json["vitrified"],
//     wooden: json["wooden"],
//     gym: json["gym"],
//     jogging: json["jogging"],
//     liftAvailable: json["lift_available"],
//     pipeGas: json["pipe_gas"],
//     powerBackup: json["power_backup"],
//     reservedParking: json["reserved_parking"],
//     security: json["security"],
//     swimmingPool: json["swimming_pool"],
//     intrestingDetail: json["intresting_detail"],
//     nearBy: json["near_by"] == null ? null : json["near_by"],
//     owner: json["owner"],
//     totalCarParking: json["total_car_parking"] == null ? null : json["total_car_parking"],
//     coveredCarParking: json["covered_car_parking"] == null ? null : json["covered_car_parking"],
//     openCarParking: json["open_car_parking"] == null ? null : json["open_car_parking"],
//     propertyId: json["property_id"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "bachelors": bachelors,
//     "non_vegetarians": nonVegetarians,
//     "pets": pets,
//     "company_lease": companyLease,
//     "pooja_room": poojaRoom,
//     "study": study,
//     "store": store,
//     "servant_room": servantRoom,
//     "facing": facing,
//     "garden": garden,
//     "pool": pool,
//     "main_road": mainRoad,
//     "car_parking": carParking,
//     "lift": lift,
//     "flat_floor": flatFloor,
//     "water": water,
//     "electricity": electricity,
//     "ceramic_tiles": ceramicTiles,
//     "granite": granite,
//     "marble": marble,
//     "marbonite": marbonite,
//     "mosaic": mosaic,
//     "normal": normal,
//     "vitrified": vitrified,
//     "wooden": wooden,
//     "gym": gym,
//     "jogging": jogging,
//     "lift_available": liftAvailable,
//     "pipe_gas": pipeGas,
//     "power_backup": powerBackup,
//     "reserved_parking": reservedParking,
//     "security": security,
//     "swimming_pool": swimmingPool,
//     "intresting_detail": intrestingDetail,
//     "near_by": nearBy == null ? null : nearBy,
//     "owner": owner,
//     "total_car_parking": totalCarParking == null ? null : totalCarParking,
//     "covered_car_parking": coveredCarParking == null ? null : coveredCarParking,
//     "open_car_parking": openCarParking == null ? null : openCarParking,
//     "property_id": propertyId,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//   };
// }
//
// class PropertyType {
//   PropertyType({
//     this.id,
//     this.name,
//     this.sub,
//     this.categoryId,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   int id;
//   String name;
//   String sub;
//   int categoryId;
//   String status;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   factory PropertyType.fromJson(Map<String, dynamic> json) => PropertyType(
//     id: json["id"],
//     name: json["name"],
//     sub: json["sub"],
//     categoryId: json["category_id"],
//     status: json["status"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "sub": sub,
//     "category_id": categoryId,
//     "status": status,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//   };
// }
//
// class Rent {
//   Rent({
//     required this.rent,
//     required this.charge,
//     required this.word,
//   });
//
//   int rent;
//   int charge;
//   String word;
//
//   factory Rent.fromJson(Map<String, dynamic> json) => Rent(
//     rent: json["rent"],
//     charge: json["charge"],
//     word: json["word"].toString(),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "rent": rent,
//     "charge": charge,
//     "word": word,
//   };
// }
