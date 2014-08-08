# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Company.create(:name => "MyHq", :subdomain => 'www')

User.create(:first_name => "Louise",
            :surname => "Pinfold",
            :email => "demo@gmail.com",
            :role => 0,
            :encrypted_password => "$2a$10$fo7oncwWPqVQLTnxxR7mSu/Wr3WVDjt451aUe59xbfShywRzQa5Ma",
            :company_id => Company.first)
            
Mjweb::Tile.create(:name => "Transparent Tile", :partial_name => 'transparent_tile')
Mjweb::Tile.create(:name => "Colour Tile", :partial_name => 'colour_tile')
Mjweb::Tile.create(:name => "Contact", :partial_name => 'contact')
Mjweb::Tile.create(:name => "Location Map", :partial_name => 'map')
Mjweb::Tile.create(:name => "Opening Hours", :partial_name => 'hours')
Mjweb::Tile.create(:name => "Image", :partial_name => 'image')
Mjweb::Tile.create(:name => "Multiple Images", :partial_name => 'images')
Mjweb::Tile.create(:name => "Services", :partial_name => 'services')
Mjweb::Tile.create(:name => "Services Link", :partial_name => 'services_link')
Mjweb::Tile.create(:name => "About Us Link", :partial_name => 'about')
Mjweb::Tile.create(:name => "E-commerce Link", :partial_name => 'ecommerce')

Mjweb::Background.create(:name => 'Textured Light Beige')
Mjweb::Background.create(:name => 'White Linen')

Mjweb::Font.create(:name => 'Ek Mukta')
Mjweb::Font.create(:name => 'Marck Script')

Mjweb::Detail.create(:company_id => Company.first)

Mjweb::Design.create(:company_id => Company.first, :tile_colour => '#9900CC', :background_id => 1, :font_id => 1)