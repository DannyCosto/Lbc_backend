# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Item.all.destroy_all
Order.all.destroy_all
User.all.destroy_all
ItemOrder.all.destroy_all

jewelry = [
    { name:"Simple Band",
        price:  2100.00,
      description: "18K Rose Gold weighing 10.17 grams along with a .13 carat VS Pink Diamond",
      img: "https://i.ibb.co/LQny9Vj/IMG-1895.jpg"
    },
    { name:"Simple Band",
        price:  2100.00,
      description: "18K White Gold weighing 10.71 grams. along with a .11-.13 carat VS Blue Diamond",
      img: "https://i.ibb.co/X4ppBYp/IMG-1893.jpg"
    },
    { name:"Simple Band",
        price: 2100.00,
      description: "18K Yellow Gold weighing 10.54 grams along with a .15 carat VS Yellow Diamond",
      img: "https://i.ibb.co/dgy7LkV/IMG-1894.jpg"
    },
    { name:"Fancy Double Band",
    img: "https://i.ibb.co/PNkmmhH/IMG-1960.jpg",
    price: 2400.00,
    description: "18K Yellow gold weighing 8.44 grams along with two VS/S yellow diamonds totaling .25 carats Available in all gold finishes White/Yellow/Rose and Platinum"
    },
    { name:"Fancy Single Band",
      description: "18K Rose Gold weighing 7.50 grams along with a .11 carat VS/S Pink Diamond Available in all gold finishes White/Yellow/Rose and Platinum ",
      img: "https://i.ibb.co/BzBtpKq/IMG-1959.jpg",
      price: 2200.00
    },
    { name:"Traditional Iced Cross",
      description: "18K White Gold Cross chain weighing 3 grams along with a total .70 carats Green/Blue, and Grey VS/S Diamonds Chain ",
      img: "https://i.ibb.co/K2NGXxv/IMG-2206.jpg",
      price: 2500.00
    },
    { name:"Honey Comb Chain",
      description: "18K Yellow Gold weighing 7.20 grams along with .70 in different Yellow/Green, and Brown S Class Diamonds with chain",
      img: "https://i.ibb.co/B6w7g98/IMG-2207.jpg",
      price: 3200.00
    }]

Item.create(jewelry)
u1 = User.create(username:"cozy", password: "danny", first_name:"Danny", last_name:"Costelloe", email:"danny.costelloe@gmail.com", shipping_address:"74 Croyden Ct")

past_order1 = Order.create(user: u1, checked_out: true)
past_order2 = Order.create(user: u1, checked_out: true)
current_order = u1.orders.create(checked_out: false)

3.times do 
    ItemOrder.create(order: past_order1, item: Item.all.sample)
end

2.times do 
    ItemOrder.create(order: past_order2, item: Item.all.sample)
    ItemOrder.create(order: current_order, item: Item.all.sample)
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

puts "done seeding"

