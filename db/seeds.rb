# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
35.times do |i|
user = User.create(:name=>'user'+i.to_s,:email=>'user'+i.to_s+'@example.com',:password=>'demouser'+i.to_s)
end