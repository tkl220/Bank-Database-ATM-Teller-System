insert all
into account (acc_ID, interest_rate, transaction_types) values (12341234, 1.02, 'withdrawal,deposit,transfer,debit,loan')
into account (acc_ID, interest_rate, transaction_types) values (12345123, 1.36, 'withdrawal,deposit,transfer,credit,loan')
into account (acc_ID, interest_rate, transaction_types) values (12345612, 0.79, 'withdrawal,deposit,transfer,debit,loan')
into account (acc_ID, interest_rate, transaction_types) values (12345671, 3.02, 'withdrawal,deposit,transfer,debit,credit')
into account (acc_ID, interest_rate, transaction_types) values (12312345, 2.09, 'withdrawal,deposit,transfer,loan')

into account (acc_ID, interest_rate, transaction_types) values (12123456, 0.73, 'withdrawal,deposit,transfer,loan')
into account (acc_ID, interest_rate, transaction_types) values (11234567, 1.98, 'withdrawal,deposit,transfer,debit,credit')
into account (acc_ID, interest_rate, transaction_types) values (12344321, 0.82, 'withdrawal,deposit,transfer,debit,credit')
into account (acc_ID, interest_rate, transaction_types) values (12345321, 1.44, 'withdrawal,deposit,transfer,debit,credit,loan')
into account (acc_ID, interest_rate, transaction_types) values (12345621, 1.29, 'withdrawal,deposit,transfer')

into account (acc_ID, interest_rate, transaction_types) values (12354321, 2.91, 'withdrawal,deposit,transfer,debit,credit')
into account (acc_ID, interest_rate, transaction_types) values (12654321, 3.44, 'withdrawal,deposit,transfer,credit')
into account (acc_ID, interest_rate, transaction_types) values (12355321, 0.77, 'withdrawal,deposit,transfer,debit,credit,loan')
into account (acc_ID, interest_rate, transaction_types) values (12333321, 1.22, 'withdrawal,deposit,transfer,debit,credit,loan')
into account (acc_ID, interest_rate, transaction_types) values (87634521, 0.18, 'withdrawal,deposit,transfer,debit,loan')
select 1 from dual;


insert all
into customer(address, name, acc_ID) values ('123 Packer avenue, Bethlehem, PA 18015', 'JoJo Star', 12341234)
into customer(address, name, acc_ID) values ('234 Birkel avenue, Bethlehem, PA 18015', 'Dandy Dude', 12345123)
into customer(address, name, acc_ID) values ('464 Packer avenue, Bethlehem, PA 18015', 'Cool Fella', 12345612)
into customer(address, name, acc_ID) values ('375 Carlton avenue, Bethlehem, PA 18015', 'Dio Brando', 12345671)
into customer(address, name, acc_ID) values ('987 Birkel avenue, Bethlehem, PA 18015', 'Abdul Muhammed', 12312345)

into customer(address, name, acc_ID) values ('834 Packer avenue, Bethlehem, PA 18015', 'Jean-pierre Polnareff', 12123456)
into customer(address, name, acc_ID) values ('324 Birkel avenue, Bethlehem, PA 18015', 'Dddddarby Jr.', 11234567)
into customer(address, name, acc_ID) values ('616 Carlton avenue, Bethlehem, PA 18015', 'Ddddarby Sr.', 12344321)
into customer(address, name, acc_ID) values ('365 4th street, Bethlehem, PA 18015', 'Barby', 12345321)
into customer(address, name, acc_ID) values ('122 Packer avenue, Bethlehem, PA 18015', 'Smokey', 12345621)

into customer(address, name, acc_ID) values ('111 East 5th street, Bethlehem, PA 18015', 'Wamu', 12354321)
into customer(address, name, acc_ID) values ('402 4th street, Bethlehem, PA 18015', 'Esi Di Si', 12654321)
into customer(address, name, acc_ID) values ('406 Packer avenue, Bethlehem, PA 18015', 'Kars', 12355321)
into customer(address, name, acc_ID) values ('604 Birkel avenue, Bethlehem, PA 18015', 'Lisa Lisa', 12333321)
into customer(address, name, acc_ID) values ('207 Carlton avenue, Bethlehem, PA 18015', 'Suize Q', 87634521)

