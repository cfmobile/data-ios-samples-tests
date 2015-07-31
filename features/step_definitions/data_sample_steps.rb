Given /^I am on the Welcome Screen$/ do
  element_exists("view")
  sleep(STEP_PAUSE)
end

Given /^I enter my username into input field number (\d+)$/ do |field|
  step "I enter \"#{ENV["USERNAME"]}\" into input field number #{field}"
end

Given /^I enter my password into input field number (\d+)$/ do |field|
  step "I enter \"#{ENV["PASSWORD"]}\" into input field number #{field}"
end
