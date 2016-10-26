

1) How many users are there?
  
  'SELECT COUNT(*) FROM "users"`
          Answer: 51
  
2) What are the 5 most expensive items?
  
  `Item.order(price: :desc).limit(5)`
  
3) What's the cheapest book?
  
  `Item.where(:category => 'Books').order(price: :asc).limit(1)`
  
4) Who lives at "6439 Zetta Hills, Willmouth, WY"? Do they have another address?
   
   `Address.where(street: '6439 Zetta Hills')` 

 part 2:
 
 `user.where(id: '40')`

 Part 3:

 `Address.joins(:user).where('users.first_name' => 'Corrine', 'users.last_name' => 'Little')`


5) Correct Virginie Mitchell's address to "New York, NY, 10108".
  
  `User.where(:first_name => '%Virginie%', :last_name => '%Mitchell%')`
  
   part 2:
    
    `User.where(:id => '39')`
  
  Part3:
  
   `Address.where(:id => '39').update_all(:city => 'New York', :state => 'NY', :zip => '10108')`

6) How much would it cost to buy one of each tool?

   `Item.where('category like ?', '%Tool%').sum :price`
  
7) How many total items did we sell?
   
   `Order.sum(:quantity)`

8) How much was spent on books?

'Order.select("SUM (orders.quantity * items.price) as total").joins(:item).where("items.category Like'%Books%'").first.total'
             
      Answer: 1081352

9) Simulate buying an item by inserting a User for yourself and an Order for that User.

  `User.create(:first_name => 'Keith', :last_name => 'Smith', :email => 'keilsmit@yahoo.com')`

  part 2:
  
 `User.where(:first_name => 'Keith')`
  
       Note:  id = 52 (user added today is id=52. added 'Keith' yesterday at id = 51)
  
  part 3:
  
      INSERT INTO orders(user_id, item_id, quantity, created_at) VALUES('51', '17', '300', date('now')); <---YESTERDAY'S SQL 

  `Order.create(:user_id => '52', :item_id => '18', :quantity => '500', :created_at => '')`         <---TODAY'S Ruby code