into customer(address, name, acc_ID) values ('123 Packer avenue, Bethlehem, PA 18015 #2', 'Baron Zeppilli', 12341234)
into customer(address, name, acc_ID) values ('123 Packer avenue, Bethlehem, PA 18015 #3', 'Robert E.O. Speedwagon', 12341234)
into customer(address, name, acc_ID) values ('365 4th street, Bethlehem, PA 18015 #2', 'Ceeeasaaarrr Zeppilli', 12345321)
into customer(address, name, acc_ID) values ('406 Packer avenue, Bethlehem, PA 18015 #2', 'Kakyoin Noriaki', 12355321)
into customer(address, name, acc_ID) values ('604 Birkel avenue, Bethlehem, PA 18015 #2', 'Hol Horse', 12333321)
select 1 from dual;
/*12341234, 12345123, 12345612, 12312345, 12123456, 12345321, 12355321, 12333321, 87634521*/


insert all
into bank(address, atm, teller) values ('47 3rd Street, Bethlehem, PA 18015', 1, 1)
into bank(address, atm, teller) values ('1034 Tribe Lane, Bethlehem, PA 18015', 1, 1)
into bank(address, atm, teller) values ('22 5th Street, Bethlehem, PA 18015', 1, 0)
into bank(address, atm, teller) values ('45 Packer Avenue, Bethlehem, PA 18015', 1, 1)
into bank(address, atm, teller) values ('23 Summit Street, Bethlehem, PA 18015', 1, 0)
into bank(address, atm, teller) values ('11 Memorial Drive, Bethlehem, PA 18015', 1, 0)
select 1 from dual;



insert all
into loan(loan_ID, interest_rate, amount, monthly_payment, type) values (43456, 4.20, 500, 35, 'unsecure')
into loan(loan_ID, interest_rate, amount, monthly_payment, type) values (78465, 3.73, 3200, 112, 'mortgage')
into loan(loan_ID, interest_rate, amount, monthly_payment, type) values (83928, 7.41, 200, 15, 'unsecure')
into loan(loan_ID, interest_rate, amount, monthly_payment, type) values (85918, 2.17, 12000, 230, 'mortgage')
into loan(loan_ID, interest_rate, amount, monthly_payment, type) values (14829, 1.24, 800, 50, 'unsecure')
/*43456, 78465, 83928, 85918, 14829, 50839, 75820, 70925, 85820, 50381*/
into loan(loan_ID, interest_rate, amount, monthly_payment, type) values (50839, 6.99, 7500, 135, 'mortgage')
into loan(loan_ID, interest_rate, amount, monthly_payment, type) values (75820, 5.64, 350, 18, 'unsecure')
into loan(loan_ID, interest_rate, amount, monthly_payment, type) values (70925, 4.81, 3300, 160, 'mortgage')
into loan(loan_ID, interest_rate, amount, monthly_payment, type) values (85820, 8.38, 1100, 76, 'unsecure')
into loan(loan_ID, interest_rate, amount, monthly_payment, type) values (50381, 4.65, 750, 55, 'unsecure')
select 1 from dual;


/*12341234, 12345123, 12345612, 12312345, 12123456, 12345321, 12355321, 12333321, 87634521*/
insert all
into has_loan(acc_ID, loan_ID) values (12341234, 43456)
into has_loan(acc_ID, loan_ID) values (12341234, 85918)
into has_loan(acc_ID, loan_ID) values (12345123, 78465)
into has_loan(acc_ID, loan_ID) values (12345612, 83928)
into has_loan(acc_ID, loan_ID) values (12312345, 50839)

into has_loan(acc_ID, loan_ID) values (12123456, 14829)
into has_loan(acc_ID, loan_ID) values (12345321, 75820)
into has_loan(acc_ID, loan_ID) values (12355321, 70925)
into has_loan(acc_ID, loan_ID) values (12333321, 85820)
into has_loan(acc_ID, loan_ID) values (87634521, 50381)
select 1 from dual;


