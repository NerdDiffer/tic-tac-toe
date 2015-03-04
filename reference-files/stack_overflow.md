##ruby best practice for preventing changes to instance variables once it's already set

There is a class called `Section`, with an instance method `#change_mark`.
I'm trying to build in some simple protections to prevent one of its instance variables from being set, once that instance variable is set to something that is NOT nil.

Here's what I have:

``` Ruby
module MyModule
  class Section
    attr_accessor :id, :mark

    def initialize(id, mark)
      @id = id
      @mark = mark
    end

    def change_mark(mark)
      if @mark != nil?
        message = "Section ##{@id} is already marked. Choose another."
        raise RuntimeError.new(message)
      else
        @mark = mark
      end
    end

  end

end
```
For what it's worth, the `Section` class is part of the `MyModule` mixin. 
There are other objects of classes in this module that will send messages to an instance of Section.
Is raising an error the simplest way to prevent changes to an already-set instance variable? If not, what can I do?
