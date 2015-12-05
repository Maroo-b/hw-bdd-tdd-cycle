Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create(movie)
  end
end

Then /the director of "(.*)" should be "(.*)"/ do |e1,e2|
    movie = Movie.find_by_title(e1)
    expect(movie.director).to eq(e2)
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  
  page.body.should =~ /#{e1}.*#{e2}/m
  #fail "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
 
  rating_list.split(", ").each do |rate|
    p rate
      if uncheck
        uncheck("ratings_#{rate}") 
      else  
        check("ratings_#{rate}")
      end
  end   
 
  
  
  #fail "Unimplemented"
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  page.all('table#movies tbody tr').count.should == Movie.count 
  #fail "Unimplemented"
end