/*12345123, 12345671, 11234567, 12344321, 12345321, 12354321, 12654321, 12355321, 12333321*/
insert all
into credit(acc_ID, interest_rate, running_balance, balance_due, card_number, credit_limit) values (12345123, 0.91, 140, 35, 76575567, 2000)
into credit(acc_ID, interest_rate, running_balance, balance_due, card_number, credit_limit) values (12345671, 0.65, 600, 120, 89357835, 3000)
into credit(acc_ID, interest_rate, running_balance, balance_due, card_number, credit_limit) values (11234567, 0.78, 1200, 357, 19509256, 12000)
into credit(acc_ID, interest_rate, running_balance, balance_due, card_number, credit_limit) values (12344321, 0.33, 175, 40, 17602852, 3000)
into credit(acc_ID, interest_rate, running_balance, balance_due, card_number, credit_limit) values (12345321, 1.06, 435, 90, 96921024, 4000)

into credit(acc_ID, interest_rate, running_balance, balance_due, card_number, credit_limit) values (12354321, 0.43, 890, 150, 86296012, 6000)
into credit(acc_ID, interest_rate, running_balance, balance_due, card_number, credit_limit) values (12654321, 0.71, 732, 127, 76182662, 8000)
into credit(acc_ID, interest_rate, running_balance, balance_due, card_number, credit_limit) values (12355321, 0.68, 60, 20, 30958280, 4000)
into credit(acc_ID, interest_rate, running_balance, balance_due, card_number, credit_limit) values (12333321, 1.14, 392, 68, 46028681, 7000)
select 1 from dual;


insert all
into checking(checking_ID, balance) values (12341234, 1374.53)
into checking(checking_ID, balance) values (12345123, 930.76) 
into checking(checking_ID, balance) values (12345612, 320.01)
into checking(checking_ID, balance) values (12345671, 27.32)
into checking(checking_ID, balance) values (12312345, 334.98)

into checking(checking_ID, balance) values (12123456, 891.95)
into checking(checking_ID, balance) values (11234567, 2382.82)
into checking(checking_ID, balance) values (12344321, 852.93)
into checking(checking_ID, balance) values (12345321, 1285.29)
into checking(checking_ID, balance) values (12345621, 852.92)

into checking(checking_ID, balance) values (12354321, 126.24)
into checking(checking_ID, balance) values (12654321, 62.28)
into checking(checking_ID, balance) values (12355321, 962.05)
into checking(checking_ID, balance) values (12333321, 497.26)
into checking(checking_ID, balance) values (87634521, 729.86)
select 1 from dual;



/*12341234, 12345612, 12345671, 11234567, 12344321, 12345321, 12354321, 12355321, 12333321, 87634521*/
insert all
into debit(checking_ID, card_number) values (12341234, 29571952)
into debit(checking_ID, card_number) values (12345612, 85829018)
into debit(checking_ID, card_number) values (12345671, 90858296)
into debit(checking_ID, card_number) values (11234567, 86819609)
into debit(checking_ID, card_number) values (12344321, 90829692)

into debit(checking_ID, card_number) values (12345321, 15820624)
into debit(checking_ID, card_number) values (12354321, 26860196)
into debit(checking_ID, card_number) values (12355321, 68190186)
into debit(checking_ID, card_number) values (12333321, 56781901)
into debit(checking_ID, card_number) values (87634521, 71962203)
select 1 from dual;



insert all
into saving(saving_ID, balance, min_balance, penalty) values (12341234, 8934.53, 300, 200)
into saving(saving_ID, balance, min_balance, penalty) values (12345123, 630.64, 200, 150) 
into saving(saving_ID, balance, min_balance, penalty) values (12345612, 1320.01, 300, 75)
into saving(saving_ID, balance, min_balance, penalty) values (12345671, 150.0, 150, 200)
into saving(saving_ID, balance, min_balance, penalty) values (12312345, 302.08, 200, 300)

