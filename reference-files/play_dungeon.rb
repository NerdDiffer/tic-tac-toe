require_relative './dungeon'

myd = Dungeon.new 'FrankenBogg'

myd.add_room(
  :largecave, "Large Cave", "a large cavernous cave", { :west => :smallcave }
)

myd.add_room(
  :smallcave, "Small Cave", "a small, tight cave", { :east => :largecave }
)

myd.start :largecave
myd.go :west
myd.go :east
