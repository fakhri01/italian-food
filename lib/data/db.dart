import 'dart:math';

import 'package:food_order/data/model.dart';

final List<Food> _originalFoods = [
  // Antipasti (5 items)
  Food(
    id: 1,
    name: "Bruschetta Classica",
    category: "Antipasti",
    image: "images/Bruschetta Classica.jpg",
    price: 8.50,
    prepTime: 10,
    rating: 4.7,
    description:
        "Crusty artisan bread rubbed with garlic, topped with vine-ripened tomatoes, fresh basil, and our signature extra virgin olive oil. Finished with a drizzle of 12-year aged balsamic glaze for the perfect sweet-tangy balance.",
  ),
  Food(
    id: 2,
    name: "Caprese Salad",
    category: "Antipasti",
    image: "images/Caprese Salad.jpg",
    price: 10.99,
    prepTime: 8,
    rating: 4.5,
    description:
        "A vibrant tribute to the Italian flag featuring creamy buffalo mozzarella, heirloom tomatoes, and Genovese basil. Drizzled with Tuscan olive oil and Modena balsamic reduction, finished with flaky sea salt.",
  ),
  Food(
    id: 3,
    name: "Fritto Misto",
    category: "Antipasti",
    image: "images/Fritto Misto.jpg",
    price: 12.99,
    prepTime: 15,
    rating: 4.6,
    description:
        "Lightly fried seasonal seafood and vegetables in a crispy tempura batter. Served with lemon wedges and our zesty saffron aioli for dipping. Includes calamari, shrimp, zucchini, and artichokes.",
  ),
  Food(
    id: 4,
    name: "Prosciutto e Melone",
    category: "Antipasti",
    image: "images/Prosciutto e Melone.jpg",
    price: 14.50,
    prepTime: 5,
    rating: 4.4,
    description:
        "Paper-thin slices of 24-month aged Parma ham draped over sweet cantaloupe. Garnished with fresh mint and a crack of black pepper for an elegant sweet-savory combination.",
  ),
  Food(
    id: 5,
    name: "Arancini",
    category: "Antipasti",
    image: "images/Arancini.jpg",
    price: 9.99,
    prepTime: 12,
    rating: 4.8,
    description:
        "Crispy golden risotto balls stuffed with molten mozzarella and porcini mushrooms. Served with our homemade pomodoro sauce for dipping - a Sicilian street food classic perfected.",
  ),

  // Pasta (5 items)
  Food(
    id: 6,
    name: "Spaghetti Carbonara",
    category: "Pasta",
    image: "images/Spaghetti Carbonara.jpg",
    price: 16.99,
    prepTime: 20,
    rating: 4.9,
    description:
        "Authentic Roman pasta featuring al dente spaghetti coated in a silky sauce of guanciale, Pecorino Romano, and farm-fresh egg yolks. Finished with cracked black pepper for that perfect peppery bite.",
  ),
  Food(
    id: 7,
    name: "Pappardelle al Cinghiale",
    category: "Pasta",
    image: "images/Pappardelle al Cinghiale.webp",
    price: 19.99,
    prepTime: 25,
    rating: 4.8,
    description:
        "Hand-cut wide ribbon pasta tossed with a rich wild boar ragù slow-cooked with red wine, juniper berries, and Tuscan herbs. Topped with aged Parmigiano-Reggiano for depth of flavor.",
  ),
  Food(
    id: 8,
    name: "Risotto ai Funghi",
    category: "Pasta",
    image: "images/Risotto ai Funghi.jpg",
    price: 18.50,
    prepTime: 30,
    rating: 4.7,
    description:
        "Creamy Arborio rice cooked with a medley of wild mushrooms, white truffle oil, and Parmesan. Finished with a drizzle of truffle oil and fresh chives for an earthy, luxurious experience.",
  ),
  Food(
    id: 9,
    name: "Gnocchi al Pesto",
    category: "Pasta",
    image: "images/Gnocchi al Pesto.png",
    price: 17.99,
    prepTime: 18,
    rating: 4.6,
    description:
        "Pillowy potato dumplings handmade daily, tossed in vibrant Genovese basil pesto made with pine nuts and Parmigiano. Garnished with toasted pine nuts and a dusting of aged cheese.",
  ),
  Food(
    id: 10,
    name: "Lasagna Bolognese",
    category: "Pasta",
    image: "images/Lasagna Bolognese.png",
    price: 20.99,
    prepTime: 35,
    rating: 4.9,
    description:
        "Layers of fresh pasta, slow-cooked beef ragù, béchamel, and Parmigiano-Reggiano baked to golden perfection. Served bubbling hot with a side of garlic bread to mop up the delicious sauce.",
  ),

  // Secondi (5 items)
  Food(
    id: 11,
    name: "Saltimbocca alla Romana",
    category: "Secondi",
    image: "images/Saltimbocca alla Romana.jpg",
    price: 24.99,
    prepTime: 25,
    rating: 4.8,
    description:
        "Tender veal scallopini topped with prosciutto and sage, cooked in white wine and butter sauce. Served with roasted potatoes and seasonal vegetables for a classic Roman main course.",
  ),
  Food(
    id: 12,
    name: "Pollo alla Parmigiana",
    category: "Secondi",
    image: "images/Pollo alla Parmigiana.jpg",
    price: 22.50,
    prepTime: 30,
    rating: 4.6,
    description:
        "Crispy breaded chicken cutlet smothered in homemade marinara and melted mozzarella. Baked until golden and served with a side of spaghetti aglio e olio for a comforting Italian-American classic.",
  ),
  Food(
    id: 13,
    name: "Bistecca Fiorentina",
    category: "Secondi",
    image: "images/Bistecca Fiorentina.webp",
    price: 39.99,
    prepTime: 40,
    rating: 4.9,
    description:
        "A majestic T-bone steak from Chianina cattle, grilled over wood fire and seasoned simply with rosemary, olive oil, and sea salt. Served rare with roasted potatoes and garlic spinach.",
  ),
  Food(
    id: 14,
    name: "Branzino al Forno",
    category: "Secondi",
    image: "images/Branzino al Forno.webp",
    price: 28.99,
    prepTime: 35,
    rating: 4.7,
    description:
        "Whole Mediterranean sea bass roasted with lemon, olives, and cherry tomatoes. Deboned tableside and served with roasted fennel and saffron potatoes for a light yet satisfying dish.",
  ),
  Food(
    id: 15,
    name: "Vitello Tonnato",
    category: "Secondi",
    image: "images/Vitello Tonnato.webp",
    price: 26.50,
    prepTime: 20,
    rating: 4.5,
    description:
        "Cold sliced veal with a creamy tuna-caper sauce, a Piedmontese summer classic. Garnished with capers and lemon zest for brightness, served with arugula salad for contrast.",
  ),

  // Dolci (5 items)
  Food(
    id: 16,
    name: "Tiramisu",
    category: "Dolci",
    image: "images/Tiramisu.jpg",
    price: 9.99,
    prepTime: 0,
    rating: 4.9,
    description:
        "Our signature dessert with layers of espresso-soaked ladyfingers and light mascarpone cream. Dusted with Valrhona cocoa powder and finished with chocolate shavings for extra indulgence.",
  ),
  Food(
    id: 17,
    name: "Panna Cotta",
    category: "Dolci",
    image: "images/Panna Cotta.webp",
    price: 8.50,
    prepTime: 0,
    rating: 4.7,
    description:
        "Silky vanilla bean custard with a perfect wobble, served with seasonal berry compote and mint garnish. The cream is infused with Madagascar vanilla for exceptional fragrance.",
  ),
  Food(
    id: 18,
    name: "Cannoli Siciliani",
    category: "Dolci",
    image: "images/Cannoli Siciliani.webp",
    price: 7.99,
    prepTime: 0,
    rating: 4.8,
    description:
        "Crispy pastry shells filled with sweet ricotta blended with chocolate chips and candied orange. Dusted with powdered sugar and pistachios for authentic Sicilian flair.",
  ),
  Food(
    id: 19,
    name: "Affogato",
    category: "Dolci",
    image: "images/Affogato.jpg",
    price: 6.99,
    prepTime: 5,
    rating: 4.6,
    description:
        "Vanilla gelato 'drowned' in a shot of hot espresso, creating the perfect contrast of temperatures. Served with almond biscotti for dipping - a simple yet sophisticated dessert.",
  ),
  Food(
    id: 20,
    name: "Torta della Nonna",
    category: "Dolci",
    image: "images/Torta della Nonna.webp",
    price: 8.99,
    prepTime: 0,
    rating: 4.7,
    description:
        "Grandmother's cake featuring a buttery crust filled with vanilla custard and pine nuts. Dusted with powdered sugar and served with a dollop of whipped cream for nostalgia in every bite.",
  ),
];

final foodsData = [..._originalFoods]..shuffle(Random());
