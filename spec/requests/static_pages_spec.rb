require 'spec_helper'


describe "Static pages" do

<<<<<<< HEAD
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
=======
  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1',    text: "") }
    it { should have_selector('title', text: full_title(page_title)) }
>>>>>>> filling-in-layout
  end
  describe "Home page" do
    before { visit root_path }
    let(:page_title) { 'Home' }

    it_should_behave_like "all static pages"
    it { should_not have_selector('title', text: "| Home" )}
  end

  describe "Help page" do
      before { visit help_path }  
      let(:page_title) { 'Help' }
      it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }
    let(:page_title) { 'About' }
    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { visit contact_path }
    let(:page_title) { 'Contact' }
    it_should_behave_like "all static pages"
  end
end