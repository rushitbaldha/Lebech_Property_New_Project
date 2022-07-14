class ApiUrl {
  static const String apiMainPath = "https://lebechproperty.com/admin/api/";

  /// Buyer
  static const String homeScreenApi = apiMainPath + "customer/index";
  static const String loginApi = apiMainPath + "customer/login";
  static const String registerApi = apiMainPath + "customer/register";
  static const String propertyDetailsApi = apiMainPath + "customer/property_detail";

  static const String projectListApi = apiMainPath + "customer/project_list";
  static const String projectDetailsApi = apiMainPath + "customer/project_detail";

  static const String getCategoryWisePropertyApi = apiMainPath + "customer/category_property";
  static const String changeCityApi = apiMainPath + "customer/change_city";
  static const String searchResultApi = apiMainPath + "customer/search_result";
  static const String directSearchApi = apiMainPath + "customer/direct_search";
  static const String fetchProjectApi = apiMainPath + "customer/project_fetch";
  static const String getSubCategoryWisePropertyApi = apiMainPath + "customer/sub_category_property";

  static const String getVisitDetailsApi = apiMainPath + "customer/book_detail";
  static const String saveVisitApi = apiMainPath + "customer/save_visit";
  static const String visitListApi = apiMainPath + "customer/visit_list";
  static const String buyContactApi = apiMainPath + "customer/buy_contact";
  static const String contactListApi = apiMainPath + "customer/contact_list";

  /// Seller
  static const String sellerLoginApi = apiMainPath + "seller/login";
  static const String sellerRegisterApi = apiMainPath + "seller/register";
  static const String basicDetailsApi = apiMainPath + "basic_detail";
  static const String createPropertyDetailsApi = apiMainPath + "seller/save_propert";
  static const String getSellerAllPropertyApi = apiMainPath + "seller/list_property";
  static const String addPropertyImagesApi = apiMainPath + "seller/add_image";
  static const String getPropertyImagesApi = apiMainPath + "seller/property_image_list";


  /// Builder
  static const String builderLoginApi = apiMainPath + "builder/login";
  static const String builderRegisterApi = apiMainPath + "builder/register";
  static const String getBuilderAllPropertyApi = apiMainPath + "builder/list_property";
  static const String getBuilderAllProjectsApi = apiMainPath + "builder/project_list";
  static const String createBuilderPropertyDetailsApi = apiMainPath + "builder/save_propert";
  static const String addProjectImagesApi = apiMainPath + "builder/add_image";

}