//
//  Data.swift
//  Kindney Failure
//
//  Created by Jerry Deska on 07/07/21.
//

import Foundation

class DataItems
{
    var nama : String!
    var imageFav : String!

    
    public init(nama:String, imageFav:String)
    {
        self.nama = nama
        self.imageFav = imageFav
    }
}

//struct DataItems {
//    let nama : String
//    let imageFav: String
//}

var dataitems = [
    DataItems(nama: "satu", imageFav: "daging"),
    DataItems(nama: "dua", imageFav: "daging"),
    DataItems(nama: "tiga", imageFav: "daging"),
    DataItems(nama: "2 satu", imageFav: "daging"),
    DataItems(nama: "2 dua", imageFav: "daging"),
    DataItems(nama: "tiga", imageFav: "daging"),
    DataItems(nama: "3 jahdsadjfhffddfssda", imageFav: "daging"),
    DataItems(nama: "3 dua", imageFav: "daging"),
    DataItems(nama: "1 tiga", imageFav: "daging"),
    DataItems(nama: "2 satu", imageFav: "daging"),
    DataItems(nama: "2 dua", imageFav: "daging"),
    DataItems(nama: "2 tiga", imageFav: "daging"),
    DataItems(nama: "3 jahdsadjfh", imageFav: "daging")
]

var dataSearch = [
    DataItems(nama: "satu", imageFav: "daging"),
    DataItems(nama: "dua", imageFav: "daging"),
    DataItems(nama: "tiga", imageFav: "daging"),
    DataItems(nama: "2 satu", imageFav: "daging"),
    DataItems(nama: "2 dua", imageFav: "daging"),
    DataItems(nama: "tiga", imageFav: "daging"),
    DataItems(nama: "3 jahdsadjfhffddfssda", imageFav: "daging"),
    DataItems(nama: "3 dua", imageFav: "daging"),
    DataItems(nama: "1 tiga", imageFav: "daging"),
    DataItems(nama: "2 satu", imageFav: "daging"),
    DataItems(nama: "2 dua", imageFav: "daging"),
    DataItems(nama: "2 tiga", imageFav: "daging"),
    DataItems(nama: "3 jahdsadjfh", imageFav: "daging")
]

var dataRecomendation = [
    DataItems(nama: "satu", imageFav: "daging"),
    DataItems(nama: "dua", imageFav: "daging"),
    DataItems(nama: "tiga", imageFav: "daging"),
    DataItems(nama: "2 satu", imageFav: "daging"),
    DataItems(nama: "2 dua", imageFav: "daging"),
    DataItems(nama: "tiga", imageFav: "daging"),
    DataItems(nama: "3 jahdsadjfhffddfssda", imageFav: "daging"),
    DataItems(nama: "3 dua", imageFav: "daging"),
    DataItems(nama: "1 tiga", imageFav: "daging"),
    DataItems(nama: "2 satu", imageFav: "daging"),
    DataItems(nama: "2 dua", imageFav: "daging"),
    DataItems(nama: "2 tiga", imageFav: "daging"),
    DataItems(nama: "3 jahdsadjfh", imageFav: "daging")
]


