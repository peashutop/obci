Given /^the following questions:$/ do |questions|
  Question.create!(questions.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) question$/ do |pos|
  visit questions_url
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following questions:$/ do |expected_questions_table|
  expected_questions_table.diff!(tableish('table tr', 'td,th'))
end

Given /^I have questions short_named (.+)$/ do |question_names|
  question_names.split(', ').each do |question_name|
    Question.create!( :name_short => question_name )    ### But... there are assumptions here... that we want a Question model...
  end
end
