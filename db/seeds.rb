
author1 = Author.create(name: "Madhur Jaffrey")
culture1 = Culture.create(name: "Goan")
ingredients1 = Ingredient.create(name: "Cumin", quantity: "16", quantity_type: "tsp", origin: "Mediterranean", description: "Cumin is the dried seed of the herb Cuminum cyminum, a member of the parsley family")
ingredients2 = Ingredient.create(name: "Chili", quantity: "16", quantity_type: "chilis", origin: "Mexico", description: "The chili pepper (also chile pepper chilli pepper, or simply chilli, from Nahuatl chīlli Nahuatl) is the fruit of plants from the genus Capsicum, members of the nightshade family, Solanaceae. They are widely used in many cuisines to add spiciness to dishes. The substances that give chili peppers their intensity when ingested are compounds known as capsaicinoids.")
ingredients3 = Ingredient.create(name: "Pork", quantity: "16", quantity_type: "oz", origin: "Asia", description: "Pork is the culinary name for meat from a domestic pig")
user1 = User.create(name: "Vince", email: "vince@gmail.com", password: "foobar")
recipe1 = Recipe.create(name: "Vindaloo", instructions: "cook it all so it's nice", total_time: 180)
author1.recipes << recipe1
culture1.recipes << recipe1
recipe1.ingredients << ingredients1
recipe1.ingredients << ingredients2
recipe1.ingredients << ingredients3
recipe2 = Recipe.create(name: "Chicken Wings", instructions: "cook it all so it's nice", total_time: 60)
author2 = Author.create(name: "Brian Zoebisch")
culture2 = Culture.create(name: "American")
ingredients4 = Ingredient.create(name: "Chicken Wings", quantity: "1", quantity_type: "lb", origin: "Southeast Asia", description: "Wings of the chicken have been consumed since they were raised for food. More recent uses popularized in Buffalo, NY have led to Chicken Wings being recognized as a main dish.")
ingredients5 = Ingredient.create(name: "Cornstarch", quantity: "2", quantity_type: "Tbs", origin: "Jersey City, NJ", description: "Cornstarch is used as a thickening agent in liquid-based foods (e.g., soup, sauces, gravies, custard), usually by mixing it with a lower-temperature liquid to form a paste or slurry. ")
ingredients6 = Ingredient.create(name: "Salt", quantity: "1/2", quantity_type: "tsp", origin: "Oceans and Mines", description: "The oldest known preservative, salt is an essential mineral to food, cooking and taste and is indispensable.")
ingredients7 = Ingredient.create(name: "White Vinegar", quantity: "2", quantity_type: "Tbs", origin: "United States", description: "White Vinegar is made from the fermentation of distilled alcohol. It imparts a clean vinegar sourness that can be used without dramatically imparting flavor.")
ingredients8 = Ingredient.create(name: "Frank's Hot Sauce", quantity: "3/4", quantity_type: "Cup", origin: "Frank Tea and Spice Company, Cincinatti, Ohio", description: "A well rounded, yet distinct Hot Sauce made from aged Cayenne peppers, distilled vinegar, water, salt and garlic powder.")
ingredients9 = Ingredient.create(name: "Garlic", quantity: "1/2", quantity_type: "Head", origin: "Middle Asia", description: "A member of the allium family of reknowned flavor for seasoning and staple food. ")
ingredients10 = Ingredient.create(name: "Unsalted Butter", quantity: "3", quantity_type: "Tbs", origin: "Mediterranean", description: "The product of milkfat that has been separated from the liquid buttermilk through the process of churning.")
user2 = User.create(name: "Brian", email: "brian@gmail.com", password: "ninja")
author2.recipes << recipe2
culture2.recipes << recipe2
recipe2.ingredients << ingredients4
recipe2.ingredients << ingredients5
recipe2.ingredients << ingredients6
recipe2.ingredients << ingredients7
recipe2.ingredients << ingredients8
recipe2.ingredients << ingredients9
recipe2.ingredients << ingredients10
user2 = User.create(name: "site_admin", email: "site_admin@gmail.com", password: "superadmin")
