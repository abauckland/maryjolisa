# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include Sprig::Helpers

sprig [Company, User, Tile, Background, Font, Detail, Design, Hour, Mileages]



Company.create(:name => "MyHq", :subdomain => 'myhq', :plan => 1)

User.create(:first_name => "Louise",
            :surname => "Pinfold",
            :email => "demo@gmail.com",
            :role => 0,
            :encrypted_password => "$2a$10$fo7oncwWPqVQLTnxxR7mSu/Wr3WVDjt451aUe59xbfShywRzQa5Ma",
            :company_id => ::Company.first)
            
Mjweb::Tile.create(:name => "Credit Union Link", :partial_name => 'credit_union_link', :group => 1)
Mjweb::Tile.create(:name => "Books Link", :partial_name => 'books_link', :group => 1)
Mjweb::Tile.create(:name => "Webpages Link", :partial_name => 'webpages_link', :group => 1)
Mjweb::Tile.create(:name => "Networking Link", :partial_name => 'networking_link', :group => 1)
Mjweb::Tile.create(:name => "Mentoring Link", :partial_name => 'mentoring_link', :group => 1)
Mjweb::Tile.create(:name => "Training Link", :partial_name => 'training_link', :group => 1)
Mjweb::Tile.create(:name => "Events Link", :partial_name => 'events_link', :group => 1)
Mjweb::Tile.create(:name => "Plans Link", :partial_name => 'plans_link', :group => 1)

Mjweb::Tile.create(:name => "Transparent Tile", :partial_name => 'transparent_tile', :group => 2)
Mjweb::Tile.create(:name => "Colour Tile", :partial_name => 'colour_tile', :group => 2)
Mjweb::Tile.create(:name => "Contact", :partial_name => 'contact', :group => 2)
Mjweb::Tile.create(:name => "Location Map", :partial_name => 'map', :group => 2)
Mjweb::Tile.create(:name => "Opening Hours", :partial_name => 'hours', :group => 2)
Mjweb::Tile.create(:name => "Image", :partial_name => 'image', :group => 2)
Mjweb::Tile.create(:name => "Multiple Images", :partial_name => 'images', :group => 2)
Mjweb::Tile.create(:name => "Services", :partial_name => 'services', :group => 2)
Mjweb::Tile.create(:name => "Services Link", :partial_name => 'services_link', :group => 2)
Mjweb::Tile.create(:name => "Products", :partial_name => 'products', :group => 2)
Mjweb::Tile.create(:name => "Products Link", :partial_name => 'products_link', :group => 2)
Mjweb::Tile.create(:name => "About Us Link", :partial_name => 'about', :group => 2)

Mjweb::Tile.create(:name => "E-commerce Link", :partial_name => 'ecommerce', :group => 3)

Mjweb::Background.create(:name => 'Textured Light Beige')
Mjweb::Background.create(:name => 'White Linen')

Mjweb::Font.create(:name => 'Ek Mukta')
Mjweb::Font.create(:name => 'Marck Script')

Mjweb::Detail.create(:company_id => ::Company.first)

Mjweb::Design.create(:company_id => ::Company.first, :tile_colour => '#9900CC', :background_id => 1, :font_id => 1)

Mjweb::Hour.create(:company_id => ::Company.first, 
                  :monday_status => "Open",
                  :monday_open => "2000-01-01 09:30:00",
                  :monday_close => "2000-01-01 17:30:00",
                  :tuesday_status => "Open",
                  :tuesday_open => "2000-01-01 09:30:00",
                  :tuesday_close => "2000-01-01 17:30:00",
                  :wednesday_status => "Open",
                  :wednesday_open => "2000-01-01 09:30:00",
                  :wednesday_close => "2000-01-01 17:30:00",
                  :thursday_status => "Open",
                  :thursday_open => "2000-01-01 09:30:00",
                  :thursday_close => "2000-01-01 17:30:00",
                  :friday_status => "Open",
                  :friday_open => "2000-01-01 09:30:00",
                  :friday_close => "2000-01-01 17:30:00",
                  :saturday_status => "Open",
                  :saturday_open => "2000-01-01 09:30:00",
                  :saturday_close => "2000-01-01 17:30:00",
                  :sunday_status => "Open",
                  :sunday_open => "2000-01-01 11:00:00",
                  :sunday_close => "2000-01-01 16:30:00")
                  
