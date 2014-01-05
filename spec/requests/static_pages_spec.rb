require 'spec_helper'


<<<<<<< HEAD
describe "Static pages" do

  subject { page }
=======
    it "should have the h1 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Sample App')
    end
    it "should have the basetitle" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => 'Ruby on Rails')
    end
    it "should haven't the custom title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => '| Home')
    end
  end
  describe "Contact page" do
>>>>>>> master

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector 'title', text: '| Home' }
  end

  describe "Help page" do
      before { visit help_path }  
      it { should have_selector('title', text: full_title('')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_selector('title', text: full_title('')) }
  end

  describe "Contact page" do
    before { visit contact_path }
    it { should have_selector('title', text: full_title('')) }
  end
end