# ecommerce_task

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


Requirements
Flutter SDK: Install Flutter
Dart SDK (included with Flutter)

Project Structure
lib/
main.dart: The entry point of the application.
product_details.dart: Defines the Product model class.
product_service.dart: Contains the ApiService class for fetching data from the API.
product_page.dart: Contains the  widget which implements the infinite scroll with pagination
dbhelper.dat: cart data store the locally 
product_controller: To fetching data using for provider statemagement
app_colors: To access the colors value inside utils folder.
cart_page.dart: adding the item to  cart section using bloc statemangement with sqflite local database.
l10n.dart :Accesing the list of language

API Endpoint
The app fetches products from the following endpoint: https://fakestoreapi.com/products

