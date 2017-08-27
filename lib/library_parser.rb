class LibraryParser
  def files
    data_path = File.join(File.dirname(__FILE__), '..', 'db', 'data')
    Dir.entries(data_path)[2..-1]
  end

  def self.parse
    self.new.call
  end

  def parse_filename(filename)
    author_match = filename.match(/^(.*) -/)
    recipe_match   = filename.match(/- (.*) \[/)
    culture_match  = filename.match(/\[([^\]]*)\]/)

    author = author_match && author_match[1]
    recipe   = recipe_match   && recipe_match[1]
    culture  = culture_match  && culture_match[1]

    [author, recipe, culture]
  end

  def call
    files.each do |filename|
      parts = parse_filename(filename)
      build_objects(*parts)
    end
  end

  def build_objects(author_name, recipe_name, culture_name)
    recipe = Recipe.create(name: recipe_name)
    culture = Culture.find_or_create_by(name: culture_name)
    author = Author.find_or_create_by(name: author_name)

    recipe.recipe_cultures.build(culture: culture)
    recipe.author = author

    recipe.save
  end
end
