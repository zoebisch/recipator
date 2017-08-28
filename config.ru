require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use CulturesController
use AuthorsController
use RecipesController
use IngredientsController
use UsersController
run ApplicationController
