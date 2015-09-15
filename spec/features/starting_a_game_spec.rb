require 'spec_helper'

feature 'Starting a new game' do
  scenario 'I am asked to enter my name' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content "What's your name?"
  end

  scenario 'after I entered my name' do
    visit '/'
    click_link 'New Game'
    fill_in('name', :with => 'John')
    click_button('submit')
    expect(page).to have_content "Welcome to Battleships, John!"
  end

  scenario 'after I did not enter my name' do
  visit '/'
  click_link 'New Game'
  click_button('submit')
  expect(page).to have_content "You did not enter a name. What's your name?"
  end

end