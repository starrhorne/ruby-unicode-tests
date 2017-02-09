# ruby-unicode-tests

A sinatra app that tests each method of Ruby's String class for unicode support and renders the results to HTML. 

If you're wondering why this is implemented as a sinatra app instead of a test suite, it's because the resulting HTML will be used in a blog post. The goal isn't to unit|test unicode support, but to generate a chart for any given version of Ruby.

# Instructions

To use the app, clone it then run `bundle install`. Then run `bundle ruby app.rb` and visit http://localhost:4567/
