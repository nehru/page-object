Then /^the current item should be "([^\"]*)"$/ do |expected_text|
  @page.sel_list_id.should == expected_text
end

Then /^the text should be "([^\"]*)"$/ do |expected_text|
  @text.should == expected_text
end

Then /^I should be on the success page$/ do
  @page.text.should include 'Success'
  @page.title.should == 'Success'
end

Then /^I should be able to submit the form$/ do
  @element.submit
end

When /^I locate the form by "([^\"]*)"$/ do |how|
  @element = @page.send "form_#{how}_element"
end

When /^I locate the form using "([^"]*)" and "([^"]*)"$/ do |param1, param2|
  @element = @page.send "form_#{param1}_#{param2}_element"
end

When /^I get the text from the list item$/ do
  @text = @page.li_id
end

When /^I search for the list item by "([^\"]*)"$/ do |how|
  @text = @page.send "li_#{how}"
end

When /^I search for the list item by "([^"]*)" and "([^"]*)"$/ do |param1, param2|
  @text = @page.send "li_#{param1}_#{param2}"
end

When /^I get the first item from the unordered list$/ do
  @element = @page.ul_id_element[0]
end

Then /^the list items text should be "([^\"]*)"$/ do |expected_text|
  @element.text.should == expected_text
end

When /^I search for the unordered list by "([^\"]*)"$/ do |how|
  @list = @page.send "ul_#{how}_element"
end

When /^I search for the unordered list by "([^"]*)" and "([^"]*)"$/ do |param1, param2|
  @list = @page.send "ul_#{param1}_#{param2}_element"
end


When /^I get the first item from the list$/ do
  @element = @list[0]
end

When /^I get the first item from the ordered list$/ do
  @element = @page.ol_id_element[0]
end

When /^I search for the ordered list by "([^\"]*)"$/ do |how|
  @list = @page.send "ol_#{how}_element"
end

When /^I search for the ordered list by "([^"]*)" and "([^"]*)"$/ do |param1, param2|
  @list = @page.send "ol_#{param1}_#{param2}_element"
end

Then /^the table should have "([^\"]*)" rows$/ do |rows|
  @element.rows.should == rows.to_i
end

Then /^each row should contain "([^\"]*)"$/ do |text|
  @element.each do |row|
    row.text.should include text
  end
end

Then /^row "([^\"]*)" should have "([^\"]*)" columns$/ do |row, cols|
  @element[row.to_i - 1].columns.should == cols.to_i
end

Then /^each column should contain "([^\"]*)"$/ do |text|
  row = @element[0]
  row.each do |column|
    column.text.should include text
  end
end

Then /^the list should contain (\d+) items$/ do |items|
  @list.items.should == items.to_i
end

Then /^each item should contain "([^\"]*)"$/ do |text|
  @list.each { |item| item.text.should include text }
end

Then /^option "([^\"]*)" should contain "([^\"]*)"$/ do |opt_num, text|
  @element = @page.send "sel_list_#{@how}_element".to_sym
  @element[opt_num.to_i - 1].text.should == text
end

Then /^each option should contain "([^\"]*)"$/ do |text|
  @element.options.each do |option|
    option.text.should include text
  end
end
