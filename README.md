Recipator

### Overview

The Recipator is a Sinatra based MVC that tracks authors, recipes, culture (of the recipe) and ingredients.  


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
