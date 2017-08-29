Recipator

### Overview

The Recipator is a Sinatra based MVC that tracks authors, recipes, culture (of the recipe) and ingredients.  The intended use
is for at home with several users and can be extended to a pantry inventory, and with a scanner could be automated.  

The reason for tracking metrics on ingredients is for future development, to let the user know if there is enough on hand to make a dish.


## File Structure

```
├── app
│   ├── controllers
│   │   ├── application_controller.rb
│   │   ├── authors_controller.rb
│   │   ├── recipes_controller.rb
│   │   └── ingredients_controller.rb
|   |   └── cultures_controller.rb
│   ├── models
│   │   ├── author.rb
│   │   ├── concerns
│   │   │   └── slugifiable.rb
│   │   ├── recipe.rb
│   │   ├── ingredients.rb
│   │   └── culture.rb
|   |   └── recipes_ingredients.rb  
│   └── views
│       ├── authors
│       │   ├── index.erb
│       │   ├── edit.erb
│       │   ├── new.erb
│       │   └── show.erb
│       ├── recipes
│       │   ├── index.erb
│       │   ├── edit.erb
│       │   ├── new.erb
│       │   └── show.erb
│       ├── ingredients
│       │   ├── index.erb
│       │   ├── edit.erb
│       │   ├── new.erb
│       │   └── show.erb
│       ├── index.erb
│       ├── layout.erb
│       └── cultures
│           ├── edit.erb
│           ├── index.erb
│           ├── new.erb
│           └── show.erb

```
#Information

Class Structure
  Author:
    has_many :recipes
  Recipe:
    belongs_to :author
    belongs_to :culture (Most have only one, for purist reasons we will decide on ONE)
    has_many :ingredients
  Ingredients:
    belongs_to :recipes
  Culture:
    has_many :recipes
    has_many :authors, through: :recipes
  RecipeIngredients:
    belongs_to :recipe
    belongs_to :ingredient
