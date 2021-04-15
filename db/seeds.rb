# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "walter_aab", first_name: "Walter", last_name: "Aab", email: "aabwalter@yahoo.com", password: "password!!!", is_lender: true, street: "613 Victoria Ln.", city: "Wood Dale", state: "IL", zipcode: 60191)
User.create(username: "dario_losa", first_name: "Dario", last_name: "Losa", email: "losadario@gmail.com", password: "password!!!", is_lender: false, street: "1001 Summerfield Dr.", city: "Roselle", state: "IL", zipcode: 60172)
User.create(username: "jane_lopez", first_name: "Jane", last_name: "Lopez", email: "janelopez@gmail.com", password: "password!!!", is_lender: false, street: "1485 Civic Dr.", city: "Concord", state: "CA", zipcode: 94520)

Listing.create(title: "Husqvarna 460 Rancher 20-Inch Chain Saw", category: "Yard Work", description: "The Husqvarna 460 Rancher 20-Inch Chain Saw has the perfect mix of power and reliability. With a powerful 60.3cc two-stroke engine, this model can handle a lot of work, ripping through branches and trees in no time.", price: 24.99, lender_id: 1)
Listing.create(title: "Ryobi - 14 in. 40-Volt Brushless, Cordless Chainsaw", category: "Power Tools", description: "Includes a Brushless Motor for Increased Run Time and Power.", price: 14.99, lender_id: 1)
Listing.create(title: "HERCULES 15 Amp 66 Lb. 1-1/8 In. Hex Breaker Hammer With Maximum Vibration Control", category: "Power Tools", description: "This powerful breaker hammer has a universal 1-1/8 in. hex retainer that can be used with collared or non-collared bits to maximize performance. Anti-vibration technology delivers hours of hard use with minimal fatigue.", price: 34.99, lender_id: 2)
Listing.create(title: "Dewalt XR Li-Ion Compact Brushless Drill / Driver", category: "House Remodeling", description: "DEWALT brushless motor delivers up to 57% more run time over brushed. Ergonomic comfort grip handle provides ideal balance and tool control", price: 9.99, lender_id: 2)
Listing.create(title: "True Temper 6' Cubic Steel Wheelbarrow", category: "Yard Work", description: "Heavy-duty undercarriage. Tough steel handles w/comfort grips. 16 inch sport flat-free tire, never needs air", price: 10.99, lender_id: 3)
Listing.create(title: "Cordless Brushed Circular Saw Tool", category: "Power Tools", description: "DCS391B 20V MAX 6-1/2 in. circular saw with a 6-1/2 in. carbide tipped blade operates on a powerful 5150 rpm motor with a 0 to 50-degree bevel capacity on a lightweight and durable magnesium shoe.", price: 12.99, lender_id: 3)

Reservation.create(check_in: "2021-04-08", check_out: "2021-04-10", deposit: nil, listing_id: 1, borrower_id: 2)
Reservation.create(check_in: "2021-04-08", check_out: "2021-04-10", deposit: nil, listing_id: 3, borrower_id: 1)

Review.create(description: "Very good.", rating: 5, borrower_id: 2, reservation_id: 1, listing_id: 1)