recipe1 = Recipe.create(name: "Vindaloo", instructions: "cook it all so it's nice", total_time: 180)
author1 = Author.create(name: "Madhur Jaffrey")
culture1 = Culture.create(name: "Goan")
ingredients1 = Ingredient.create(name: "Cumin", quantity: "16", quantity_type: "tsp")
ingredients2 = Ingredient.create(name: "Chili", quantity: "16", quantity_type: "chilis")
ingredients3 = Ingredient.create(name: "Pork", quantity: "16", quantity_type: "oz")
user1 = User.create(username: "Vince", email: "vince@gmail.com", password: "foobar")
author1.recipes << recipe1
