require 'rails_helper'

RSpec.feature "Visitor navigates to product page", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They click the Details link on a product and see its details" do
    visit root_path
    first("article.product").find_link('Details').click
    expect(page).to have_content "Description"
  end
end 