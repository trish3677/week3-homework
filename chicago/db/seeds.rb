places = [{:title => "Willis Tower", :photo => "http://upload.wikimedia.org/wikipedia/commons/b/ba/Sears_Tower_ss.jpg", :admission => 10, :description => "Large office building in downtown chicago"}, 
    {:title => "Field Museum", :photo => "http://upload.wikimedia.org/wikipedia/commons/8/89/Field_Museum_of_Natural_History.jpg", :admission => 20, :description => "Large museum on Lake Michigan"},
    {:title => "Art Institute", :photo => "http://upload.wikimedia.org/wikipedia/commons/7/70/Art_Institute_of_Chicago_Lion_Statue_%282-D%29.jpg", :admission => 30, :description => "Art musuem on Michigan Ave"},
    {:title => "Navy Pier", :photo => "http://upload.wikimedia.org/wikipedia/commons/a/a2/Navy_pier.jpg", :admission => 40, :description => "Tourist attraction on Lake Michigan"},
    {:title => "Soldier Field", :photo => "http://upload.wikimedia.org/wikipedia/commons/c/c7/Soldier_field_2006.jpg", :admission => 50, :description => "Home of the Chicago Bears"}]


places.each do |place|
	Place.find_or_create_by(title: place[:title]) do |p|
		p.photo = place[:photo]
		p.admission = place[:admission]
		p.description = place[:description]
	end
end

   
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
