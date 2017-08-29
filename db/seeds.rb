recipe1 = Recipe.create(name: "Vindaloo", instructions: "cook it all so it's nice", total_time: 180)
author1 = Author.create(name: "Madhur Jaffrey")
culture1 = Culture.create(name: "Goan")
ingredients1 = Ingredient.create(name: "Cumin", quantity: "16", quantity_type: "tsp")
ingredients2 = Ingredient.create(name: "Chili", quantity: "16", quantity_type: "chilis")
ingredients3 = Ingredient.create(name: "Pork", quantity: "16", quantity_type: "oz")
user1 = User.create(username: "Vince", email: "vince@gmail.com", password: "foobar")
author1.recipes << recipe1
culture1.recipes << recipe1
recipe1.ingredients << ingredients1
recipe1.ingredients << ingredients2
recipe1.ingredients << ingredients3
recipe2 = Recipe.create(name: "Chicken Wings", instructions: "cook it all so it's nice", total_time: 60)
author2 = Author.create(name: "Brian Zoebisch")
culture2 = Culture.create(name: "American")
ingredients4 = Ingredient.create(name: "Chicken Wings", quantity: "1", quantity_type: "lb")
ingredients5 = Ingredient.create(name: "Cornstarch", quantity: "2", quantity_type: "Tbs")
ingredients6 = Ingredient.create(name: "Salt", quantity: "1/2", quantity_type: "tsp")
ingredients7 = Ingredient.create(name: "White Vinegar", quantity: "2", quantity_type: "Tbs")
ingredients8 = Ingredient.create(name: "Frank's Hot Sauce", quantity: "3/4", quantity_type: "Cup")
ingredients9 = Ingredient.create(name: "Garlic", quantity: "1/2", quantity_type: "Head")
ingredients10 = Ingredient.create(name: "Unsalted Butter", quantity: "3", quantity_type: "Tbs")
user2 = User.create(username: "Brian", email: "brian@gmail.com", password: "ninja")
author2.recipes << recipe2
culture2.recipes << recipe2
recipe2.ingredients << ingredients4
recipe2.ingredients << ingredients5
recipe2.ingredients << ingredients6
recipe2.ingredients << ingredients7
recipe2.ingredients << ingredients8
recipe2.ingredients << ingredients9
recipe2.ingredients << ingredients10
user2 = User.create(username: "site_admin", email: "site_admin@gmail.com", password: "superadmin")
