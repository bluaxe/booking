Booking
=======

##environment
	Ruby version              1.9.3 (i686-linux)
	RubyGems version          1.8.23
	Rack version              1.5
	Rails version             4.0.0
	JavaScript Runtime        therubyracer (V8)
	Active Record version     4.0.0
	Action Pack version       4.0.0
	Action Mailer version     4.0.0
	Active Support version    4.0.0

##Description
目前实现了以下功能:

 * 地点管理
 * 房间管理
 * 按房间自定义时间表
 * 订单管理
 * 基本管理员界面

###extra
database.yml 及 config/development.rb 因为包含帐号信息所以未同步

##stats
	+----------------------+-------+-------+---------+---------+-----+-------+
	| Name                 | Lines |   LOC | Classes | Methods | M/C | LOC/M |
	+----------------------+-------+-------+---------+---------+-----+-------+
	| Controllers          |   378 |   317 |       8 |      39 |   4 |     6 |
	| Helpers              |    16 |    16 |       0 |       0 |   0 |     0 |
	| Models               |    42 |    39 |       5 |       1 |   0 |    37 |
	| Mailers              |    13 |    12 |       1 |       1 |   1 |    10 |
	| Javascripts          |    42 |     3 |       0 |       2 |   0 |    -1 |
	| Libraries            |     0 |     0 |       0 |       0 |   0 |     0 |
	| Controller tests     |    49 |    21 |       7 |       0 |   0 |     0 |
	| Helper tests         |    28 |    21 |       7 |       0 |   0 |     0 |
	| Model tests          |    28 |    12 |       4 |       0 |   0 |     0 |
	| Mailer tests         |     7 |     3 |       1 |       0 |   0 |     0 |
	| Integration tests    |     0 |     0 |       0 |       0 |   0 |     0 |
	+----------------------+-------+-------+---------+---------+-----+-------+
	| Total                |   603 |   444 |      33 |      43 |   1 |     8 |
	+----------------------+-------+-------+---------+---------+-----+-------+
	  Code LOC: 387     Test LOC: 57     Code to Test Ratio: 1:0.1
