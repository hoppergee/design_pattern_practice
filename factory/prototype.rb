class Note
  attr_accessor :duration

  def initialize(duration)
    @duration = duration
  end

  def deep_copy
    Marshal::load(Marshal.dump(self))
  end
end

class PrototypeManager
  def initialize
    @prototypes = {}
  end

  def set(key, prototype)
    if @prototypes.include? key
      raise IndexError, "A prototype is already assigned to this key: #{key}"
    else
      @prototypes[key] = prototype
    end
  end

  def unset(key)
    if !@prototypes.include? key
      raise IndexError, "This key doesn't exist in prototype: #{key}"
    else
      @prototypes.delete key
    end
  end

  def get(key)
    @prototypes[key].deep_copy
  end
end


# prototype = PrototypeManager.new
# prototype.set :half_note, Note.new(0.5)
# prototype.set :full_note, Note.new(1)
#
# note = prototype.get(:full_note)
# note.duration
