require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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

  scenario "cart counter goes up when an item is added" do
    # ACT
    visit root_path

    click_on('Add', match: :first)
    
    expect(page).to have_content 'My Cart (1)'
    save_screenshot 'add_to_cart_test_one.png'
  end
end