//struct CategoryRecipe {
//    let categoryName: String
//    let categoryImage: String
//    let recipe: [Recipes]
//}
//
//struct Recipes {
//    let recipeName: String
//    let recipeImage: String
//    let recipeCategory: String
//    let recipeDuration: Int
//    let recipeDifficulty: String
//    let isFavorite: Bool
//    let potassiumServingSize: Int
//    let sodiumPerServingSize: Int
//    let phosphorusServingSize: Int
//    let recipeIngredients: [String]
//    let recipeInstructions: [String]
//}
//
//let Recipe: [CategoryRecipe] =  [
//
//    CategoryRecipe(categoryName: "Dessert", categoryImage: "IMG",
//                   recipe: [Recipes(recipeName: <#T##String#>,
//                                   recipeImage: <#T##String#>,
//                                   recipeCategory: <#T##String#>,
//                                   recipeDuration: <#T##Int#>,
//                                   recipeDifficulty: <#T##String#>,
//                                   isFavorite: <#T##Bool#>,
//                                   potassiumServingSize: <#T##Int#>,
//                                   sodiumPerServingSize: <#T##Int#>,
//                                   phosphorusServingSize: <#T##Int#>,
//                                   recipeIngredients: [],
//                                   recipeInstructions: [] ),
//
//                            Recipes(recipeName: "sushi",
//                                    recipeImage: <#T##String#>,
//                                    recipeCategory: <#T##String#>,
//                                    recipeDuration: <#T##Int#>,
//                                    recipeDifficulty: <#T##String#>,
//                                    isFavorite: <#T##Bool#>,
//                                    potassiumServingSize: <#T##Int#>,
//                                    sodiumPerServingSize: <#T##Int#>,
//                                    phosphorusServingSize: <#T##Int#>,
//                                    recipeIngredients: [],
//                                    recipeInstructions: [] )
//                   ] ),
//
//    CategoryRecipe(categoryName: "Seafood", categoryImage: "IMG",
//                   recipe: [Recipes(recipeName: "String",
//                                   recipeImage: <#T##String#>,
//                                   recipeCategory: <#T##String#>,
//                                   recipeDuration: <#T##Int#>,
//                                   recipeDifficulty: <#T##String#>,
//                                   isFavorite: <#T##Bool#>,
//                                   potassiumServingSize: <#T##Int#>,
//                                   sodiumPerServingSize: <#T##Int#>,
//                                   phosphorusServingSize: <#T##Int#>,
//                                   recipeIngredients: [],
//                                   recipeInstructions: [] ),
//
//                            Recipes(recipeName: <#T##String#>,
//                                    recipeImage: <#T##String#>,
//                                    recipeCategory: <#T##String#>,
//                                    recipeDuration: <#T##Int#>,
//                                    recipeDifficulty: <#T##String#>,
//                                    isFavorite: <#T##Bool#>,
//                                    potassiumServingSize: <#T##Int#>,
//                                    sodiumPerServingSize: <#T##Int#>,
//                                    phosphorusServingSize: <#T##Int#>,
//                                    recipeIngredients: [],
//                                    recipeInstructions: [] )
//                   ] ),
//
//    CategoryRecipe(categoryName: "Ayam", categoryImage: "IMG",
//                   recipe: [Recipes(recipeName: "String",
//                                   recipeImage: "String",
//                                   recipeCategory: <#T##String#>,
//                                   recipeDuration: <#T##Int#>,
//                                   recipeDifficulty: <#T##String#>,
//                                   isFavorite: <#T##Bool#>,
//                                   potassiumServingSize: <#T##Int#>,
//                                   sodiumPerServingSize: <#T##Int#>,
//                                   phosphorusServingSize: <#T##Int#>,
//                                   recipeIngredients: [],
//                                   recipeInstructions: [] ),
//
//                            Recipes(recipeName: <#T##String#>,
//                                    recipeImage: <#T##String#>,
//                                    recipeCategory: <#T##String#>,
//                                    recipeDuration: <#T##Int#>,
//                                    recipeDifficulty: <#T##String#>,
//                                    isFavorite: <#T##Bool#>,
//                                    potassiumServingSize: <#T##Int#>,
//                                    sodiumPerServingSize: <#T##Int#>,
//                                    phosphorusServingSize: <#T##Int#>,
//                                    recipeIngredients: [],
//                                    recipeInstructions: [] )
//                   ] ),
//
//    CategoryRecipe(categoryName: "Daging", categoryImage: "IMG",
//                   recipe: [Recipes(recipeName: "String",
//                                   recipeImage: <#T##String#>,
//                                   recipeCategory: <#T##String#>,
//                                   recipeDuration: <#T##Int#>,
//                                   recipeDifficulty: <#T##String#>,
//                                   isFavorite: <#T##Bool#>,
//                                   potassiumServingSize: <#T##Int#>,
//                                   sodiumPerServingSize: <#T##Int#>,
//                                   phosphorusServingSize: <#T##Int#>,
//                                   recipeIngredients: [],
//                                   recipeInstructions: [] ),
//
//                            Recipes(recipeName: <#T##String#>,
//                                    recipeImage: <#T##String#>,
//                                    recipeCategory: <#T##String#>,
//                                    recipeDuration: <#T##Int#>,
//                                    recipeDifficulty: <#T##String#>,
//                                    isFavorite: <#T##Bool#>,
//                                    potassiumServingSize: <#T##Int#>,
//                                    sodiumPerServingSize: <#T##Int#>,
//                                    phosphorusServingSize: <#T##Int#>,
//                                    recipeIngredients: [],
//                                    recipeInstructions: [] )
//                   ] ),
//
//    CategoryRecipe(categoryName: "Sayuran", categoryImage: "IMG",
//                   recipe: [Recipes(recipeName: "String",
//                                   recipeImage: <#T##String#>,
//                                   recipeCategory: <#T##String#>,
//                                   recipeDuration: <#T##Int#>,
//                                   recipeDifficulty: <#T##String#>,
//                                   isFavorite: <#T##Bool#>,
//                                   potassiumServingSize: <#T##Int#>,
//                                   sodiumPerServingSize: <#T##Int#>,
//                                   phosphorusServingSize: <#T##Int#>,
//                                   recipeIngredients: [],
//                                   recipeInstructions: [] ),
//
//                            Recipes(recipeName: <#T##String#>,
//                                    recipeImage: <#T##String#>,
//                                    recipeCategory: <#T##String#>,
//                                    recipeDuration: <#T##Int#>,
//                                    recipeDifficulty: <#T##String#>,
//                                    isFavorite: <#T##Bool#>,
//                                    potassiumServingSize: <#T##Int#>,
//                                    sodiumPerServingSize: <#T##Int#>,
//                                    phosphorusServingSize: <#T##Int#>,
//                                    recipeIngredients: [],
//                                    recipeInstructions: [] )
//                   ] )
//
//
//
//]
