# README
Website: Food review
Develop by : Nobita Team

#### Hướng dẫn cài đặt để chạy được app trên _localhost:3000_:

1. **Bước 1: cài đặt bower nếu chưa có**
```
$ sudo apt-get install nodejs
$ sudo apt-get install npm
$ sudo npm install bower -g
```

2. **Bước 2: clone code từ github về**
```
$ git clone https://github.com/huntojkojqw01/tora-nobita-food-review.git nobita
$ cd nobita
$ bower install
$ bundle install
```
	Ở bước bundle install này có thể có trục trặc nhỏ, nếu vậy liên hệ anh Hùng 01656054391.
	Đây là bước quan trọng , nếu màu xanh hiện lên cuối con đường là suôn sẻ.
3. **Bước 3: tạo dữ liệu ban đầu**
```
$ rails db:reset
```
	Lệnh này sẽ chạy file _/db/seeds.rb_ để tạo ra các bản ghi trong cơ sở dữ liệu, một số user,store,food,review sẽ được tạo ra.
	Các tài khoản sẽ được tạo ra có thông tin như trong file _seeds.rb_ nói trên.