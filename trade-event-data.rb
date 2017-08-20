account = Account.new({name: 'Cazz0r', account_type: 0, credits: 69, created_at: DateTime.parse('2017-05-08 23:18'), updated_at: DateTime.parse('2017-05-08 23:18')})
account.save
user = User.find_by_username('Cazz0r')
TradeEvent.new({content: "Inserted Credit Account @ 1 Credit", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-08 23:18'), updated_at: DateTime.parse('2017-05-08 23:18')}).save
TradeEvent.new({content: "Remove 1 Credit. New Balance: 0", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-08 23:19'), updated_at: DateTime.parse('2017-05-08 23:19')}).save
TradeEvent.new({content: "Note Changed To 'Is the best'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-09 01:49'), updated_at: DateTime.parse('2017-05-09 01:49')}).save
TradeEvent.new({content: "Add 50 Credit. New Balance: 50", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-09 01:50'), updated_at: DateTime.parse('2017-05-09 01:50')}).save
TradeEvent.new({content: "Remove 50 Credit. New Balance: 0", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-09 01:51'), updated_at: DateTime.parse('2017-05-09 01:51')}).save
TradeEvent.new({content: "Note Changed To ''", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-09 01:51'), updated_at: DateTime.parse('2017-05-09 01:51')}).save
TradeEvent.new({content: "Add 69 Credit. New Balance: 69", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-15 22:44'), updated_at: DateTime.parse('2017-08-15 22:44')}).save
TradeEvent.new({content: "Note Changed To '69 kekeke'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-15 22:44'), updated_at: DateTime.parse('2017-08-15 22:44')}).save


account = Account.new({name: 'William Taskill', account_type: 0, credits: 100, created_at: DateTime.parse('2017-05-08 23:45'), updated_at: DateTime.parse('2017-05-08 23:45')})
account.save
user = User.find_by_username('Icarus Smith')
TradeEvent.new({content: "Inserted Credit Account @ 100 Credit", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-08 23:45'), updated_at: DateTime.parse('2017-05-08 23:45')}).save


account = Account.new({name: 'Luolaukko', account_type: 0, credits: 0, created_at: DateTime.parse('2017-05-08 23:51'), updated_at: DateTime.parse('2017-05-08 23:51')})
account.save
user = User.find_by_username('Icarus Smith')
TradeEvent.new({content: "Inserted Credit Account @ 180 Credit", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-08 23:51'), updated_at: DateTime.parse('2017-05-08 23:51')}).save
TradeEvent.new({content: "Note Changed To ' Heppu on Discord'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-09 01:52'), updated_at: DateTime.parse('2017-05-09 01:52')}).save
TradeEvent.new({content: "Remove 180 Credit. New Balance: 0", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-12 20:29'), updated_at: DateTime.parse('2017-05-12 20:29')}).save


account = Account.new({name: 'Kinght Falcon', account_type: 0, credits: 0, created_at: DateTime.parse('2017-05-08 23:51'), updated_at: DateTime.parse('2017-05-08 23:51')})
account.save
user = User.find_by_username('Icarus Smith')
TradeEvent.new({content: "Inserted Credit Account @ 100 Credit", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-08 23:51'), updated_at: DateTime.parse('2017-05-08 23:51')}).save
TradeEvent.new({content: "Remove 100 Credit. New Balance: 0", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-09 00:11'), updated_at: DateTime.parse('2017-05-09 00:11')}).save


account = Account.new({name: 'VanguardMK1', account_type: 0, credits: 120, created_at: DateTime.parse('2017-05-08 23:53'), updated_at: DateTime.parse('2017-05-08 23:53')})
account.save
user = User.find_by_username('Icarus Smith')
TradeEvent.new({content: "Inserted Credit Account @ 104 Credit", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-08 23:53'), updated_at: DateTime.parse('2017-05-08 23:53')}).save
TradeEvent.new({content: "Icarus Smith: Add 192 Credit. New Balance: 296", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-08 23:53'), updated_at: DateTime.parse('2017-05-08 23:53')}).save
TradeEvent.new({content: "Icarus Smith: Add 100 Credit. New Balance: 396", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-08 23:55'), updated_at: DateTime.parse('2017-05-08 23:55')}).save
TradeEvent.new({content: "Add 96 Credit. New Balance: 492", user_id: User.find_by_username('Faykan').id, account_id: account.id, created_at: DateTime.parse('2017-05-09 16:33'), updated_at: DateTime.parse('2017-05-09 16:33')}).save
TradeEvent.new({content: "Remove 492 Credit. New Balance: 0", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-09 21:00'), updated_at: DateTime.parse('2017-05-09 21:00')}).save
TradeEvent.new({content: "Add 120 Credit. New Balance: 120", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-06-02 20:48'), updated_at: DateTime.parse('2017-06-02 20:48')}).save
TradeEvent.new({content: "30 Modular Terminals/120 credit", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-06-03 20:45'), updated_at: DateTime.parse('2017-06-03 20:45')}).save


account = Account.new({name: 'GarrusVakarian32', account_type: 0, credits: 20, created_at: DateTime.parse('2017-05-08 23:54'), updated_at: DateTime.parse('2017-05-08 23:54')})
account.save
user = User.find_by_username('Icarus Smith')
TradeEvent.new({content: "Inserted Credit Account @ 20 Credit", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-08 23:54'), updated_at: DateTime.parse('2017-05-08 23:54')}).save


account = Account.new({name: 'Nutree', account_type: 0, credits: 10, created_at: DateTime.parse('2017-05-08 23:56'), updated_at: DateTime.parse('2017-05-08 23:56')})
account.save
user = User.find_by_username('Icarus Smith')
TradeEvent.new({content: "Inserted Credit Account @ 10 Credit", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-08 23:56'), updated_at: DateTime.parse('2017-05-08 23:56')}).save


account = Account.new({name: 'Darth Crispy', discord_name: 'Darth Dangerous', account_type: 0, credits: 40, created_at: DateTime.parse('2017-05-08 23:58'), updated_at: DateTime.parse('2017-05-08 23:58')})
account.save
user = User.find_by_username('Icarus Smith')
TradeEvent.new({content: "Inserted Credit Account @ 40 Credit", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-08 23:58'), updated_at: DateTime.parse('2017-05-08 23:58')}).save
TradeEvent.new({content: "Note Changed To 'aka Darth Dangerous'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-09 23:42'), updated_at: DateTime.parse('2017-05-09 23:42')}).save


account = Account.new({name: 'Alphalasi', account_type: 0, credits: 32, created_at: DateTime.parse('2017-05-08 23:59'), updated_at: DateTime.parse('2017-05-08 23:59')})
account.save
user = User.find_by_username('Icarus Smith')
TradeEvent.new({content: "Inserted Credit Account @ 32 Credit", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-08 23:59'), updated_at: DateTime.parse('2017-05-08 23:59')}).save


account = Account.new({name: 'Jennifer Irons', account_type: 0, credits: 112, created_at: DateTime.parse('2017-05-08 23:59'), updated_at: DateTime.parse('2017-05-08 23:59')})
account.save
user = User.find_by_username('Icarus Smith')
TradeEvent.new({content: "Inserted Credit Account @ 64 Credit", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-08 23:59'), updated_at: DateTime.parse('2017-05-08 23:59')}).save
TradeEvent.new({content: "Add 48 Credit. New Balance: 112", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-10 11:12'), updated_at: DateTime.parse('2017-08-10 11:12')}).save
TradeEvent.new({content: "Note Changed To 'Deposited 16 MTs'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-10 11:13'), updated_at: DateTime.parse('2017-08-10 11:13')}).save


account = Account.new({name: 'Simbad', account_type: 1, credits: 2107, created_at: DateTime.parse('2017-05-09 05:41'), updated_at: DateTime.parse('2017-05-09 05:41')})
account.save
user = User.find_by_username('Icarus Smith')
user2 = User.find_by_username('Faykan')
user3 = User.find_by_username('Prax Bloodwaters')
TradeEvent.new({content: "Inserted Credit Account @ 1 Credit", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-09 05:41'), updated_at: DateTime.parse('2017-05-09 05:41')}).save
TradeEvent.new({content: "Note Changed To 'Group Account'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-09 05:42'), updated_at: DateTime.parse('2017-05-09 05:42')}).save
TradeEvent.new({content: "Add 492 Credit. New Balance: 493", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-09 21:00'), updated_at: DateTime.parse('2017-05-09 21:00')}).save
TradeEvent.new({content: "Note Changed To 'VanguardMk1 Transfer balance'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-09 21:05'), updated_at: DateTime.parse('2017-05-09 21:05')}).save
TradeEvent.new({content: "Note Changed To 'VanguardMk1 deposited 492'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-09 22:29'), updated_at: DateTime.parse('2017-05-09 22:29')}).save
TradeEvent.new({content: "Add 140 Credit. New Balance: 633", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-05-10 21:00'), updated_at: DateTime.parse('2017-05-10 21:00')}).save
TradeEvent.new({content: "Note Changed To 'Buddy Love deposited 140'", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-05-10 21:04'), updated_at: DateTime.parse('2017-05-10 21:04')}).save
TradeEvent.new({content: "Add 87 Credit. New Balance: 720", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-05-11 05:31'), updated_at: DateTime.parse('2017-05-11 05:31')}).save
TradeEvent.new({content: "Note Changed To 'Horatius Alger deposited 87'", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-05-11 05:31'), updated_at: DateTime.parse('2017-05-11 05:31')}).save
TradeEvent.new({content: "Add 78 Credit. New Balance: 798", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-05-13 12:40'), updated_at: DateTime.parse('2017-05-13 12:40')}).save
TradeEvent.new({content: "Note Changed To 'VanguardMK1 donated 26MTs'", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-05-13 12:41'), updated_at: DateTime.parse('2017-05-13 12:41')}).save
TradeEvent.new({content: "Add 135 Credit. New Balance: 933", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-05-13 17:09'), updated_at: DateTime.parse('2017-05-13 17:09')}).save
TradeEvent.new({content: "Note Changed To 'Horatius loaded up 135 cigars.'", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-05-13 17:10'), updated_at: DateTime.parse('2017-05-13 17:10')}).save
TradeEvent.new({content: "Add 25 Credit. New Balance: 958", user_id: user3.id, account_id: account.id, created_at: DateTime.parse('2017-05-15 16:51'), updated_at: DateTime.parse('2017-05-15 16:51')}).save
TradeEvent.new({content: "Note Changed To 'Horatious Alger dropped 25 bromellite.'", user_id: user3.id, account_id: account.id, created_at: DateTime.parse('2017-05-15 16:52'), updated_at: DateTime.parse('2017-05-15 16:52')}).save
TradeEvent.new({content: "Add 16 Credit. New Balance: 974", user_id: user3.id, account_id: account.id, created_at: DateTime.parse('2017-05-17 04:03'), updated_at: DateTime.parse('2017-05-17 04:03')}).save
TradeEvent.new({content: "Note Changed To 'Prometheanfire dropped 16 tons of Bromellite.'", user_id: user3.id, account_id: account.id, created_at: DateTime.parse('2017-05-17 04:03'), updated_at: DateTime.parse('2017-05-17 04:03')}).save
TradeEvent.new({content: "Add 55 Credit. New Balance: 1029", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-18 22:55'), updated_at: DateTime.parse('2017-05-18 22:55')}).save
TradeEvent.new({content: "Note Changed To 'Horatius Alger 11 Painite - 55 Credits'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-18 22:56'), updated_at: DateTime.parse('2017-05-18 22:56')}).save
TradeEvent.new({content: "Remove 55 Credit. New Balance: 974", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-18 23:07'), updated_at: DateTime.parse('2017-05-18 23:07')}).save
TradeEvent.new({content: "Note Changed To 'Horatius Alger took Painite back'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-18 23:08'), updated_at: DateTime.parse('2017-05-18 23:08')}).save
TradeEvent.new({content: "Add 12 Credit. New Balance: 986", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-19 04:28'), updated_at: DateTime.parse('2017-05-19 04:28')}).save
TradeEvent.new({content: "Note Changed To 'Prometheanfire 4 MT 12 Credit'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-19 04:29'), updated_at: DateTime.parse('2017-05-19 04:29')}).save
TradeEvent.new({content: "Remove 100 Credit. New Balance: 886", user_id: user3.id, account_id: account.id, created_at: DateTime.parse('2017-05-19 18:15'), updated_at: DateTime.parse('2017-05-19 18:15')}).save
TradeEvent.new({content: "Note Changed To 'Lynchfield took 50 Brom on credit'", user_id: user3.id, account_id: account.id, created_at: DateTime.parse('2017-05-19 18:16'), updated_at: DateTime.parse('2017-05-19 18:16')}).save
TradeEvent.new({content: "Add 69 Credit. New Balance: 955", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-19 21:37'), updated_at: DateTime.parse('2017-05-19 21:37')}).save
TradeEvent.new({content: "Note Changed To 'VanguardMk1 23 MT's 69 Credit'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-19 21:37'), updated_at: DateTime.parse('2017-05-19 21:37')}).save
TradeEvent.new({content: "Remove 100 Credit. New Balance: 855", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-20 05:29'), updated_at: DateTime.parse('2017-05-20 05:29')}).save
TradeEvent.new({content: "Note Changed To 'prometheanfire 50 brom -100'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-20 05:29'), updated_at: DateTime.parse('2017-05-20 05:29')}).save
TradeEvent.new({content: "Add 10 Credit. New Balance: 865", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-21 00:22'), updated_at: DateTime.parse('2017-05-21 00:22')}).save
TradeEvent.new({content: "Note Changed To 'VanguardMk1 1 Meta Alloy, 10 credits'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-21 00:22'), updated_at: DateTime.parse('2017-05-21 00:22')}).save
TradeEvent.new({content: "Remove 70 Credit. New Balance: 795", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-22 04:03'), updated_at: DateTime.parse('2017-05-22 04:03')}).save
TradeEvent.new({content: "Note Changed To 'After Hours 35 Tea -70 Credits'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-22 04:04'), updated_at: DateTime.parse('2017-05-22 04:04')}).save
TradeEvent.new({content: "Add 143 Credit. New Balance: 938", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-24 20:36'), updated_at: DateTime.parse('2017-05-24 20:36')}).save
TradeEvent.new({content: "Note Changed To 'Horatius Alger 143 Cigars'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-24 20:36'), updated_at: DateTime.parse('2017-05-24 20:36')}).save
TradeEvent.new({content: "Add 78 Credit. New Balance: 1016", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-05-26 20:05'), updated_at: DateTime.parse('2017-05-26 20:05')}).save
TradeEvent.new({content: "Note Changed To 'VanguardMK1 16MTs, 5 Painite, 78 credit'", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-05-26 20:06'), updated_at: DateTime.parse('2017-05-26 20:06')}).save
TradeEvent.new({content: "Add 100 Credit. New Balance: 1116", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-27 07:01'), updated_at: DateTime.parse('2017-05-27 07:01')}).save
TradeEvent.new({content: "Note Changed To 'Loaded 200 Tea with us and split 50/50'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-27 07:01'), updated_at: DateTime.parse('2017-05-27 07:01')}).save
TradeEvent.new({content: "Remove 100 Margufle took 50 brom Credit. New Balance: 1016", user_id: user3.id, account_id: account.id, created_at: DateTime.parse('2017-05-27 22:42'), updated_at: DateTime.parse('2017-05-27 22:42')}).save
TradeEvent.new({content: "Note Changed To 'margufle took 50 brom'", user_id: user3.id, account_id: account.id, created_at: DateTime.parse('2017-05-27 22:42'), updated_at: DateTime.parse('2017-05-27 22:42')}).save
TradeEvent.new({content: "Add 80 Credit. New Balance: 1096", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-06-06 20:56'), updated_at: DateTime.parse('2017-06-06 20:56')}).save
TradeEvent.new({content: "Note Changed To 'Margufle deposited 20 MTs'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-06-06 20:57'), updated_at: DateTime.parse('2017-06-06 20:57')}).save
TradeEvent.new({content: "Add 820 Credit. New Balance: 1916", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-06-11 05:22'), updated_at: DateTime.parse('2017-06-11 05:22')}).save
TradeEvent.new({content: "Note Changed To 'SpInFuZoR deposited 41 MA's'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-06-11 05:23'), updated_at: DateTime.parse('2017-06-11 05:23')}).save
TradeEvent.new({content: "Add 462 Credit. New Balance: 2378", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-06-16 21:10'), updated_at: DateTime.parse('2017-06-16 21:10')}).save
TradeEvent.new({content: "Note Changed To 'VanguardMk1 deposited 154 Modular Terminals'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-06-16 21:11'), updated_at: DateTime.parse('2017-06-16 21:11')}).save
TradeEvent.new({content: "Note Changed To 'Horatius Alger deosited 16 Ale and 10 Tea'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-06-18 00:26'), updated_at: DateTime.parse('2017-06-18 00:26')}).save
TradeEvent.new({content: "Add 26 Credit. New Balance: 2404", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-06-18 00:27'), updated_at: DateTime.parse('2017-06-18 00:27')}).save
TradeEvent.new({content: "Add 10 Credit. New Balance: 2414", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-06-18 01:29'), updated_at: DateTime.parse('2017-06-18 01:29')}).save
TradeEvent.new({content: "Note Changed To 'prometheanfire deposited 10 Tea'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-06-18 01:29'), updated_at: DateTime.parse('2017-06-18 01:29')}).save
TradeEvent.new({content: "Add 25 Credit. New Balance: 2439", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-06-21 23:03'), updated_at: DateTime.parse('2017-06-21 23:03')}).save
TradeEvent.new({content: "Note Changed To 'Horatius Alger helped load Tea'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-06-21 23:04'), updated_at: DateTime.parse('2017-06-21 23:04')}).save
TradeEvent.new({content: "Remove 100 Credit. New Balance: 2339", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-06-23 05:22'), updated_at: DateTime.parse('2017-06-23 05:22')}).save
TradeEvent.new({content: "Note Changed To 'CMDR sudoshakes withdrew 10 Painite / 100 Credits'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-06-23 05:23'), updated_at: DateTime.parse('2017-06-23 05:23')}).save
TradeEvent.new({content: "Remove 100 Credit. New Balance: 2239", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-06-29 05:37'), updated_at: DateTime.parse('2017-06-29 05:37')}).save
TradeEvent.new({content: "Note Changed To 'Moist Accident took 10 Painite/100 credits'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-06-29 05:38'), updated_at: DateTime.parse('2017-06-29 05:38')}).save
TradeEvent.new({content: "Add 60 Credit. New Balance: 2299", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-06-30 12:39'), updated_at: DateTime.parse('2017-06-30 12:39')}).save
TradeEvent.new({content: "Note Changed To 'VanguardMK1 deposited 20 Modular Terminals / 60 credit'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-06-30 12:39'), updated_at: DateTime.parse('2017-06-30 12:39')}).save
TradeEvent.new({content: "Add 216 Credit. New Balance: 2515", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-07-05 10:44'), updated_at: DateTime.parse('2017-07-05 10:44')}).save
TradeEvent.new({content: "Note Changed To 'Vanguard dropped 72MTs'", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-07-05 10:45'), updated_at: DateTime.parse('2017-07-05 10:45')}).save
TradeEvent.new({content: "Add 6 Credit. New Balance: 2521", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-07-18 20:17'), updated_at: DateTime.parse('2017-07-18 20:17')}).save
TradeEvent.new({content: "Note Changed To 'Snarf donated 2 MTs.'", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-07-18 20:18'), updated_at: DateTime.parse('2017-07-18 20:18')}).save
TradeEvent.new({content: "Remove 100 Credit. New Balance: 2421", user_id: user3.id, account_id: account.id, created_at: DateTime.parse('2017-07-20 01:23'), updated_at: DateTime.parse('2017-07-20 01:23')}).save
TradeEvent.new({content: "Note Changed To ' Horatius Alger bought 10 painite on credit.'", user_id: user3.id, account_id: account.id, created_at: DateTime.parse('2017-07-20 01:24'), updated_at: DateTime.parse('2017-07-20 01:24')}).save
TradeEvent.new({content: "Add 50 Credit. New Balance: 2471", user_id: user3.id, account_id: account.id, created_at: DateTime.parse('2017-07-20 18:31'), updated_at: DateTime.parse('2017-07-20 18:31')}).save
TradeEvent.new({content: "Note Changed To 'Horatius Alger dropped off 50 Brandy.'", user_id: user3.id, account_id: account.id, created_at: DateTime.parse('2017-07-20 18:31'), updated_at: DateTime.parse('2017-07-20 18:31')}).save
TradeEvent.new({content: "Remove 100 Credit. New Balance: 2371", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-07-22 21:01'), updated_at: DateTime.parse('2017-07-22 21:01')}).save
TradeEvent.new({content: "Note Changed To 'Horatius Alger took 50 Bromellite'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-07-22 21:01'), updated_at: DateTime.parse('2017-07-22 21:01')}).save
TradeEvent.new({content: "Add 36 Credit. New Balance: 2407", user_id: user3.id, account_id: account.id, created_at: DateTime.parse('2017-07-27 17:55'), updated_at: DateTime.parse('2017-07-27 17:55')}).save
TradeEvent.new({content: "Note Changed To 'Vanguard dropped off 12 MTs'", user_id: user3.id, account_id: account.id, created_at: DateTime.parse('2017-07-27 17:56'), updated_at: DateTime.parse('2017-07-27 17:56')}).save
TradeEvent.new({content: "Remove 100 Credit. New Balance: 2307", user_id: user3.id, account_id: account.id, created_at: DateTime.parse('2017-07-29 16:23'), updated_at: DateTime.parse('2017-07-29 16:23')}).save
TradeEvent.new({content: "Note Changed To 'Moist Accident bought 50 Brom on credit'", user_id: user3.id, account_id: account.id, created_at: DateTime.parse('2017-07-29 16:24'), updated_at: DateTime.parse('2017-07-29 16:24')}).save
TradeEvent.new({content: "Note Changed To 'Moist Accident took 50 Brom on credit.'", user_id: user3.id, account_id: account.id, created_at: DateTime.parse('2017-07-29 17:09'), updated_at: DateTime.parse('2017-07-29 17:09')}).save
TradeEvent.new({content: "Remove 100 Credit. New Balance: 2207", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-01 22:29'), updated_at: DateTime.parse('2017-08-01 22:29')}).save
TradeEvent.new({content: "Note Changed To 'Minerslikejs took 10 Painite'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-01 22:29'), updated_at: DateTime.parse('2017-08-01 22:29')}).save
TradeEvent.new({content: "Remove 100 Credit. New Balance: 2107", user_id: user3.id, account_id: account.id, created_at: DateTime.parse('2017-08-02 23:30'), updated_at: DateTime.parse('2017-08-02 23:30')}).save
TradeEvent.new({content: "Note Changed To 'Snarf took 50 Brom'", user_id: user3.id, account_id: account.id, created_at: DateTime.parse('2017-08-02 23:31'), updated_at: DateTime.parse('2017-08-02 23:31')}).save
TradeEvent.new({content: "Add 144 Credit. New Balance: 2251", user_id: user3.id, account_id: account.id, created_at: DateTime.parse('2017-08-03 04:01'), updated_at: DateTime.parse('2017-08-03 04:01')}).save
TradeEvent.new({content: "Note Changed To 'Luna dropped 18 Tea and 36 MTs'", user_id: user3.id, account_id: account.id, created_at: DateTime.parse('2017-08-03 04:02'), updated_at: DateTime.parse('2017-08-03 04:02')}).save
TradeEvent.new({content: "Add 50 Credit. New Balance: 2301", user_id: user3.id, account_id: account.id, created_at: DateTime.parse('2017-08-05 17:17'), updated_at: DateTime.parse('2017-08-05 17:17')}).save
TradeEvent.new({content: "Note Changed To 'Lenz 219 dropped 50 Brom.'", user_id: user3.id, account_id: account.id, created_at: DateTime.parse('2017-08-05 17:18'), updated_at: DateTime.parse('2017-08-05 17:18')}).save
TradeEvent.new({content: "Add 12 Credit. New Balance: 2313", user_id: user3.id, account_id: account.id, created_at: DateTime.parse('2017-08-05 18:03'), updated_at: DateTime.parse('2017-08-05 18:03')}).save
TradeEvent.new({content: "Note Changed To 'Vanguard dropped 4 MTs'", user_id: user3.id, account_id: account.id, created_at: DateTime.parse('2017-08-05 18:04'), updated_at: DateTime.parse('2017-08-05 18:04')}).save
TradeEvent.new({content: "Remove 200 Credit. New Balance: 2113", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-07 06:08'), updated_at: DateTime.parse('2017-08-07 06:08')}).save
TradeEvent.new({content: "Note Changed To 'Jay Donks took 100 Brandy'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-07 06:09'), updated_at: DateTime.parse('2017-08-07 06:09')}).save
TradeEvent.new({content: "Remove 90 Credit. New Balance: 2023", user_id: user3.id, account_id: account.id, created_at: DateTime.parse('2017-08-08 07:13'), updated_at: DateTime.parse('2017-08-08 07:13')}).save
TradeEvent.new({content: "Note Changed To 'Luna took 45 Tea'", user_id: user3.id, account_id: account.id, created_at: DateTime.parse('2017-08-08 07:13'), updated_at: DateTime.parse('2017-08-08 07:13')}).save
TradeEvent.new({content: "Add 84 Credit. New Balance: 2107", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-19 21:05'), updated_at: DateTime.parse('2017-08-19 21:05')}).save
TradeEvent.new({content: "Note Changed To 'VanguardMk1 deposited 28 MTs'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-19 21:05'), updated_at: DateTime.parse('2017-08-19 21:05')}).save


account = Account.new({name: 'Van Beek', discord_name: 'Sander', account_type: 0, credits: 96, created_at: DateTime.parse('2017-05-11 09:50'), updated_at: DateTime.parse('2017-05-11 09:50')})
account.save
user = User.find_by_username('Icarus Smith')
TradeEvent.new({content: "Inserted Credit Account @ 96 Credit", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-11 09:50'), updated_at: DateTime.parse('2017-05-11 09:50')}).save
TradeEvent.new({content: "Note Changed To 'aka Sander'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-11 09:50'), updated_at: DateTime.parse('2017-05-11 09:50')}).save


account = Account.new({name: 'RadioSidewinder', account_type: 1, credits: 0, created_at: DateTime.parse('2017-05-15 21:07'), updated_at: DateTime.parse('2017-05-15 21:07')})
account.save
user = User.find_by_username('Icarus Smith')
user2 = User.find_by_username('Faykan')
TradeEvent.new({content: "Inserted Credit Account @ 140 Credit", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-05-15 21:07'), updated_at: DateTime.parse('2017-05-15 21:07')}).save
TradeEvent.new({content: "Note Changed To 'Jonuss donated 28 painite.'", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-05-15 21:08'), updated_at: DateTime.parse('2017-05-15 21:08')}).save
TradeEvent.new({content: "Remove 100 Credit. New Balance: 40", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-05-16 21:49'), updated_at: DateTime.parse('2017-05-16 21:49')}).save
TradeEvent.new({content: "Note Changed To 'StationToStation took out 50 cigars.'", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-05-16 21:50'), updated_at: DateTime.parse('2017-05-16 21:50')}).save
TradeEvent.new({content: "Add 50 Credit. New Balance: 90", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-05-17 21:07'), updated_at: DateTime.parse('2017-05-17 21:07')}).save
TradeEvent.new({content: "Note Changed To 'StationToStation donated 50 cigars.'", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-05-17 21:09'), updated_at: DateTime.parse('2017-05-17 21:09')}).save
TradeEvent.new({content: "Remove 90 Credit. New Balance: 0", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-22 12:56'), updated_at: DateTime.parse('2017-05-22 12:56')}).save
TradeEvent.new({content: "Note Changed To 'scoops used 90 credits'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-22 12:56'), updated_at: DateTime.parse('2017-05-22 12:56')}).save
TradeEvent.new({content: "Note Changed To 'Owe 100 Palladium'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-28 21:40'), updated_at: DateTime.parse('2017-05-28 21:40')}).save
TradeEvent.new({content: "Add 195 Credit. New Balance: 195", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-08-10 18:22'), updated_at: DateTime.parse('2017-08-10 18:22')}).save
TradeEvent.new({content: "Note Changed To 'Jonuss donated 39 painite'", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-08-10 18:23'), updated_at: DateTime.parse('2017-08-10 18:23')}).save
TradeEvent.new({content: "Remove 125 Credit. New Balance: 70", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-08-10 19:24'), updated_at: DateTime.parse('2017-08-10 19:24')}).save
TradeEvent.new({content: "Note Changed To 'Jonuss took 25MTs.'", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-08-10 19:25'), updated_at: DateTime.parse('2017-08-10 19:25')}).save
TradeEvent.new({content: "Remove 70 Credit. New Balance: 0", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-11 20:50'), updated_at: DateTime.parse('2017-08-11 20:50')}).save


account = Account.new({name: 'Diamond Frogs', account_type: 1, credits: 10, created_at: DateTime.parse('2017-05-18 02:55'), updated_at: DateTime.parse('2017-05-18 02:55')})
account.save
user = User.find_by_username('Icarus Smith')
TradeEvent.new({content: "Inserted Credit Account @ 10 Credit", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-18 02:55'), updated_at: DateTime.parse('2017-05-18 02:55')}).save
TradeEvent.new({content: "Note Changed To 'Group Account Created'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-18 02:56'), updated_at: DateTime.parse('2017-05-18 02:56')}).save


account = Account.new({name: 'Andoulline', account_type: 0, credits: 10, created_at: DateTime.parse('2017-05-21 09:23'), updated_at: DateTime.parse('2017-05-21 09:23')})
account.save
user = User.find_by_username('Icarus Smith')
TradeEvent.new({content: "Inserted Credit Account @ 200 Credit", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-21 09:23'), updated_at: DateTime.parse('2017-05-21 09:23')}).save
TradeEvent.new({content: "Note Changed To 'deposited 30 Painite took 50 Cigars'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-05-21 09:24'), updated_at: DateTime.parse('2017-05-21 09:24')}).save


account = Account.new({name: 'Tall Cool One', account_type: 0, credits: 96, created_at: DateTime.parse('2017-06-25 21:32'), updated_at: DateTime.parse('2017-06-25 21:32')})
account.save
user = User.find_by_username('Icarus Smith')
TradeEvent.new({content: "Inserted Credit Account @ 96 Credit", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-06-25 21:32'), updated_at: DateTime.parse('2017-06-25 21:32')}).save
TradeEvent.new({content: "Note Changed To 'Deposited 32 Modular Terminals, 96 credit'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-06-25 21:33'), updated_at: DateTime.parse('2017-06-25 21:33')}).save


account = Account.new({name: 'DuztDruid', account_type: 0, credits: 0, created_at: DateTime.parse('2017-06-26 21:15'), updated_at: DateTime.parse('2017-06-26 21:15')})
account.save
user = User.find_by_username('Icarus Smith')
TradeEvent.new({content: "Inserted Credit Account @ 60 Credit", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-06-26 21:15'), updated_at: DateTime.parse('2017-06-26 21:15')}).save
TradeEvent.new({content: "Note Changed To '60 Palladium from partial Trade, bad networking'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-06-26 21:17'), updated_at: DateTime.parse('2017-06-26 21:17')}).save
TradeEvent.new({content: "Remove 60 Credit. New Balance: 0", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-06-27 09:55'), updated_at: DateTime.parse('2017-06-27 09:55')}).save
TradeEvent.new({content: "Note Changed To 'WizardZombie dropped 50 Tea on him'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-06-27 09:56'), updated_at: DateTime.parse('2017-06-27 09:56')}).save


account = Account.new({name: 'Drieton', account_type: 0, credits: 168, created_at: DateTime.parse('2017-07-03 22:09'), updated_at: DateTime.parse('2017-07-03 22:09')})
account.save
user = User.find_by_username('Icarus Smith')
TradeEvent.new({content: "Inserted Credit Account @ 12 Credit", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-07-03 22:09'), updated_at: DateTime.parse('2017-07-03 22:09')}).save
TradeEvent.new({content: "Note Changed To 'Dropped 4 Modular Terminals'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-07-03 22:09'), updated_at: DateTime.parse('2017-07-03 22:09')}).save
TradeEvent.new({content: "Add 24 Credit. New Balance: 36", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-07-04 04:53'), updated_at: DateTime.parse('2017-07-04 04:53')}).save
TradeEvent.new({content: "Note Changed To 'Deposited 8 Modular Terminals'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-07-04 04:53'), updated_at: DateTime.parse('2017-07-04 04:53')}).save
TradeEvent.new({content: "Add 24 Credit. New Balance: 60", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-07-09 06:59'), updated_at: DateTime.parse('2017-07-09 06:59')}).save
TradeEvent.new({content: "Note Changed To 'Dropped 12 Brandy and 4 MT's'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-07-09 06:59'), updated_at: DateTime.parse('2017-07-09 06:59')}).save
TradeEvent.new({content: "Add 108 Credit. New Balance: 168", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-07-18 06:02'), updated_at: DateTime.parse('2017-07-18 06:02')}).save
TradeEvent.new({content: "Note Changed To '96 tons and 4 MT's'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-07-18 06:03'), updated_at: DateTime.parse('2017-07-18 06:03')}).save


account = Account.new({name: 'Thomas Elazar', account_type: 0, credits: 63, created_at: DateTime.parse('2017-07-18 00:37'), updated_at: DateTime.parse('2017-07-18 00:37')})
account.save
user = User.find_by_username('Icarus Smith')
TradeEvent.new({content: "Inserted Credit Account @ 63 Credit", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-07-18 00:37'), updated_at: DateTime.parse('2017-07-18 00:37')}).save
TradeEvent.new({content: "Note Changed To 'Loaded 63 tons'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-07-18 00:38'), updated_at: DateTime.parse('2017-07-18 00:38')}).save


account = Account.new({name: 'Iridium Wing', account_type: 1, credits: 111, created_at: DateTime.parse('2017-07-19 19:43'), updated_at: DateTime.parse('2017-07-19 19:43')})
account.save
user = User.find_by_username('Icarus Smith')
user2 = User.find_by_username('Prax Bloodwaters')
TradeEvent.new({content: "Inserted Credit Account @ 1 Credit", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-07-19 19:43'), updated_at: DateTime.parse('2017-07-19 19:43')}).save
TradeEvent.new({content: "Add 22 Credit. New Balance: 23", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-07-19 20:33'), updated_at: DateTime.parse('2017-07-19 20:33')}).save
TradeEvent.new({content: "Note Changed To ' Theunkn0wn1 dropped extra painite and palladium while purchasing brom.'", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-07-19 20:35'), updated_at: DateTime.parse('2017-07-19 20:35')}).save
TradeEvent.new({content: "Note Changed To 'theunkn0wn1 dropped 16 MTs'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-07-21 05:45'), updated_at: DateTime.parse('2017-07-21 05:45')}).save
TradeEvent.new({content: "Add 48 Credit. New Balance: 71", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-07-21 05:49'), updated_at: DateTime.parse('2017-07-21 05:49')}).save
TradeEvent.new({content: "Add 12 Credit. New Balance: 83", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-07-24 00:05'), updated_at: DateTime.parse('2017-07-24 00:05')}).save
TradeEvent.new({content: "Note Changed To 'theunkn0wn1 dropped 4 MTs'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-07-24 00:06'), updated_at: DateTime.parse('2017-07-24 00:06')}).save
TradeEvent.new({content: "Add 28 Credit. New Balance: 111", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-07-24 20:25'), updated_at: DateTime.parse('2017-07-24 20:25')}).save
TradeEvent.new({content: "Note Changed To 'unkn0wn1 deposited 8 MTS and 4 Bromellite'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-07-24 20:25'), updated_at: DateTime.parse('2017-07-24 20:25')}).save


account = Account.new({name: 'Devantejah', account_type: 0, credits: 436, created_at: DateTime.parse('2017-07-20 16:44'), updated_at: DateTime.parse('2017-07-20 16:44')})
account.save
user = User.find_by_username('Icarus Smith')
user2 = User.find_by_username('Faykan')
user3 = User.find_by_username('Prax Bloodwaters')
TradeEvent.new({content: "Inserted Credit Account @ 24 Credit", user_id: user3.id, account_id: account.id, created_at: DateTime.parse('2017-07-20 16:44'), updated_at: DateTime.parse('2017-07-20 16:44')}).save
TradeEvent.new({content: "Add 84 Credit. New Balance: 108", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-07-30 20:12'), updated_at: DateTime.parse('2017-07-30 20:12')}).save
TradeEvent.new({content: "Note Changed To 'Dropped 28 MT's'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-07-30 20:13'), updated_at: DateTime.parse('2017-07-30 20:13')}).save
TradeEvent.new({content: "Note Changed To 'Deposited 68 MT and 4 Brom'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-04 09:12'), updated_at: DateTime.parse('2017-08-04 09:12')}).save
TradeEvent.new({content: "Add 208 Credit. New Balance: 316", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-04 09:13'), updated_at: DateTime.parse('2017-08-04 09:13')}).save
TradeEvent.new({content: "Add 120 Credit. New Balance: 436", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-08-08 15:52'), updated_at: DateTime.parse('2017-08-08 15:52')}).save
TradeEvent.new({content: "Note Changed To 'Donated 40 terminals'", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-08-08 15:52'), updated_at: DateTime.parse('2017-08-08 15:52')}).save


account = Account.new({name: 'Kyzrath', account_type: 0, credits: 0, created_at: DateTime.parse('2017-07-29 03:00'), updated_at: DateTime.parse('2017-07-29 03:00')})
account.save
user = User.find_by_username('Icarus Smith')
user2 = User.find_by_username('Prax Bloodwaters')
TradeEvent.new({content: "Inserted Credit Account @ 258 Credit", user_id: user2.id, account_id: account.id, created_at: DateTime.parse('2017-07-29 03:00'), updated_at: DateTime.parse('2017-07-29 03:00')}).save
TradeEvent.new({content: "Remove 180 Credit. New Balance: 78", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-08 11:19'), updated_at: DateTime.parse('2017-08-08 11:19')}).save
TradeEvent.new({content: "Note Changed To 'Took 40 Tea and 10 Painite (180 value)'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-08 11:21'), updated_at: DateTime.parse('2017-08-08 11:21')}).save
TradeEvent.new({content: "Remove 78 Credit. New Balance: 0", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-12 23:23'), updated_at: DateTime.parse('2017-08-12 23:23')}).save
TradeEvent.new({content: "Note Changed To 'Took 25 MT and paid 47 Palladium balance'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-12 23:24'), updated_at: DateTime.parse('2017-08-12 23:24')}).save


account = Account.new({name: 'Xabies', account_type: 0, credits: 0, created_at: DateTime.parse('2017-07-30 21:59'), updated_at: DateTime.parse('2017-07-30 21:59')})
account.save
user = User.find_by_username('Icarus Smith')
TradeEvent.new({content: "Inserted Credit Account @ 40 Credit", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-07-30 21:59'), updated_at: DateTime.parse('2017-07-30 21:59')}).save
TradeEvent.new({content: "Note Changed To 'Deposited 40 Cigars'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-07-30 22:00'), updated_at: DateTime.parse('2017-07-30 22:00')}).save
TradeEvent.new({content: "Remove 40 Credit. New Balance: 0", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-04 04:21'), updated_at: DateTime.parse('2017-08-04 04:21')}).save
TradeEvent.new({content: "Note Changed To 'Took 30 Tea and paid 20 Palladium'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-04 04:22'), updated_at: DateTime.parse('2017-08-04 04:22')}).save


account = Account.new({name: 'gretehelios', account_type: 0, credits: 96, created_at: DateTime.parse('2017-08-02 11:35'), updated_at: DateTime.parse('2017-08-02 11:35')})
account.save
user = User.find_by_username('Icarus Smith')
TradeEvent.new({content: "Inserted Credit Account @ 75 Credit", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-02 11:35'), updated_at: DateTime.parse('2017-08-02 11:35')}).save
TradeEvent.new({content: "Note Changed To 'Dropped 75 Bromellite'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-02 11:35'), updated_at: DateTime.parse('2017-08-02 11:35')}).save
TradeEvent.new({content: "Add 120 Credit. New Balance: 195", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-02 11:36'), updated_at: DateTime.parse('2017-08-02 11:36')}).save
TradeEvent.new({content: "Note Changed To 'Dropped 40 MT's'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-02 11:37'), updated_at: DateTime.parse('2017-08-02 11:37')}).save
TradeEvent.new({content: "Icarus Smith: Add 12 Credit. New Balance: 207", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-02 11:38'), updated_at: DateTime.parse('2017-08-02 11:38')}).save
TradeEvent.new({content: "Note Changed To 'dropped 4 MT's'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-02 11:39'), updated_at: DateTime.parse('2017-08-02 11:39')}).save
TradeEvent.new({content: "Icarus Smith: Remove 207 Credit. New Balance: 0", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-02 11:40'), updated_at: DateTime.parse('2017-08-02 11:40')}).save


account = Account.new({name: 'oohshiny', account_type: 0, credits: 30, created_at: DateTime.parse('2017-08-03 03:39'), updated_at: DateTime.parse('2017-08-03 03:39')})
account.save
user = User.find_by_username('Prax Bloodwaters')
TradeEvent.new({content: "Inserted Credit Account @ 30 Credit", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-03 03:39'), updated_at: DateTime.parse('2017-08-03 03:39')}).save


account = Account.new({name: 'Whoeva', account_type: 0, credits: 117, created_at: DateTime.parse('2017-08-05 18:28'), updated_at: DateTime.parse('2017-08-05 18:28')})
account.save
user = User.find_by_username('Prax Bloodwaters')
TradeEvent.new({content: "Inserted Credit Account @ 117 Credit", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-05 18:28'), updated_at: DateTime.parse('2017-08-05 18:28')}).save
TradeEvent.new({content: "Note Changed To 'dropped 39 MTs'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-05 18:29'), updated_at: DateTime.parse('2017-08-05 18:29')}).save


account = Account.new({name: 'L.Austenfeld', account_type: 0, credits: 240, created_at: DateTime.parse('2017-08-06 10:41'), updated_at: DateTime.parse('2017-08-06 10:41')})
account.save
user = User.find_by_username('Icarus Smith')
TradeEvent.new({content: "Inserted Credit Account @ 120 Credit", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-06 10:41'), updated_at: DateTime.parse('2017-08-06 10:41')}).save
TradeEvent.new({content: "Note Changed To 'Deposited 40 MTs'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-06 10:42'), updated_at: DateTime.parse('2017-08-06 10:42')}).save
TradeEvent.new({content: "Add 120 Credit. New Balance: 240", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-07 06:23'), updated_at: DateTime.parse('2017-08-07 06:23')}).save
TradeEvent.new({content: "Note Changed To 'Deposited 40 MTs'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-07 06:24'), updated_at: DateTime.parse('2017-08-07 06:24')}).save


account = Account.new({name: 'Jannifer Irons', account_type: 0, credits: 0, created_at: DateTime.parse('2017-08-10 11:11'), updated_at: DateTime.parse('2017-08-10 11:11')})
account.save
user = User.find_by_username('Icarus Smith')
TradeEvent.new({content: "Inserted Credit Account @ 48 Credit", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-10 11:11'), updated_at: DateTime.parse('2017-08-10 11:11')}).save
TradeEvent.new({content: "Remove 48 Credit. New Balance: 0", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-10 11:12'), updated_at: DateTime.parse('2017-08-10 11:12')}).save



account = Account.new({name: 'Shields of Justice', account_type: 1, credits: 1, created_at: DateTime.parse('2017-08-16 00:10'), updated_at: DateTime.parse('2017-08-16 00:10')})
account.save
user = User.find_by_username('Icarus Smith')
TradeEvent.new({content: "Inserted Credit Account @ 1 Credit", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-16 00:10'), updated_at: DateTime.parse('2017-08-16 00:10')}).save
TradeEvent.new({content: "Note Changed To 'CMDR Relick (leader) opened group account'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-16 00:11'), updated_at: DateTime.parse('2017-08-16 00:11')}).save


account = Account.new({name: 'Shields of Justice', account_type: 0, credits: 1, created_at: DateTime.parse('2017-08-16 14:11'), updated_at: DateTime.parse('2017-08-16 14:11')})
account.save
user = User.find_by_username('Icarus Smith')
TradeEvent.new({content: "Inserted Credit Account @ 1 Credit", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-16 14:11'), updated_at: DateTime.parse('2017-08-16 14:11')}).save
TradeEvent.new({content: "Note Changed To 'Candy Crew Guild, account opened by Laslu'", user_id: user.id, account_id: account.id, created_at: DateTime.parse('2017-08-16 14:12'), updated_at: DateTime.parse('2017-08-16 14:12')}).save
