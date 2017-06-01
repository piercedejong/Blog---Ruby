require 'rails_helper'

RSpec.feature 'User creates a new Article', type: :feature do
  describe 'User fills in the form and presses create Article' do
    describe " works " do
      #let!(@current_user) {User.create(name: "Pierce Test", email: "pierce@test.com", photo: "https://pbs.twimg.com/profile_images/856041767220649984/dJQxT0Dz.jpg")}
      #@current_user = true
      visit new_article_path

      fill_in 'article_title', with: 'Test Title'
      #fill_in 'article_about', with: 'Test About'
      #fill_in 'article_text', with: 'Test Text'
      #click_button 'create'
      element = page.find('#lmao')

      expect(page).to have_css 'article_title', 'Test Title'
    end
  end
#  scenario 'User forgets to fill out the about box' do
#    visit new_article_path

#    fill_in 'article_title', with: 'Test Title'
#    fill_in 'article_about', with: ''
#    fill_in 'article_text', with: 'Test Text'
#    click_button 'create'

#    expect(page).to have_css("h2 a", :text => 'prohibited this article from being saved:')
#  end
end
