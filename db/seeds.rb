require 'csv'
# tao danh sach cac comment san co:
comments=[]
str=""
f=File.open("./db/comment","r")
while !f.eof?
	row=f.readline
	if row.length>1
		str+=row
	else
		comments<<String.new(str)
		str=""
	end
end

User.destroy_all
hungnd=User.create(name: "Nguyen Dinh Hung",email: "hungnd.k58@gmail.com",password: "12345678",password_confirmation: "12345678",activated: true,activated_at: Time.now)
linhnd=User.create(name: "Nguyen Duc Linh",email: "linhnd@gmail.com",password: "12345678",password_confirmation: "12345678",activated: true,activated_at: Time.now)
anhtt=User.create(name: "Tran Tuan Anh",email: "anhtt@gmail.com",password: "12345678",password_confirmation: "12345678",activated: true,activated_at: Time.now)
toannt=User.create(name: "Nguyen Huu Toan",email: "toannh@gmail.com",password: "12345678",password_confirmation: "12345678",activated: true,activated_at: Time.now)
tungtt=User.create(name: "To Thanh Tung",email: "tungtt@gmail.com",password: "12345678",password_confirmation: "12345678",activated: true,activated_at: Time.now)
quangpkv=User.create(name: "Phung Khac Viet Quang",email: "quangpkv@gmail.com",password: "12345678",password_confirmation: "12345678",activated: true,activated_at: Time.now)
admin=User.create(name: "Admin",email: "admin@gmail.com",password: "12345678",password_confirmation: "12345678",activated: true,activated_at: Time.now)

CSV.foreach("./db/user","r").with_index do |row,i|
	User.create(name: row.first,email: "user-#{i}@gmail.com",password: "12345678",password_confirmation: "12345678",activated: true,activated_at: Time.now)
end

Dir.entries("./public/user_avatar").reject{|f| f=="."||f==".."}.each do |avatar|
	tmp_user=User.find_by_id avatar.split('.').first
	if tmp_user
		tmp_user.update(avatar: File.open(Rails.root + "./public/user_avatar/#{avatar}"))
	end
end

Store.destroy_all
ml=Store.create(name: "Minh Lan",address: "1 Chân Cầm, Quận Hoàn Kiếm, Hà Nội",user: hungnd)
cv=Store.create(name: "Cơm Viên",address: "11 Đình Ngang, Quận Hoàn Kiếm, Hà Nội",user: linhnd)
nv=Store.create(name: "Nấm Việt Hà Thành",address: "230 Lò Đúc, Quận Hai Bà Trưng, Hà Nội",user: anhtt)
gd=Store.create(name: "Quán Gia Đình",address: "102 B8 Tô Hiệu, Quận Cầu Giấy, Hà Nội",user: toannt)
fh=Store.create(name: "Food House Thái Hà",address: "85 Thái Hà,  Quận Đống Đa, Hà Nội",user: tungtt)
xk=Store.create(name: "Bếp Xuka",address: "35 Nhà Chung ,  Quận Hoàn Kiếm, Hà Nội",user: quangpkv)
sq=Store.create(name: "Sỉn Quán",address: "47 Bát Đàn,  Quận Hoàn Kiếm, Hà Nội",user: admin)

Food.destroy_all
Food.create(
	store: ml,
	name: "Nem chua",
	price: (rand(100)+1)*1000,
	description: "Không giống nem chua rán vốn khô và có màu vàng ruộm, nem chua nướng vẫn giữ nguyên được màu hồng tươi của thịt cùng với một chất keo dinh dính bao bọc bên ngoài. Chấm một chút ớt trong chiếc bát đựng nhỏ, mùi thơm cùng miếng nem nướng như hòa quyện và tan ra khi đưa lên miệng. Ngoài nem nướng, bạn còn có thể chọn những món nhắm khác như cá chỉ vàng, cá bò hay mực nướng...")
Food.create(
	store: cv,
	name: "Nem lụi",
	price: (rand(100)+1)*1000,
	description: "Nem được làm từ giò sống, vo tròn sau đó ghim vào que tre đem nướng trên than hoa, có khi ấn dẹp quấn vào cây sả để nướng. Món này dùng tương đậu nành pha với gan xay nhuyễn, nấu lên nêm vào tí đường, nước chấm hơi sền sệt, phía bên trên rắc lạc rang.")
