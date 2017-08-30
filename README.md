Recipator

### Overview

The Recipator is a Sinatra based MVC that tracks authors, recipes, culture (of the recipe) and ingredients.  The intended use
is for at home with several users and can be extended to a pantry inventory, and (in the future) with a scanner could be automated.  

As such, certain features are only edited or removable by the site_admin, namely: Author, Culture, or deleting anything other than a user's personal collection of stored recipes.  And, these objects can only be removed under certain conditions, such as: an ingredient that is not used in a recipe, a culture that contains no recipes, or an author that has no recipes.  It was felt the best use of protections for the sanity of the database.

The reason for tracking metrics on ingredients is for future development, to let the user know if there is enough on hand to make a dish.


## Main File Structure

```
├── app
│   ├── controllers
│   │   ├── application_controller.rb
│   │   ├── authors_controller.rb
│   │   ├── cultures_controller.rb
│   │   ├── ingredients_controller.rb
│   │   ├── recipes_controller.rb
|   |   └── users_controller.rb
│   ├── models
│   │   ├── concerns
│   │   │   └── concerns.rb
│   │   ├── author.rb
│   │   ├── culture.rb
│   │   ├── ingredient.rb
│   │   ├── recipe_ingredients.rb
│   │   ├── recipe.rb
│   │   ├── user_recipes.rb
|   |   └── user.rb  
│   └── views
│       ├── authors
│       │   ├── edit.erb
│       │   ├── index.erb
│       │   ├── new.erb
│       │   └── show.erb
│       ├── cultures
│       │   ├── edit.erb
│       │   ├── index.erb
│       │   ├── new.erb
│       │   └── show.erb
│       ├── ingredients
│       │   ├── index.erb
│       │   ├── new.erb
│       │   └── show.erb
│       ├── recipes
│       │   ├── edit.erb
│       │   ├── index.erb
│       │   ├── new.erb
│       │   └── show.erb
│       ├── users
│       │   ├── edit.erb
│       │   ├── login.erb
│       │   ├── new.erb
│       │   └── show.erb
│       ├── index.erb
```
#Information

Class Structure
  Author:
    has_many :recipes
  Culture:
    has_many :recipes
    has_many :authors, through: :recipes
  Ingredients:
    has_many :recipe_ingredients, :class_name => 'Recipe_Ingredients' #ActiveRecord was refusing to initialize constant?
    has_many :recipes, through: :recipe_ingredients
  Recipe_Ingredients:
    belongs_to :recipe
    belongs_to :ingredient
  Recipe:
    belongs_to :author
    belongs_to :culture #(Most have only one, for purist reasons we will decide on ONE)
    has_many :recipe_ingredients, :class_name => 'Recipe_Ingredients'
    has_many :ingredients, through: :recipe_ingredients
    has_many :user_recipes, :class_name => 'User_Recipes'
    has_many :users, through: :user_recipes
  User_Recipe:
    belongs_to :user
    belongs_to :recipe
  User:
    validates_presence_of :name, :email, :password
    validates_uniqueness_of :name
    has_secure_password
    has_many :user_recipes, :class_name => 'User_Recipes'
    has_many :recipes, through: :user_recipes
