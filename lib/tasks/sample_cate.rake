namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_cate_items
  end
end

def make_cate_items

  smartPhone = Category.create!(name:"Smart Phones", category_level: 1, subtitle:"Just name it, it's here")
  tablets = Category.create!(name:"Tablets", category_level: 1, subtitle:"The new iPad mini has ARRIVED!!")
  accessory = Category.create!(name:"Accessories", category_level: 1, subtitle:"Your device can't work alone!")
  dumbphone = Category.create!(name:"DUMB Phones", category_level: 1, subtitle:"Old school is also fun!")
  other = Category.create!(name:"Other Mobile Device", category_level: 1, subtitle:"MP3/MP4/GPS/CD Player")
  mobileforRent = Category.create!(name:"Mobile for RENT", category_level: 1, subtitle:"Ever wanted to rent a phone")

  #smartphone sub categories
  iphone = Category.create!(name:"iPhone 3/3G/4/4s/5", parent_category_id:1, category_level: 2, subtitle:"Need I say more?")
  htc = Category.create!(name:"HTC", parent_category_id:1, category_level: 2, subtitle:"Nice and slick, with Android")
  google_Nexus = Category.create!(name:"Google", parent_category_id:1, category_level: 2, subtitle:"Father of Android")
  samsung = Category.create!(name:"Samsung", parent_category_id:1, category_level: 2, subtitle:"Gautnam Style! Just kidding")
  nokia = Category.create!(name:"Nokia", parent_category_id:1, category_level: 2, subtitle:"Lumia 920/ Windows NT")
  more = Category.create!(name:"More", parent_category_id:1, category_level: 2, subtitle:"There's always more!")

  #tablets sub categories
  iPad = Category.create!(name:"iPad 1/2/new", parent_category_id:2, category_level: 2, subtitle:"")
  kindle = Category.create!(name:"Kindle", parent_category_id:2, category_level: 2, subtitle:"")
  andriod = Category.create!(name:"Lenovo", parent_category_id:2, category_level: 2, subtitle:"")
  nuke = Category.create!(name:"Nuke", parent_category_id:2, category_level: 2, subtitle:"")
  windows_8 = Category.create!(name:"Surface", parent_category_id:2, category_level: 2, subtitle:"")
  more2 = Category.create!(name:"More", parent_category_id:2, category_level: 2, subtitle:"")

  #accessories sub categories
  phone_Cases= Category.create!(name:"Phone Cases", parent_category_id:3, category_level: 2, subtitle:"")
  screen_Protector = Category.create!(name:"Screen Protector", parent_category_id:3, category_level: 2, subtitle:"")
  headset= Category.create!(name:"Headset", parent_category_id:3, category_level: 2, subtitle:"")
  decoration = Category.create!(name:"Decoration", parent_category_id:3, category_level: 2, subtitle:"")
  eccentric = Category.create!(name:"Eccentric", parent_category_id:3, category_level: 2, subtitle:"")
  more3 = Category.create!(name:"More", parent_category_id:3, category_level: 2, subtitle:"")

  #dumbphone sub categories
  dumb1= Category.create!(name:"Nokia", parent_category_id:4, category_level: 2, subtitle:"")
  dumb2 = Category.create!(name:"Motorola", parent_category_id:4, category_level: 2, subtitle:"")
  dumb3= Category.create!(name:"Simens", parent_category_id:4, category_level: 2, subtitle:"")
  more4 = Category.create!(name:"More", parent_category_id:4, category_level: 2, subtitle:"")

  #other device sub categories
  ipod= Category.create!(name:"iPod touch/nano/shuffle", parent_category_id:5, category_level: 2, subtitle:"")
  mp3 = Category.create!(name:"MP3", parent_category_id:5, category_level: 2, subtitle:"")
  cdp= Category.create!(name:"CD Player", parent_category_id:5, category_level: 2, subtitle:"")
  walkman = Category.create!(name:"Walkman", parent_category_id:5, category_level: 2, subtitle:"")
  more5 = Category.create!(name:"More", parent_category_id:5, category_level: 2, subtitle:"")

  #for rental
  phone_Cases= Category.create!(name:"iPhone", parent_category_id:6, category_level: 2, subtitle:"")
  screen_Protector = Category.create!(name:"Tablets iPad/Kindle", parent_category_id:6, category_level: 2, subtitle:"")
  headset= Category.create!(name:"Samsung", parent_category_id:6, category_level: 2, subtitle:"")
  more3 = Category.create!(name:"More", parent_category_id:6, category_level: 2, subtitle:"")
end

