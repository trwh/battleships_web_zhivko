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

  scenario 'to have content board' do
    visit '/new_game'
    fill_in('name', :with => 'John')
    click_button('submit')
    click_link('Start the game')
    expect(page).to have_content "Board"
  end
end

feature 'Playing the game' do

  scenario 'placing a ship on the board' do
    visit '/new_game'
    visit '/start_the_game'
    fill_in('coordinate', :with => 'A1')
    click_button('Place')
    expect(page.text).to match (/S A4/)
  end

  scenario 'cannot place ship over one another' do
    visit '/start_the_game'
    fill_in('coordinate', :with => 'A1')
    click_button('Place')
    fill_in('coordinate', :with => 'A3' )
    click_button('Place')
    expect(page).to have_content "You cannot place a ship there!"
  end

  scenario 'cannot place ship off the board' do
    visit '/start_the_game'
    fill_in('coordinate', :with => 'A11')
    click_button('Place')
    expect(page).to have_content "You cannot place a ship there!"
  end

  scenario 'can place two ships with different sizes' do
    visit '/start_the_game'
    fill_in('coordinate', :with => 'B1' )
    click_button('Place')
    expect(page.text).to match (/S B5/)
  end

end
