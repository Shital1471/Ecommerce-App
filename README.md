# My E-Commerce App

This Flutter app displays categories, allows users to browse products by category, and view product details. 
## 1. Display a List of Categories
The app's home screen should showcase a list of products. Each category is represented as a card or item, typically displaying the category name and, optionally, an image. Users can scroll through this list to explore various product categories available within the app.
![WhatsApp Image 2023-10-20 at 21 58 07](https://github.com/Shital1471/Ecommerce-App/assets/114605853/a291d2d9-e42d-4b94-865e-20449a0caf06)
![WhatsApp Image 2023-10-20 at 21 58 07 (2)](https://github.com/Shital1471/Ecommerce-App/assets/114605853/91d1342f-d59e-48b2-a236-154cbac2799d)






## 2. Browse Products Within Searching in Brand
You can add a search bar to the user interface, usually positioned at the top of the product listing screen. Users can enter a brand name they want to search for. Upon submitting the search query, filter the product list to display only products from the specified brand.

![WhatsApp Image 2023-10-20 at 21 58 09](https://github.com/Shital1471/Ecommerce-App/assets/114605853/afcff0e4-f9fa-4cad-b1f2-f2f370a6f296)


## 3. View Detailed Information about Each Product
On the product detail screen, users can access comprehensive information about a chosen product. This information typically includes the product name, description, price, product images, and any other pertinent details. Users can make informed decisions about purchasing the product based on the information provided.

![WhatsApp Image 2023-10-20 at 21 58 08](https://github.com/Shital1471/Ecommerce-App/assets/114605853/1f4b574d-e540-44d2-ab05-bc0cefca70ad)


## 4. State Management Using StreamBuilder
For efficient state management, the app utilizes the StreamBuilder widget. This widget listens to a data stream (typically a stream of product or category data) and rebuilds the UI in response to changes in the stream. State management via StreamBuilder ensures that the UI remains up to date with the latest data, reducing the need for manual refreshes and ensuring a seamless user experience.
## 5. API Integration to Fetch Categories and Products
The app integrates with the Fake API from Platzi to fetch both category and product data. The app interacts with the following API endpoints:

- Categories: The app makes API requests to retrieve a list of available categories. These categories populate the initial home screen, providing users with an overview of the available product categories.

- Products by Category: When a user selects a category, the app sends an API request to obtain products related to the chosen category. These products are subsequently displayed in the subcategory screen, allowing users to explore items within a specific category.
