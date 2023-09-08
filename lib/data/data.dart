import 'dart:math';

import 'package:flutter/material.dart';
import '../model/meal.dart';

const DUMMY_MEALS = const [
  Meal(
    id: 'm1',
    categories: [
      'c1',
      'c2',
    ],
    title: 'Spaghetti with Tomato Sauce',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
    duration: 20,
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    price: 200,
  ),
  Meal(
    id: 'm12',
    categories: [
      'c2',
      'c5',
      'c10',
    ],
    title: 'Halwa Puri',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpSlP_vYjIhyh6aH2ju8CqPUDH0D_Q1lh77w&usqp=CAU',
    duration: 20,
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    price: 160,
  ),
  Meal(
    id: 'm11',
    categories: [
      'c2',
      'c5',
      'c10',
    ],
    title: 'Chicken Biryani',
    imageUrl:
        'https://t3.ftcdn.net/jpg/01/14/51/60/360_F_114516029_Z2B6FO30AB6ZR3v9WHXjpXmJScaiLtzk.jpg',
    duration: 20,
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    price: 460,
  ),
  Meal(
    id: 'm12',
    categories: [
      'c2',
      'c5',
      'c10',
    ],
    title: 'Daal Chawal (Lentils And Rice)',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZP99Sm2-qXkGoP83yJ7a2nghCLXmCcEWQ1Q&usqp=CAU',
    duration: 13,
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    price: 260,
  ),
  Meal(
    id: 'm13',
    categories: [
      'c2',
      'c5',
      'c10',
    ],
    title: 'Matar Pulao',
    imageUrl:
        'https://t3.ftcdn.net/jpg/02/27/94/52/360_F_227945291_wi1Dyx1AxOZECPnaugIem7qZTtvCAGbx.jpg',
    duration: 10,
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    price: 360,
  ),
  Meal(
    id: 'm2',
    categories: [
      'c2',
    ],
    title: 'Toast Hawaii',
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
    duration: 10,
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
    price: 300,
  ),
  Meal(
    id: 'm3',
    categories: [
      'c2',
      'c3',
    ],
    title: 'Classic Hamburger',
    imageUrl:
        'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
    duration: 45,
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
    price: 360,
  ),
  Meal(
    id: 'm4',
    categories: [
      'c4',
    ],
    title: 'Wiener Schnitzel',
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
    duration: 60,
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
    price: 370,
  ),
  Meal(
    id: 'm5',
    categories: [
      'c2'
          'c5',
      'c10',
    ],
    title: 'Salad with Smoked Salmon',
    imageUrl:
        'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
    duration: 15,
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: true,
    price: 560,
  ),
  Meal(
    id: 'm6',
    categories: [
      'c6',
      'c10',
    ],
    title: 'Delicious Orange Mousse',
    imageUrl:
        'https://cdn.pixabay.com/photo/2017/05/01/05/18/pastry-2274750_1280.jpg',
    duration: 240,
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
    price: 410,
  ),
  Meal(
    id: 'm7',
    categories: [
      'c7',
    ],
    title: 'Pancakes',
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/07/10/21/23/pancake-3529653_1280.jpg',
    duration: 20,
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
    price: 350,
  ),
  Meal(
    id: 'm8',
    categories: [
      'c8',
    ],
    title: 'Creamy Indian Chicken Curry',
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg',
    duration: 35,
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
    price: 380,
  ),
  Meal(
    id: 'm9',
    categories: [
      'c9',
    ],
    title: 'Chocolate Souffle',
    imageUrl:
        'https://cdn.pixabay.com/photo/2014/08/07/21/07/souffle-412785_1280.jpg',
    duration: 45,
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
    price: 369,
  )
];
