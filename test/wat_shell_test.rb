require './test/test_helper'

Wat.included(self)

def assert_equal(foo, bar)
  raise unless foo == bar
end

def assert(foo)
  raise unless !!foo
end

assert_equal(3, cat('Gemfile').size)

result = git status

assert_equal(Array, result.class)

assert(!result.grep(/Your branch/).nil?)
result = echo this is the best

assert_equal("this is the best", result.first)

assert(ls.size > 5)
assert(ls.include? "Gemfile")
