create table account (
    acc_ID INTEGER primary key,
    interest_rate FLOAT NOT NULL,
    transaction_types varchar(511) NOT NULL
);
grant select on account to grader;

create table customer (
    address varchar(255) primary key,
    name varchar(255) NOT NULL,
    acc_ID INTEGER NOT NULL,
    foreign key (acc_ID) references account (acc_ID)
);
grant select on customer to grader;

create table bank (
    address varchar(255) primary key,
    atm number(3) NOT NULL,
    teller number(3) NOT NULL
);
grant select on bank to grader;

create table transaction (
    c_address varchar(255) NOT NULL,
    foreign key (c_address) references customer (address),
    trans_address varchar(255) NOT NULL,
    type varchar(255) NOT NULL,
    id INTEGER,
    amount BINARY_DOUBLE NOT NULL,
    time_of TIMESTAMP(2) NOT NULL
);
alter table transaction add constraint const check((type = '%oan' and id is not null) or type != '%oan');
grant select on transaction to grader;

create table loan (
    loan_ID INTEGER primary key,
    interest_rate FLOAT NOT NULL,
    amount BINARY_DOUBLE NOT NULL,
    monthly_payment BINARY_DOUBLE NOT NULL,
    type VARCHAR(127) NOT NULL
);
grant select on loan to grader;

create table has_loan (
    acc_ID INTEGER NOT NULL,
    foreign key (acc_ID) references account (acc_ID),
    loan_ID INTEGER NOT NULL,
    foreign key (loan_ID) references loan (loan_ID)
    
);
grant select on has_loan to grader;

create table credit (
    acc_ID INTEGER primary key,
    foreign key (acc_ID) references account (acc_ID),
    interest_rate BINARY_DOUBLE NOT NULL,
    running_balance BINARY_DOUBLE NOT NULL,
    balance_due BINARY_DOUBLE NOT NULL,
    card_number INTEGER NOT NULL,
    credit_limit BINARY_DOUBLE NOT NULL
);
grant select on credit to grader;

create table checking (
    checking_ID INTEGER NOT NULL primary key,
    foreign key (checking_ID) references account (acc_ID),
    balance BINARY_DOUBLE NOT NULL check(balance >= 0)
);
grant select on checking to grader;

create table debit (
    checking_ID INTEGER NOT NULL primary key,
    foreign key (checking_ID) references checking (checking_ID),
    card_number INTEGER NOT NULL
);
grant select on debit to grader;

create table saving (
    saving_ID number(14) NOT NULL primary key,
    foreign key (saving_ID) references account (acc_ID),
    balance BINARY_DOUBLE NOT NULL,
    min_balance BINARY_DOUBLE NOT NULL,
    penalty BINARY_DOUBLE NOT NULL
);
grant select on saving to grader;

create or replace trigger any_transaction
after
insert on transaction
REFERENCING OLD AS OLD NEW AS NEW
for each row
declare
new_balance BINARY_DOUBLE;
minimum_bal BINARY_DOUBLE;
begin
    if :NEW.type = 'withdraw' then
        if :NEW.id = 1 then
            UPDATE saving SET balance = balance - :NEW.amount WHERE saving_ID = (select acc_ID from customer where address = :NEW.c_address);
            select balance into new_balance from saving where saving_ID = (select acc_ID from customer where address = :NEW.c_address);
            select min_balance into minimum_bal from saving where saving_ID = (select acc_ID from customer where address = :NEW.c_address);
            if new_balance < minimum_bal then
                UPDATE saving SET balance = balance - penalty WHERE saving_ID = (select acc_ID from customer where address = :NEW.c_address);
            end if;
        end if;
        if :NEW.id = 2 then
            UPDATE checking SET balance = balance - :NEW.amount WHERE checking_ID = (select acc_ID from customer where address = :NEW.c_address);
        end if;
    end if;

    if :NEW.type = 'deposit' then
        if :NEW.id = 1 then
            UPDATE saving SET balance = balance + :NEW.amount WHERE saving_ID = (select acc_ID from customer where address = :NEW.c_address);
        end if;
        if :NEW.id = 2 then
            UPDATE checking SET balance = balance + :NEW.amount WHERE checking_ID = (select acc_ID from customer where address = :NEW.c_address);
        end if;
    end if;

    if :NEW.type = 'debit' then
        UPDATE checking SET balance = balance - :NEW.amount WHERE checking_ID = (select acc_ID from customer where address = :NEW.c_address);
    end if;

    if :NEW.type = 'credit_purchase' then
        UPDATE credit SET running_balance = running_balance + :NEW.amount WHERE acc_ID = (select acc_ID from customer where address = :NEW.c_address);
    end if;
end;