into saving(saving_ID, balance, min_balance, penalty) values (12123456, 1098.72, 500, 125)
into saving(saving_ID, balance, min_balance, penalty) values (11234567, 96.82, 150, 75)
into saving(saving_ID, balance, min_balance, penalty) values (12344321, 760.93, 200, 150)
into saving(saving_ID, balance, min_balance, penalty) values (12345321, 3090.27, 800, 350)
into saving(saving_ID, balance, min_balance, penalty) values (12345621, 207.22, 150, 50)

into saving(saving_ID, balance, min_balance, penalty) values (12354321, 75.24, 100, 50)
into saving(saving_ID, balance, min_balance, penalty) values (12654321, 989.28, 300, 150)
into saving(saving_ID, balance, min_balance, penalty) values (12355321, 1062.05, 300, 200)
into saving(saving_ID, balance, min_balance, penalty) values (12333321, 2308.26, 500, 300)
into saving(saving_ID, balance, min_balance, penalty) values (87634521, 369.63, 150, 75)
select 1 from dual;


insert all
into transaction(c_address, trans_address, type, id, amount, time_of) values ('123 Packer avenue, Bethlehem, PA 18015', '45 Packer Avenue, Bethlehem, PA 18015', 'loan_payment', 43456, 230, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('375 Carlton avenue, Bethlehem, PA 18015', '45 Packer Avenue, Bethlehem, PA 18015', 'take_loan', null, 176, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('987 Birkel avenue, Bethlehem, PA 18015', '1034 Tribe Lane, Bethlehem, PA 18015', 'deposit', null, 85, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('123 Packer avenue, Bethlehem, PA 18015 #3', '47 3rd Street, Bethlehem, PA 18015', 'take_loan', null, 7, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('987 Birkel avenue, Bethlehem, PA 18015', '23 Summit Street, Bethlehem, PA 18015', 'withdraw', null, 151, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('324 Birkel avenue, Bethlehem, PA 18015', '1034 Tribe Lane, Bethlehem, PA 18015', 'withdraw', null, 214, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('375 Carlton avenue, Bethlehem, PA 18015', '22 5th Street, Bethlehem, PA 18015', 'deposit', null, 142, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('123 Packer avenue, Bethlehem, PA 18015 #2', '45 Packer Avenue, Bethlehem, PA 18015', 'deposit', null, 348, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('365 4th street, Bethlehem, PA 18015 #2', '22 5th Street, Bethlehem, PA 18015', 'transfer', null, 283, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('324 Birkel avenue, Bethlehem, PA 18015', '45 Packer Avenue, Bethlehem, PA 18015', 'transfer', null, 276, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('604 Birkel avenue, Bethlehem, PA 18015 #2', '22 5th Street, Bethlehem, PA 18015', 'take_loan', null, 362, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('616 Carlton avenue, Bethlehem, PA 18015', '45 Packer Avenue, Bethlehem, PA 18015', 'deposit', null, 2, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('123 Packer avenue, Bethlehem, PA 18015 #2', '45 Packer Avenue, Bethlehem, PA 18015', 'transfer', null, 375, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('123 Packer avenue, Bethlehem, PA 18015', '23 Summit Street, Bethlehem, PA 18015', 'withdraw', null, 417, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('616 Carlton avenue, Bethlehem, PA 18015', '22 5th Street, Bethlehem, PA 18015', 'deposit', null, 112, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('111 East 5th street, Bethlehem, PA 18015', '23 Summit Street, Bethlehem, PA 18015', 'withdraw', null, 32, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('122 Packer avenue, Bethlehem, PA 18015', '22 5th Street, Bethlehem, PA 18015', 'transfer', null, 149, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('324 Birkel avenue, Bethlehem, PA 18015', '45 Packer Avenue, Bethlehem, PA 18015', 'credit_purchase', null, 280, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('406 Packer avenue, Bethlehem, PA 18015 #2', '1034 Tribe Lane, Bethlehem, PA 18015', 'debit', null, 405, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('375 Carlton avenue, Bethlehem, PA 18015', '23 Summit Street, Bethlehem, PA 18015', 'withdraw', null, 6, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('834 Packer avenue, Bethlehem, PA 18015', '45 Packer Avenue, Bethlehem, PA 18015', 'loan_payment', 14829, 166, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('123 Packer avenue, Bethlehem, PA 18015 #2', '23 Summit Street, Bethlehem, PA 18015', 'withdraw', null, 318, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('375 Carlton avenue, Bethlehem, PA 18015', '45 Packer Avenue, Bethlehem, PA 18015', 'transfer', null, 389, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('987 Birkel avenue, Bethlehem, PA 18015', '1034 Tribe Lane, Bethlehem, PA 18015', 'deposit', null, 318, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('604 Birkel avenue, Bethlehem, PA 18015 #2', '23 Summit Street, Bethlehem, PA 18015', 'withdraw', null, 15, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('406 Packer avenue, Bethlehem, PA 18015 #2', '45 Packer Avenue, Bethlehem, PA 18015', 'withdraw', null, 376, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('365 4th street, Bethlehem, PA 18015', '23 Summit Street, Bethlehem, PA 18015', 'withdraw', null, 107, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('234 Birkel avenue, Bethlehem, PA 18015', '47 3rd Street, Bethlehem, PA 18015', 'credit_purchase', null, 325, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('123 Packer avenue, Bethlehem, PA 18015 #2', '47 3rd Street, Bethlehem, PA 18015', 'withdraw', null, 127, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('402 4th street, Bethlehem, PA 18015', '23 Summit Street, Bethlehem, PA 18015', 'withdraw', null, 396, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('111 East 5th street, Bethlehem, PA 18015', '22 5th Street, Bethlehem, PA 18015', 'take_loan', null, 298, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('616 Carlton avenue, Bethlehem, PA 18015', '45 Packer Avenue, Bethlehem, PA 18015', 'credit_purchase', null, 125, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('365 4th street, Bethlehem, PA 18015 #2', '1034 Tribe Lane, Bethlehem, PA 18015', 'withdraw', null, 379, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('123 Packer avenue, Bethlehem, PA 18015', '45 Packer Avenue, Bethlehem, PA 18015', 'debit', null, 346, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('464 Packer avenue, Bethlehem, PA 18015', '45 Packer Avenue, Bethlehem, PA 18015', 'withdraw', null, 376, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('123 Packer avenue, Bethlehem, PA 18015', '23 Summit Street, Bethlehem, PA 18015', 'withdraw', null, 78, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('406 Packer avenue, Bethlehem, PA 18015', '47 3rd Street, Bethlehem, PA 18015', 'debit', null, 384, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('122 Packer avenue, Bethlehem, PA 18015', '23 Summit Street, Bethlehem, PA 18015', 'withdraw', null, 191, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('464 Packer avenue, Bethlehem, PA 18015', '23 Summit Street, Bethlehem, PA 18015', 'withdraw', null, 267, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('464 Packer avenue, Bethlehem, PA 18015', '47 3rd Street, Bethlehem, PA 18015', 'withdraw', null, 134, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('604 Birkel avenue, Bethlehem, PA 18015', '45 Packer Avenue, Bethlehem, PA 18015', 'transfer', null, 290, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('324 Birkel avenue, Bethlehem, PA 18015', '1034 Tribe Lane, Bethlehem, PA 18015', 'debit', null, 202, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('406 Packer avenue, Bethlehem, PA 18015', '1034 Tribe Lane, Bethlehem, PA 18015', 'transfer', null, 134, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('406 Packer avenue, Bethlehem, PA 18015 #2', '1034 Tribe Lane, Bethlehem, PA 18015', 'credit_purchase', null, 255, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('122 Packer avenue, Bethlehem, PA 18015', '23 Summit Street, Bethlehem, PA 18015', 'withdraw', null, 348, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('123 Packer avenue, Bethlehem, PA 18015 #2', '45 Packer Avenue, Bethlehem, PA 18015', 'withdraw', null, 51, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('123 Packer avenue, Bethlehem, PA 18015 #2', '23 Summit Street, Bethlehem, PA 18015', 'withdraw', null, 410, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('604 Birkel avenue, Bethlehem, PA 18015', '45 Packer Avenue, Bethlehem, PA 18015', 'transfer', null, 130, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('123 Packer avenue, Bethlehem, PA 18015', '47 3rd Street, Bethlehem, PA 18015', 'loan_payment', 43456, 236, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('616 Carlton avenue, Bethlehem, PA 18015', '1034 Tribe Lane, Bethlehem, PA 18015', 'withdraw', null, 342, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('375 Carlton avenue, Bethlehem, PA 18015', '45 Packer Avenue, Bethlehem, PA 18015', 'deposit', null, 24, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('834 Packer avenue, Bethlehem, PA 18015', '23 Summit Street, Bethlehem, PA 18015', 'withdraw', null, 181, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('464 Packer avenue, Bethlehem, PA 18015', '23 Summit Street, Bethlehem, PA 18015', 'withdraw', null, 176, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('375 Carlton avenue, Bethlehem, PA 18015', '23 Summit Street, Bethlehem, PA 18015', 'withdraw', null, 113, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('365 4th street, Bethlehem, PA 18015', '45 Packer Avenue, Bethlehem, PA 18015', 'debit', null, 416, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('834 Packer avenue, Bethlehem, PA 18015', '1034 Tribe Lane, Bethlehem, PA 18015', 'transfer', null, 141, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('604 Birkel avenue, Bethlehem, PA 18015', '1034 Tribe Lane, Bethlehem, PA 18015', 'debit', null, 59, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('464 Packer avenue, Bethlehem, PA 18015', '47 3rd Street, Bethlehem, PA 18015', 'withdraw', null, 198, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('406 Packer avenue, Bethlehem, PA 18015 #2', '45 Packer Avenue, Bethlehem, PA 18015', 'debit', null, 99, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('604 Birkel avenue, Bethlehem, PA 18015 #2', '45 Packer Avenue, Bethlehem, PA 18015', 'transfer', null, 149, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('987 Birkel avenue, Bethlehem, PA 18015', '1034 Tribe Lane, Bethlehem, PA 18015', 'transfer', null, 67, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('406 Packer avenue, Bethlehem, PA 18015 #2', '1034 Tribe Lane, Bethlehem, PA 18015', 'deposit', null, 190, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('464 Packer avenue, Bethlehem, PA 18015', '22 5th Street, Bethlehem, PA 18015', 'debit', null, 316, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('111 East 5th street, Bethlehem, PA 18015', '47 3rd Street, Bethlehem, PA 18015', 'credit_purchase', null, 49, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('375 Carlton avenue, Bethlehem, PA 18015', '23 Summit Street, Bethlehem, PA 18015', 'withdraw', null, 364, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('604 Birkel avenue, Bethlehem, PA 18015 #2', '23 Summit Street, Bethlehem, PA 18015', 'withdraw', null, 111, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('616 Carlton avenue, Bethlehem, PA 18015', '22 5th Street, Bethlehem, PA 18015', 'withdraw', null, 292, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('324 Birkel avenue, Bethlehem, PA 18015', '1034 Tribe Lane, Bethlehem, PA 18015', 'take_loan', null, 57, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('234 Birkel avenue, Bethlehem, PA 18015', '23 Summit Street, Bethlehem, PA 18015', 'withdraw', null, 201, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('604 Birkel avenue, Bethlehem, PA 18015', '47 3rd Street, Bethlehem, PA 18015', 'debit', null, 391, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('604 Birkel avenue, Bethlehem, PA 18015', '45 Packer Avenue, Bethlehem, PA 18015', 'loan_payment', 85820, 204, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('406 Packer avenue, Bethlehem, PA 18015', '1034 Tribe Lane, Bethlehem, PA 18015', 'loan_payment', 70925, 388, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('365 4th street, Bethlehem, PA 18015 #2', '47 3rd Street, Bethlehem, PA 18015', 'withdraw', null, 419, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('365 4th street, Bethlehem, PA 18015 #2', '47 3rd Street, Bethlehem, PA 18015', 'credit_purchase', null, 368, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('375 Carlton avenue, Bethlehem, PA 18015', '22 5th Street, Bethlehem, PA 18015', 'deposit', null, 388, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('834 Packer avenue, Bethlehem, PA 18015', '23 Summit Street, Bethlehem, PA 18015', 'withdraw', null, 61, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('365 4th street, Bethlehem, PA 18015 #2', '1034 Tribe Lane, Bethlehem, PA 18015', 'transfer', null, 162, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('604 Birkel avenue, Bethlehem, PA 18015 #2', '47 3rd Street, Bethlehem, PA 18015', 'deposit', null, 346, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('987 Birkel avenue, Bethlehem, PA 18015', '23 Summit Street, Bethlehem, PA 18015', 'withdraw', null, 26, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('834 Packer avenue, Bethlehem, PA 18015', '45 Packer Avenue, Bethlehem, PA 18015', 'deposit', null, 247, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('234 Birkel avenue, Bethlehem, PA 18015', '23 Summit Street, Bethlehem, PA 18015', 'withdraw', null, 39, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('122 Packer avenue, Bethlehem, PA 18015', '47 3rd Street, Bethlehem, PA 18015', 'withdraw', null, 107, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('464 Packer avenue, Bethlehem, PA 18015', '23 Summit Street, Bethlehem, PA 18015', 'withdraw', null, 175, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('604 Birkel avenue, Bethlehem, PA 18015', '23 Summit Street, Bethlehem, PA 18015', 'withdraw', null, 39, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('834 Packer avenue, Bethlehem, PA 18015', '23 Summit Street, Bethlehem, PA 18015', 'withdraw', null, 291, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('123 Packer avenue, Bethlehem, PA 18015 #2', '22 5th Street, Bethlehem, PA 18015', 'loan_payment', 43456, 273, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('616 Carlton avenue, Bethlehem, PA 18015', '1034 Tribe Lane, Bethlehem, PA 18015', 'credit_purchase', null, 259, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('406 Packer avenue, Bethlehem, PA 18015 #2', '22 5th Street, Bethlehem, PA 18015', 'deposit', null, 33, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('122 Packer avenue, Bethlehem, PA 18015', '23 Summit Street, Bethlehem, PA 18015', 'withdraw', null, 334, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('123 Packer avenue, Bethlehem, PA 18015 #2', '45 Packer Avenue, Bethlehem, PA 18015', 'loan_payment', 43456, 134, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('464 Packer avenue, Bethlehem, PA 18015', '47 3rd Street, Bethlehem, PA 18015', 'deposit', null, 35, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('365 4th street, Bethlehem, PA 18015', '1034 Tribe Lane, Bethlehem, PA 18015', 'take_loan', null, 36, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('365 4th street, Bethlehem, PA 18015 #2', '45 Packer Avenue, Bethlehem, PA 18015', 'debit', null, 322, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('122 Packer avenue, Bethlehem, PA 18015', '22 5th Street, Bethlehem, PA 18015', 'deposit', null, 69, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('604 Birkel avenue, Bethlehem, PA 18015 #2', '47 3rd Street, Bethlehem, PA 18015', 'withdraw', null, 409, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('111 East 5th street, Bethlehem, PA 18015', '23 Summit Street, Bethlehem, PA 18015', 'withdraw', null, 115, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('324 Birkel avenue, Bethlehem, PA 18015', '23 Summit Street, Bethlehem, PA 18015', 'withdraw', null, 198, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('123 Packer avenue, Bethlehem, PA 18015 #2', '1034 Tribe Lane, Bethlehem, PA 18015', 'transfer', null, 252, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('123 Packer avenue, Bethlehem, PA 18015 #3', '45 Packer Avenue, Bethlehem, PA 18015', 'loan_payment', 43456, 381, CURRENT_TIMESTAMP)
into transaction(c_address, trans_address, type, id, amount, time_of) values ('123 Packer avenue, Bethlehem, PA 18015', '1034 Tribe Lane, Bethlehem, PA 18015', 'take_loan', null, 232, CURRENT_TIMESTAMP)
select 1 from dual;

