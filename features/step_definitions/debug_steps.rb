#http://stackoverflow.com/questions/2136334/rails-cucumber-webrat-redirect-to-flashnotice-not-working/2136943#2136943

Then /^I debug$/ do
 breakpoint; 0
end

Then /^I open the page$/ do
  save_and_open_page
end
