Given /^the following questions:$/ do |questions|
  Question.create!(questions.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) question$/ do |pos|
  visit admin_questions_url
#  within("table tr:nth-child(#{pos.to_i+1})") do
#    click_link "Destroy"
#  end
  click_link "Details"
  click_link "Delete"
end

Then /^I should see the following questions:$/ do |expected_questions_table|
  expected_questions_table.diff!(tableish('table tr', 'td,th'))
end

Given /^I have questions named (.+)$/ do |question_names|
  question_names.split(', ').each do |question_name|
      Question.create!(:name_short => question_name)
      ### Hmm, there are /some/ assumptions here... that we want a Question model...
      ### seems like this is where we are making an implementation decision
      ### guess it has to be made somewhere, but... why here? is this the best place?
      ### i don't feel i have a good context here for what these question things have to
      ### do... it's just a very small context i'm looking at, to satisfy this matcher business
      ### which maps from cukey english to my app's language...
  end
end