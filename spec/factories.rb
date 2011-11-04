FactoryGirl.define do
  # Namespacing this in a module Restbook doesn't do the trick, but
  # there must be a DRYer way than specifying Restbook::<class> each time.
  factory :comment, :class => Restbook::Comment do
    author "The Dude"
    body "The dude abides."
  end
end