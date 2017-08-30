# Specifications for the Sinatra Assessment

Specs:
- [x] Build an MVC Sinatra Application.
    - Models: author, culture, ingredient, recipe_ingredient, recipe, user_recipes, user
    - View: edit, index, new, show and login (for user)
    - Controllers: Application, Authors, Cultures, Ingredients, Recipes and Users
- [x]Use ActiveRecord with Sinatra.
    - ActiveRecord::Base and Sinatra used
- [x]Use Multiple Models.
  - As mentioned, author, culture, ingredient, recipe_ingredient, recipe, user_recipes and user
- [x]Use at least one has_many relationship
  - Author, Culture, Ingredient, Recipe, User all have many, some with has_many through:
- [x]Must have user accounts. The user that created a given piece of content should be the only person who can modify that content
  - Users are authenticated and can only edit their personal list of recipes.  A user can add a new recipe, author, ingredient or culture but cannot delete them. Only an authenticated unique admin (site_admin) can do so and only in the following cases:
    1) A Culture can be deleted if it contains no recipes association
    2) An Author can be deleted only if the author has no recipes
    3) An ingredient can only be deleted if it is not used in any recipe
    4) A Recipe can be deleted, and all associations are disintegrated.
- [x]You should validate user input to ensure that bad data isn't created
  - User input is tested in nearly all cases, and use of find_or_create_by is common.
  - This could be extended more, but user, password, email are all necessary to create a user.  Since creating a recipe or ingredient, culture or author is very open-ended, little contraints are practical on the data.
