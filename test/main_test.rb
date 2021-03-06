require 'test_helper'

describe "/ main landing page" do
  before { visit('/') }

  it "should successfully return all of the main sections" do
    page.must_have_content 'Benjamin Kanouse'
    page.must_have_content 'Software'
    page.must_have_content 'Mathematics'
    page.must_have_content 'Guitars'
  end

  it "should have the full info in each sub-section" do
    within(:css, "section#softwareSection") do
      page.must_have_content 'My Blog'
      page.must_have_content 'Elliptic Curve Cryptography'
      page.must_have_content 'MiniTest Bang'
      page.must_have_content 'Cylinders of Excellence (Rails Rumble)'
      page.must_have_content 'WebAdMIT'
      page.must_have_content 'Resume'
    end

    within(:css, "section#mathSection") do
      page.must_have_content 'Buoy in Lake Erie'
      page.must_have_content 'Birefringence Persentation'
      page.must_have_content 'Birefringence Poster'
    end

    within(:css, "section#guitarSection") do
      page.must_have_content 'Guitar 1'
      page.must_have_content 'Guitar 2 WIP'
    end

    within(:css, "section#starcraftSection") do
      page.must_have_content 'StarCraft'
    end
  end
end
