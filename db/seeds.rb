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
            :company_id => Companies.first)