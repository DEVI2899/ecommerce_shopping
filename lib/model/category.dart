
enum Category {
  electronics,
  jewelery,
  mensClothing,
  womenClothing
}
  extension CategoryExtension on Category{
   String get name {
   switch (this) {
    case Category.mensClothing:
      return "men's clothing";
    case Category.womenClothing:
      return "women's clothing";
    case Category.electronics:
      return "electronics";
    case Category.jewelery:
      return "jewelery";
    default:
      return "";
  }
}

static Category fromString(String category) {
  switch (category) {
    case "men's clothing":
      return Category.mensClothing;
    case "women's clothing":
      return Category.womenClothing;
    case "electronics":
      return Category.electronics;
    case "jewelery":
      return Category.jewelery;
    default:
      throw Exception('Unknown category: $category');
  }
 }
}