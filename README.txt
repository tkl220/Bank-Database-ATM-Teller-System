If the tables or database is empty:
use the .sql files in the sqlfiles directory called drop, create, and populate. 
Run them in that order and then commit to insure data and tables are properly set up.



SECTIONS:
1. ER diagram and relation schema changes
2. General info about how the interface is supposed to feel
3. Special considerations, i.e. things that were done that weren't neccessary
4. Future work - tasks that need to be done, or were left uncomplete
5. Guide to using the interface
6. example users and information to choose from for the guide






1. Changes were made to ER digram to accomidate more efficient transactions:
A transaction realtion(weak entity) was added which has a many to one relationship with the customers.
It consists of c_address, which is a foreign key to the primary key "address" of the customers relation. 
trans_address - is used to discribe the location that the customer made a transaction with. 
type - is the type of transaction i.e. wirthdraw or deposit
id - is used to give addiontal information making triggered updates on a customer's balances easier, such as specifying savings or checking account with the integers 1 or 2
amount - the dollar amount asssociated with any transaction
time_of - the time of the transaction

2. General information -

The information given and prompts for input are set up with the intention of making it easier to grade and navigate, rather than a realistic expirence for example of going to an ATM where it does not always tell you your balance information unless you specifically request it.

There is a choice of two interfaces after logging in:

The customer interface is set up to feel like a simulation of a person's possible choices in realtion to their bank accounts. They can go to a bank to withdraw or deposit, or they can go to a store to use their credit or debit card. Like a extremely simple life simulator. It is not set up like an online banking interface where you log in and have these options all available.

The bank management interface is not set up.


3. Special considerations - 
There is a trigger called any_transaction that whenever a new transaction is inserted, it automatically adjusts the the other revelant relations. Such as on a withdraw transaction, the balance of the appropirate account or card will be updated. This also enforces the penalty from going under minimum balance.

Future work - 
The customer needs to be able to open up to loans and make payments on them.
The customer needs to be able to make payments on their credit card balance.
Implement a system for bank administrators.


4. Guide to using the interface:

Use customer and account info from section 6!
Exit any menu by typing return!

The first prompt for userid and password are for logging onto the database.
Next select wether you want the customer expirence or bank managment one, by inputting either 1 or 2 respectively (or 3 the quit the program).

Now 3 options will appear, banks, stores, or return. Choose banks if you want the transactions associated with banks, i.e. withdraw and deposit. Choose stores if you want the transactions associated with buying things, i.e. debit and credit card purchases.

BANKS -
If you selected Banks a list of banks will appear prompting you to choose one by entering the corresponding number.

If you choose a bank with an atm and a teller you can chose to withdraw or deposit or replace your card. 
(replacing a card is simple, just input account id when prompted and a new card number will be issued)
a) After choosing you will be asked for your account id(sample ones can be found in section 6). b) Then if there are multiple owners of that account you will be asked to identify which one you are by name. 
c) After that you will choose which account you want to withdraw or deposit from(checking or savings) and will be shown the current information pretaining the the choosen account. 
d) Finally you will be prompted to enter an amount to withdraw or deposit, if this amount is invalid for example is negative or would bring checking below 0 then you will be notified, and have a chance to re-enter an amount. 
e) After the transaction is complete you will shown your updated balance.

If you chose a bank with only a atm then you will automatically be taken to the withdraw interface for debit card holders.
a) you can only use debit cards to withdraw from an atm, so you will be immediatly promted for your debit card number (usable examples found in section 6).
b) Then if there are multiple owners of that card you will be asked to identify which one you are by name (sign your name kind of thing).
c) Finally you will be prompted to enter an amount to withdraw, if this amount is invalid for example is negative or would bring checking below 0 then you will be notified, and have a chance to re-enter an amount. 
e) After the transaction is complete you will shown your updated balance.


STORES -
If you selected stores a list of stores with the thing they sell and its price will appear prompting you to choose one by entering the corresponding number.

after selecting a store you will be prompted to choose debit or credit.
You will then be shown balance information associated with the chosen card.
Then you will be prompted to enter the respective card number.
If there are multiple owners of the card you will be asked to identify which one you are by name. 
If the purchase would excceed you credit limit or put your checking account below 0 then you will be notified of that and then immediatly returned to the stores menu.
If you can afford the purchase you will be shown your updated balance information.

6. 5 cutomers in the data base and their information: 
customer 1:
	name: JoJo Star
	account id: 12341234
	debit card number: 29571952
	checking account balance: 1374.53
	savings account balance, mininmum balance, and penalty: 8934.53, 300, 200
	
customer 2:
	name: Baron Zeppilli
	account id: 12341234
	debit card number: 29571952
	checking account balance: 1374.53
	savings account balance, mininmum balance, and penalty: 8934.53, 300, 200

customer 3:
	name: Dandy Dude
	account id: 12345123
	credit card number, limit, running balance: 76575567, 2000, 140
	checking account balance: 930.76
	savings account balance, mininmum balance, and penalty: 630.64, 200, 150
customer 4:
	name: Barby
	account id: 12345321
	debit card number: 15820624
	credit card number, limit, running balance: 96921024, 4000, 435
	checking account balance: 1285.29
	savings account balance, mininmum balance, and penalty: 3090.27, 800, 350
customer 5:
	name: Hol Horse
	account id: 12333321
	debit card number: 56781901
	credit card number, limit, running balance: 46028681, 7000, 392
	checking account balance: 497.26
	savings account balance, mininmum balance, and penalty: 2308.26, 500, 300

More info about above cutomer's:

customers 1 & 2 share an account with a 3rd person aswell: Robert E.O. Speedwagon
customer 4 shares an account with another person: Ceeeasaaarrr Zeppilli
customer 5 shares an account with another person: Lisa Lisa