Food.create(
	store: gd,
	name: "Nem rán",
	price: (rand(100)+1)*1000,
	description: "Nem chua được làm từ thịt, bì lợn, thính (gạo rang rồi nghiền), nhờ có sự lên men do được ủ kín từ 2-3 ngày mà nem khi chín có vị chua, ngậy hấp dẫn, khi đem rán dậy lên mùi rất thơm.")
Food.create(
	store: fh,
	name: "Bún ngan và chả ngan nướng",
	price: (rand(100)+1)*1000,
	description: "Thịt ngan được tẩm ướp gia vị, rồi nướng trên bếp than hoa. Sau khi nướng xong, những miếng chả vẫn giữ được vị thơm ngọt của thịt ngan. Chả ăn kèm với nước mắm ớt tỏi, loại nước mắm này được cô chủ pha chế đặc biệt không giống bất kỳ hàng chả ngan nào khác.")
Food.create(
	store: xk,
	name: "Chè xoài ",
	price: (rand(100)+1)*1000,
	description: "Xoài được cắt miếng, đem nấu đông cùng rau câu rồi để ra bát nhỏ. Tiếp đến cho một lớp kem trộn sữa lên bề mặt. Vì thế khi ăn, thực khách sẽ cảm thấy vừa có vị béo ngậy của sữa, vừa có vị thanh của xoài. Mỗi bát chè xoài có giá 8.000 đồng.")
Food.create(
	store: sq,
	name: "Phở rán",
	price: (rand(100)+1)*1000,
	description: "Từ miếng bánh phở lớn và trắng mềm ban đầu, đầu bếp sẽ cắt thành những miếng vuông chừng khoảng nửa bàn tay. Sau đó, bánh được rán sơ qua cho vàng đều, và khi có khách gọi, bánh sẽ được rán giòn và hơi cháy cạnh thơm phức.")
Food.create(
	store: sq,
	name: "Lòng nướng",
	price: (rand(100)+1)*1000,
	description: "Lòng nướng chấm với tương ớt pha loãng. Những miếng lòng, dạ dày sần sật, giòn giòn có thêm vị cay cay, ăn cũng hay hay.")
Food.create(
	store: sq,
	name: "Sữa chua mít",
	price: (rand(100)+1)*1000,
	description: "Ở đây có đa dạng các món chủ yếu chế biến từ sữa chua như chè sữa chua, sữa chua hoa quả, sữa chua trân châu thạch, sữa chua nếp cẩm, đặc biệt là sữa chua mít.")
Food.create(
	store: sq,
	name: "Bánh cuốn",
	price: (rand(100)+1)*1000,
	description: "Điểm hút khách chính của quán chính là chất lượng bánh, mỏng, mềm, nhân cũng rất ngon. Nhà hàng có món bánh cuốn nhân gà, thịt gà được cắt nhỏ xíu lẫn với mộc nhĩ. Hành khô của hàng cũng tự làm nên ăn giòn, không bị khô, ỉu và có mùi hôi như loại làm hàng loạt, giao khắp các hàng. Ruốc tôm của nhà hàng được xay mịn, ăn cũng khá ngon.")
Food.create(
	store: sq,
	name: "Bánh mì sốt vang",
	price: (rand(100)+1)*1000,
	description: "Nước sốt được đổ vào hầm với thịt, và các gia vị khác, cùng với một ít bột năng để tạo độ sánh cần thiết. Khi nước sốt đã sánh đặc vừa phải, đầu bếp cho thêm rau húng Láng, mùi ta, hành thái nhỏ để cho dậy mùi.")

Dir.entries("./public/food_data").reject{|f| f=="."||f==".."}.each do |food_id|
	tmp_food=Food.find_by_id food_id
	if tmp_food			
		Dir.entries("./public/food_data/#{food_id}").reject{|f| f=="."||f==".."}.each do |file_name|
			FoodPicture.create(food: tmp_food,picture: File.open(Rails.root + "./public/food_data/#{food_id}/#{file_name}"))
		end		
		User.pluck(:id).sample(rand(10)+10).each do |user_id|
			Review.create(food_id: food_id,user_id: user_id,point: rand(5)+1,content: comments.sample,updated_at: rand(1.years).seconds.ago)
		end		
	end
end