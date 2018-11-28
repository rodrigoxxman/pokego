
import Foundation
import UIKit
import CoreData

func agregarPokemons(){
    crearPokemon(xnombre: "Mew", ximagenNombre: "mew")
    crearPokemon(xnombre: "Meowth", ximagenNombre: "meowth")
    crearPokemon(xnombre: "Agumon", ximagenNombre: "agumon")
    crearPokemon(xnombre: "Abra", ximagenNombre: "abra")
    crearPokemon(xnombre: "Bellsprout", ximagenNombre: "bellsp")
    crearPokemon(xnombre: "Bullbasaur", ximagenNombre: "bullbasaur")
    crearPokemon(xnombre: "Caterpie", ximagenNombre: "caterpie")
    crearPokemon(xnombre: "Charmander", ximagenNombre: "charmander")
    crearPokemon(xnombre: "Dratini", ximagenNombre: "dratini")
    crearPokemon(xnombre: "Eevee", ximagenNombre: "Eevee")
    crearPokemon(xnombre: "Jigglypuff", ximagenNombre: "jigglypuff")
    crearPokemon(xnombre: "Mankey", ximagenNombre: "mankey")
    crearPokemon(xnombre: "Pidgey", ximagenNombre: "pidgey")
    crearPokemon(xnombre: "Pikachu", ximagenNombre: "pikachu-2")
    crearPokemon(xnombre: "Psyduck", ximagenNombre: "psyduck")
    crearPokemon(xnombre: "Rattata", ximagenNombre: "rattata")
    crearPokemon(xnombre: "Snorlax", ximagenNombre: "snorlax")
    crearPokemon(xnombre: "Squirtle", ximagenNombre: "squirtle")
    crearPokemon(xnombre: "Venonat", ximagenNombre: "venonat")
    crearPokemon(xnombre: "Weedle", ximagenNombre: "weedle")
    crearPokemon(xnombre: "Zubat", ximagenNombre: "zubat")
    crearPokemon(xnombre: "Sportacus", ximagenNombre: "sportacus")
    crearPokemon(xnombre: "Keiko", ximagenNombre: "keiko")
    crearPokemon(xnombre: "Alan", ximagenNombre: "alan")
    crearPokemon(xnombre: "Fuji", ximagenNombre: "fuji")
    (UIApplication.shared.delegate as! AppDelegate).saveContext()
}

func crearPokemon(xnombre:String, ximagenNombre:String ){
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let pokemon = Pokemon(context:context)
    pokemon.nombre = xnombre
    pokemon.imagenNombre = ximagenNombre
}
func obtenerPokemons() -> [Pokemon]{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    do{
        let pokemons = try context.fetch(Pokemon.fetchRequest()) as! [Pokemon]
        if pokemons.count == 0 {
            agregarPokemons()
            return obtenerPokemons()
        }
        return pokemons
    }catch{}
    return[]
}

func obtenerPokemonsAtrapados() -> [Pokemon]{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let queryConWhere = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>
    queryConWhere.predicate = NSPredicate(format: "atrapado == %@", true as CVarArg)
    do {
        let pokemons = try context.fetch(queryConWhere) as [Pokemon]
        return pokemons
    }catch{}
    return[]
}

func obtenerPokemonsNoAtrapados() -> [Pokemon]{
    let context  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let queryConWhere = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>
    queryConWhere.predicate = NSPredicate(format: "atrapado == %@", false as CVarArg)
    do{
        let pokemons = try context.fetch(queryConWhere) as [Pokemon]
        return pokemons
    }catch{}
    return[]
}
