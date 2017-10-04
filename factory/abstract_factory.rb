class Frog

end

class Algae

end

class Tiger

end

class Tree

end

class PondFactory
  def new_animal
    Frog.new
  end

  def new_piant
    Algae.new
  end
end

class JungleFactory
  def new_animal
    Tiger.new
  end
  def new_piant
    Tree.new
  end
end

class EnvironmentFactory
  attr_reader :factories

  def initialize
    @factories = %w(PondFactory JungleFactory)
  end

  def get_factory(method)
    factory_class = get_factory_class method

    if factories.include? factory_class
      self.class.const_get(factory_class).new
    else
      super
    end
  end

  private

  def get_factory_class(method)
    "#{method.to_s.capitalize}Factory"
  end
end


# environment = EnvironmentFactory.new
# jungle = environment.get_factory(:jungle)
# jungle.new_animal
