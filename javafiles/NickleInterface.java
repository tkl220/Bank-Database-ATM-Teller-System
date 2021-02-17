import java.sql.*;
import java.util.Scanner;
import java.util.ArrayList;
import javafx.util.Pair;
import java.util.Random;

public class NickleInterface {

    public static void main(String[] args) {
        try {
            Class.forName ("oracle.jdbc.driver.OracleDriver");
        } catch(Exception e){e.printStackTrace();}

        Connection con = login();
        if(con != null) {
            System.out.println("Success");
        }
        Scanner scan = new Scanner(System.in);
        scan.useDelimiter(System.lineSeparator());
        while(true) {
            System.out.println("Select from the following two interfaces by inputting 1 or 2");
            System.out.println("1. Bank Managment Interface (not currently available)");
            System.out.println("2. Customer Interface");
            System.out.println("3. Exit");
            String input = scan.next();
            if(input.compareToIgnoreCase("1") == 0) {
                System.out.println("Not currently Implemented, please choose another option");
            } else if(input.compareToIgnoreCase("2") == 0) {
                while(true) {
                    System.out.println("These are the places you can interact with. Select from the options below by inputting the number of your desired option.");
                    System.out.println("1. Banks, where you can withdraw and deposit");
                    System.out.println("2. Stores, make purchases with your credit or debit card");
                    System.out.println("3. return to previous menu");
                    input = scan.next();
                    if (input.compareToIgnoreCase("1") == 0) {
                        banks(con);
                    } else if (input.compareToIgnoreCase("2") == 0) {
                        stores(con);
                    } else if (input.compareToIgnoreCase("3") == 0) {
                        System.out.println("Okay, returning to previous menu.");
                        break;
                    } else {
                        System.out.println("Invalid input, please try again or go back to select another interface.");
                    }
                }
            } else if(input.compareToIgnoreCase("3") == 0) {
                break;
            } else {
                System.out.println("Invalid input, please choose a valid option");
            }
        }
        try {con.close();} catch(Exception e){e.printStackTrace();}
        System.exit(0);
    }

    public static Connection login() {
        Scanner scan = new Scanner(System.in);
        scan.useDelimiter(System.lineSeparator());
        System.out.print("Input userid: ");
        String userid = scan.next();
        System.out.print("Input password: ");
        String password = scan.next();
        try {
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@edgar1.cse.lehigh.edu:1521:cse241", userid, password);
            return con;
        } catch(SQLException e) {
            System.out.println("Invalid Login, try again?[y/n]");
            String choice = scan.nextLine();
            if(choice.compareToIgnoreCase("y") == 0) {
                login();
            } else {
                System.out.println("Failed to login, try again later if you wish by rerunning the program.");
            }
        }
        return null;
    }


    public static void banks(Connection con) {
        //retrieving banks from database
        ArrayList<RowData> res = new ArrayList<RowData>();
        try {
            PreparedStatement get_banks = con.prepareStatement("SELECT address, atm, teller FROM bank");
            ResultSet rs = get_banks.executeQuery();
            while (rs.next()) {
                res.add(new RowData(-1, null, rs.getString("address"), null, -1, -1, rs.getBoolean("atm"), rs.getBoolean("teller"), -1, -1));
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return;
        }

        //print out banks
        System.out.println("Here are all the possible banks address's you can go to, keep in mind that banks with only an ATM\n" +
                " you need a debit card to withdraw from and there is no way to deposit from an ATM.\n" +
                " Select by typing a number, to return to the main menu at any time please enter \"return\".");
        for(int i = 0; i < res.size(); i++) {
            System.out.print(i + ". " + res.get(i).x_address + " has a ");
            if(res.get(i).atm) System.out.print("atm");
            if(res.get(i).teller) System.out.print(" and a teller");
            System.out.println("");
        }

        //selecting a bank ---
        Scanner scan = new Scanner(System.in);
        scan.useDelimiter(System.lineSeparator());
        String input = scan.next();
        int choice;
        //validate input
        while(true) {
            try {
                if(input.compareToIgnoreCase("return") == 0) return;
                choice = Integer.parseInt(input);
                if(choice >= res.size()) {
                    System.out.println("Invalid input please try again.");
                    input = scan.next();
                    continue;
                }
                break;
            } catch (Exception e) {
                System.out.println("Invalid input please try again.");
                input = scan.next();
            }
        }



        //withdraw or deposit
        ArrayList<RowData> res2 = new ArrayList<RowData>();
        String acc_ID = "";
        String dw = "";
        if(res.get(choice).teller) {
            while(true) {
                System.out.println("You can <deposit>, <withdraw>, or replace your <credit> and/or <debit> card from here, which would you like to do?\n" +
                        "type the text between the <> to choose that optioon");
                dw = scan.next();
                if (dw.compareToIgnoreCase("deposit") == 0) {
                    deposit(con, res.get(choice).x_address);
                    break;
                } else if (dw.compareToIgnoreCase("withdraw") == 0) {
                    withdraw(con, res.get(choice).x_address, true);
                    break;
                } else if (dw.compareToIgnoreCase("return") == 0) {
                    return;
                } else if (dw.compareToIgnoreCase("credit") == 0) {
                    replace_card(con, res.get(choice).x_address, true, "credit");
                    break;
                } else if (dw.compareToIgnoreCase("debit") == 0) {
                    replace_card(con, res.get(choice).x_address, true, "debit");
                    break;
                } else {
                    System.out.println("Invalid input please try again, or type return to return to previous menu");
                }
            }
        } else {
            System.out.println("You can only withdraw from here, and you can withdraw only if you have a debit card");
            withdraw(con, res.get(choice).x_address, false);
        }
    }



    public static void replace_card(Connection con, String x_address, boolean teller, String card_type) {
        System.out.println("enter your account id to replace your " + card_type + " card.");
        Scanner scan = new Scanner(System.in);
        scan.useDelimiter(System.lineSeparator());
        String acc_ID = scan.next();
        Random rand = new Random();
        int new_num = 10000000 + rand.nextInt(89999999);
        if(card_type.compareToIgnoreCase("credit") == 0) {
            while(true) {
                try {
                    if(acc_ID.compareToIgnoreCase("return") == 0) return;
                    PreparedStatement check_balance = con.prepareStatement("update credit set card_number = " + new_num + " WHERE acc_ID = " + acc_ID);
                    int rs = check_balance.executeUpdate();
                    if(rs <= 0) {
                        System.out.println("invalid account id, try again");
                        acc_ID = scan.next();
                        continue;
                    }
                    System.out.println("your new credit card number is " + new_num);
                    break;
                } catch (SQLException e) {
                    System.out.println("invalid account id");
                    acc_ID = scan.next();
                }
            }
        } else {
            while(true) {
                try {
                    if(acc_ID.compareToIgnoreCase("return") == 0) return;
                    PreparedStatement check_balance = con.prepareStatement("update debit set card_number = " + new_num + " WHERE checking_ID = " + acc_ID);
                    int rs = check_balance.executeUpdate();
                    if(rs <= 0) {
                        System.out.println("invalid account id, try again");
                        acc_ID = scan.next();
                        continue;
                    }
                    System.out.println("your new debit card number is " + new_num);
                    break;
                } catch (SQLException e) {
                    System.out.println("invalid account id");
                    acc_ID = scan.next();
                }
            }
        }
    }


    /*
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     */
    public static void stores(Connection con) {
        //retrieving banks from database
        Scanner scan = new Scanner(System.in);
        scan.useDelimiter(System.lineSeparator());
        ArrayList<Pair<String, Pair<String, Double>>> store_arr = new ArrayList<>();
        store_arr.add(new Pair("The Goose", new Pair("Sandwhich", new Double(6.45))));
        store_arr.add(new Pair("Swarovski", new Pair("Engagement ring", new Double(3236.42))));
        store_arr.add(new Pair("LuLu Lemon", new Pair("Leggings", new Double(109.99))));
        store_arr.add(new Pair("Target", new Pair("Toilet paper", new Double(16.99))));
        store_arr.add(new Pair("Best Buy", new Pair("Nintendo Switch", new Double(349.99))));
        store_arr.add(new Pair("Delta Airline", new Pair("Flight to Madagascar", new Double(747.47))));
        store_arr.add(new Pair("Jone's Barbeque and Foot Massage", new Pair("massage", new Double(17.12))));

        //print out banks
        System.out.println("Here are all the possible store's you can go to, you can purchase their items or services with a debit or credit card.\n" +
                " Without a debit or credit car you cannot buy anything at these stores. All stores accept both debit and credit.\n" +
                " Select by entering a number, to return to the main menu at any time please enter \"return\".");
        for(int i = 0; i < store_arr.size(); i++) {
            System.out.println(i + ". " + store_arr.get(i).getKey() + " is selling a " + store_arr.get(i).getValue().getKey() + " for $" + store_arr.get(i).getValue().getValue());
        }
        //selecting a store ---
        String input = scan.next();
        int choice;
        //validate input
        while(true) {
            try {
                if(input.compareToIgnoreCase("return") == 0) return;
                choice = Integer.parseInt(input);
                if(choice >= store_arr.size()) {
                    System.out.println("Invalid input please try again.");
                    input = scan.next();
                    continue;
                }
                break;
            } catch (Exception e) {
                System.out.println("Invalid input please try again.");
                input = scan.next();
            }
        }

        System.out.println("credit or debit?");
        String card_type = scan.next();
        while(true) {
            if(card_type.compareToIgnoreCase("credit") == 0) {
                credit_purchase(con, store_arr.get(choice).getKey(), Double.valueOf(store_arr.get(choice).getValue().getValue()));
                break;
            } else if(card_type.compareToIgnoreCase("debit") == 0) {
                debit_purchase(con, store_arr.get(choice).getKey(), Double.valueOf(store_arr.get(choice).getValue().getValue()));
                break;
            } else if(card_type.compareToIgnoreCase("return") == 0) {
                return;
            } else {
                System.out.println("Invalid input please try again, or type return to return to previous menu");
                card_type = scan.next();
            }
        }
    }

    /*
    *
    *
    *
    *
    *
    *
    *
    *
    *
    *
    *
    *
    *
    *
    *
    *
    *
    *
    *
    */
    public static void withdraw(Connection con, String b_address, boolean teller) {
        //if teller use account ID, if ATM use card number
        Scanner scan = new Scanner(System.in);
        scan.useDelimiter(System.lineSeparator());
        ArrayList<RowData> res2 = new ArrayList<RowData>();
        String acc_ID = "";
        if(teller) {
            //scan in acc_ID
            System.out.println("now please input your account ID");
            acc_ID = scan.next();
            res2 = new ArrayList<RowData>();
            //validate input and put customer in res2
            while (true) {
                try {
                    PreparedStatement get_customer = con.prepareStatement("SELECT address, name FROM customer WHERE acc_ID = " + acc_ID);
                    if(acc_ID.compareToIgnoreCase("return") == 0) return;
                    ResultSet rs2 = get_customer.executeQuery();
                    while (rs2.next()) {
                        res2.add(new RowData(-1, rs2.getString("address"), rs2.getString("name"), null, -1, -1, false, false, -1, -1));
                    }
                    rs2.close();
                    if(res2.size() <= 0) {
                        System.out.println("invalid card number, try again");
                        acc_ID= scan.next();
                        continue;
                    }
                    break;
                } catch (SQLException e) {//if invalid try again
                    System.out.println("Invalid input please try again.");
                    acc_ID = scan.next();
                }
            }
        } else {//if ATM get card number and then get acc_ID from card number
            System.out.println("now please input your debit card number");
            String card_num = scan.next();
            res2 = new ArrayList<RowData>();
            while (true) {
                try {
                    PreparedStatement get_customer = con.prepareStatement("select acc_ID, address, name from customer where acc_ID = (select checking_ID from debit where card_number = " + card_num + ")");
                    if(acc_ID.compareToIgnoreCase("return") == 0) return;
                    ResultSet rs2 = get_customer.executeQuery();
                    while (rs2.next()) {
                        res2.add(new RowData(rs2.getInt("acc_ID"), rs2.getString("address"), rs2.getString("name"), null, -1, -1, false, false, -1, -1));
                    }
                    rs2.close();
                    if(res2.size() <= 0) {
                        System.out.println("invalid card number, try again");
                        card_num = scan.next();
                        continue;
                    }
                    acc_ID = Integer.toString(res2.get(0).acc_id);
                    break;
                } catch (SQLException e) {
                    System.out.println("Invalid input please try again. If you dont have a debit card you can't withdraw here(type return).");
                    card_num = scan.next();
                }
            }
        }
        //if mulitple people tied to an account, select one
        String name = "";
        String address = res2.get(0).c_address;
        if(res2.size() > 1) {
            System.out.println("There are multiple customers for this debit card or account, please indicate who you are by name");
            for(int i = 0; i < res2.size(); i++) {
                System.out.println(res2.get(i).x_address);
            }
            boolean check = false;
            name = scan.next();
            if(name.compareToIgnoreCase("return") == 0) return;
            for(int i = 0; i < res2.size(); i++) {
                if(name.compareToIgnoreCase(res2.get(i).x_address) == 0) {
                    check = true;
                    address = res2.get(i).c_address;
                    break;
                }
            }
            while(!check) {
                System.out.println("Invalid input please try again.");
                name = scan.next();
                if(name.compareToIgnoreCase("return") == 0) return;
                for(int i = 0; i < res2.size(); i++) {
                    if(name.compareToIgnoreCase(res2.get(i).x_address) == 0) {
                        check = true;
                        address = res2.get(i).c_address;
                        break;
                    }
                }
            }
        }

        //decide which account to withdraw from, savings or checking
        System.out.println("would you like to withdraw from your (1)savings or your (2)checking account? please input corresponding number");
        String input = scan.next();
        //display balance info based on account selected
        if(input.compareToIgnoreCase("return") == 0) return;
        String account = "";
        int account_type = 0;
        ArrayList<RowData> res3 = new ArrayList<RowData>();
        double balance = -1;
        double min_balance = -1;
        double penalty = -1;
        while(true) {
            if (input.compareToIgnoreCase("1") == 0) {
                account = "saving";
                account_type = 1;
                try {
                    PreparedStatement check_balance = con.prepareStatement("SELECT balance, min_balance, penalty FROM saving WHERE saving_ID = " + acc_ID);
                    ResultSet rs3 = check_balance.executeQuery();
                    while (rs3.next()) {
                        res3.add(new RowData(-1, null, null, null, -1, rs3.getDouble("balance"), false, false, rs3.getDouble("min_balance"), rs3.getDouble("penalty")));
                    }
                    rs3.close();
                } catch (SQLException e) {
                    System.out.println("invalid account id");
                }
                balance = res3.get(0).amount;
                min_balance = res3.get(0).limit;
                penalty = res3.get(0).limit;
                System.out.println("Balance: " + Math.round(res3.get(0).amount * 100.0) / 100.0 + "\n Minimum Balance: " + res3.get(0).limit + "\nPenalty for going under minimum balance: " + penalty);
                break;
            } else if (input.compareToIgnoreCase("2") == 0) {
                account = "checking";
                account_type = 2;
                try {
                    PreparedStatement check_balance = con.prepareStatement("SELECT balance FROM checking WHERE checking_ID = " + acc_ID);
                    ResultSet rs3 = check_balance.executeQuery();
                    while (rs3.next()) {
                        res3.add(new RowData(-1, null, null, null, -1, rs3.getDouble("balance"), false, false, -1, -1));
                    }
                    rs3.close();
                } catch (SQLException e) {
                    System.out.println("invalid account id");
                }
                balance = res3.get(0).amount;
                System.out.println("Balance: " + Math.round(res3.get(0).amount * 100.0) / 100.0);
                break;
            } else if(input.compareToIgnoreCase("return") == 0) {
                return;
            } else {
                System.out.println("invalid input, please try again, or type return to go back to previous menu.");
                input = scan.next();
            }
        }

        //input amount to withdraw and validate
        System.out.println("please enter amount you want to withdraw");
        input = scan.next();
        double amount;
        while(true) {
            try {
                if(input.compareToIgnoreCase("return") == 0) return;
                amount = Double.parseDouble(input);
                if(balance - amount < 0 && account_type == 2) {
                    System.out.println("you cannot withdraw that much, you can not go negative in your checking account, enter a lower amount");
                    input = scan.next();
                    continue;
                } else if(amount < 0) {
                    System.out.println("you cannot withdraw an amount lower than 0");
                    input = scan.next();
                    continue;
                }
                break;
            } catch (Exception e) {
                System.out.println("Invalid input please try again.");
                input = scan.next();
            }
        }

        //set and insert into transaction table, triggers any_transaction trigger to update respective account
        int rs5 = 0;
        try {
            PreparedStatement stmt = con.prepareStatement("insert into transaction values(?, ?, ?, ?, ?, CURRENT_TIMESTAMP)");
            stmt.setString(1, address);
            stmt.setString(2, b_address);
            stmt.setString(3, "withdraw");
            stmt.setInt(4, account_type);
            stmt.setDouble(5, amount);
            rs5 = stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("invalid input");
        }
        if(rs5 == 0) {
            System.out.println("error inserting transaction");
        }

        double new_balance = get_balance(account, con, acc_ID);
        System.out.println("You withdrew " + amount + " your new balance is " + Math.round(new_balance * 100.0) / 100.0);
    }



    /*
    *
    *
    *
    *
    *
    *
    *
    *
    *
    *
    *
    *
    *
    *
    *
    *
    *
    */
    public static void deposit(Connection con, String b_address) {//assume bank is known and valid
        Scanner scan = new Scanner(System.in);
        scan.useDelimiter(System.lineSeparator());
        System.out.println("Please input your account ID to start the deposit transaction");
        String acc_ID = scan.next();
        ArrayList<RowData> res2 = new ArrayList<RowData>();
        //validate input and put customer in res2
        while (true) {
            try {
                PreparedStatement get_customer = con.prepareStatement("SELECT address, name FROM customer WHERE acc_ID = " + acc_ID);
                if(acc_ID.compareToIgnoreCase("return") == 0) return;
                ResultSet rs2 = get_customer.executeQuery();
                while (rs2.next()) {
                    res2.add(new RowData(-1, rs2.getString("address"), rs2.getString("name"), null, -1, -1, false, false, -1, -1));
                }
                rs2.close();
                if(res2.size() <= 0) {
                    System.out.println("invalid card number, try again");
                    acc_ID = scan.next();
                    continue;
                }
                break;
            } catch (SQLException e) {//if invalid try again
                System.out.println("Invalid input please try again.");
                acc_ID = scan.next();
            }
        }

        //if mulitple people tied to an account, select one
        String name = "";
        String address = res2.get(0).c_address;
        if(res2.size() > 1) {
            System.out.println("There are multiple customers for this account, please indicate who you are by name");
            for(int i = 0; i < res2.size(); i++) {
                System.out.println(res2.get(i).x_address);
            }
            boolean check = false;
            scan.useDelimiter(System.lineSeparator());
            name = scan.next();
            if(name.compareToIgnoreCase("return") == 0) return;
            for(int i = 0; i < res2.size(); i++) {
                if(name.compareToIgnoreCase(res2.get(i).x_address) == 0) {
                    check = true;
                    address = res2.get(i).c_address;
                    break;
                }
            }
            while(!check) {
                System.out.println("Invalid input please try again.");
                name = scan.next();
                if(name.compareToIgnoreCase("return") == 0) return;
                for(int i = 0; i < res2.size(); i++) {
                    if(name.compareToIgnoreCase(res2.get(i).x_address) == 0) {
                        check = true;
                        address = res2.get(i).c_address;
                        break;
                    }
                }
            }
        }

        //decide which account to from, savings or checking
        System.out.println("would you like to deposit into your (1)savings or your (2)checking account? please input corresponding number");
        String input = scan.next();
        //display balance info based on account selected
        if(input.compareToIgnoreCase("return") == 0) return;
        String account = "";
        int account_type = 0;
        ArrayList<RowData> res3 = new ArrayList<RowData>();
        double balance = -1;
        double min_balance = -1;
        double penalty = -1;
        while(true) {
            if (input.compareToIgnoreCase("1") == 0) {
                account = "saving";
                account_type = 1;
                try {
                    PreparedStatement check_balance = con.prepareStatement("SELECT balance, min_balance, penalty FROM saving WHERE saving_ID = " + acc_ID);
                    ResultSet rs3 = check_balance.executeQuery();
                    while (rs3.next()) {
                        res3.add(new RowData(-1, null, null, null, -1, rs3.getDouble("balance"), false, false, rs3.getDouble("min_balance"), rs3.getDouble("penalty")));
                    }
                    rs3.close();
                } catch (SQLException e) {
                    System.out.println("invalid account id");
                }
                balance = res3.get(0).amount;
                min_balance = res3.get(0).limit;
                penalty = res3.get(0).limit;
                System.out.println("Balance: " + Math.round(res3.get(0).amount * 100.0) / 100.0 + "\n Minimum Balance: " + res3.get(0).limit + "\nPenalty for going under minimum balance: " + penalty);
                break;
            } else if (input.compareToIgnoreCase("2") == 0) {
                account = "checking";
                account_type = 2;
                try {
                    PreparedStatement check_balance = con.prepareStatement("SELECT balance FROM checking WHERE checking_ID = " + acc_ID);
                    ResultSet rs3 = check_balance.executeQuery();
                    while (rs3.next()) {
                        res3.add(new RowData(-1, null, null, null, -1, rs3.getDouble("balance"), false, false, -1, -1));
                    }
                    rs3.close();
                } catch (SQLException e) {
                    System.out.println("invalid account id");
                }
                balance = res3.get(0).amount;
                System.out.println("Balance: " + Math.round(res3.get(0).amount * 100.0) / 100.0);
                break;
            } else if(input.compareToIgnoreCase("return") == 0) {
                return;
            } else {
                System.out.println("invalid input, please try again, or type return to go back to previous menu.");
                input = scan.next();
            }
        }

        //input amount to withdraw and validate
        System.out.println("please enter amount you want to deposit");
        input = scan.next();
        double amount;
        while(true) {
            try {
                if(input.compareToIgnoreCase("return") == 0) return;
                amount = Double.parseDouble(input);
                if(amount < 0) {
                    System.out.println("you deposit an amount lower than 0");
                    input = scan.next();
                    continue;
                }
                break;
            } catch (Exception e) {
                System.out.println("Invalid input please try again.");
                input = scan.next();
            }
        }

        //set and insert into transaction table, triggers any_transaction trigger to update respective account
        int rs5 = 0;
        try {
            PreparedStatement stmt = con.prepareStatement("insert into transaction values(?, ?, ?, ?, ?, CURRENT_TIMESTAMP)");
            stmt.setString(1, address);
            stmt.setString(2, b_address);
            stmt.setString(3, "deposit");
            stmt.setInt(4, account_type);
            stmt.setDouble(5, amount);
            rs5 = stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("invalid input");
        }
        if(rs5 == 0) {
            System.out.println("error inserting transaction");
        }

        double new_balance = get_balance(account, con, acc_ID);
        System.out.println("You deposited $" + amount + " your new balance is " + Math.round(new_balance * 100.00) / 100.00);

        return;
    }

    /*
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     */
    public static void credit_purchase(Connection con, String x_address, double amount) {
        Scanner scan = new Scanner(System.in);
        scan.useDelimiter(System.lineSeparator());
        System.out.println("Please enter your credit card number");
        String card_number = scan.next();
        if(card_number.compareToIgnoreCase("return") == 0) return;
        double balance = -1;
        double limit = -1;
        ArrayList<RowData> res3 = new ArrayList<RowData>();
        while(true) {
            try {
                if(card_number.compareToIgnoreCase("return") == 0) return;
                PreparedStatement check_balance = con.prepareStatement("SELECT running_balance, credit_limit FROM credit WHERE card_number = " + card_number);
                ResultSet rs3 = check_balance.executeQuery();
                while (rs3.next()) {
                    res3.add(new RowData(-1, null, null, null, -1, rs3.getDouble("running_balance"), false, false, rs3.getDouble("credit_limit"), -1));
                }
                rs3.close();
                if(res3.size() <= 0) {
                    System.out.println("invalid card number, try again");
                    card_number = scan.next();
                    continue;
                }
                balance = res3.get(0).amount;
                limit = res3.get(0).limit;
                System.out.println("running balance: " + balance + "\nrunning balance limit: " + limit);
                break;
            } catch (SQLException e) {
                System.out.println("invalid card number");
                card_number = scan.next();
            }
        }
        if(balance + amount > limit) {
            System.out.println("you cannot make this purchase. It will surpass the limit of your credit card.");
            return;
        }


        ArrayList<RowData> res2 = new ArrayList<RowData>();
        while (true) {
            try {
                PreparedStatement get_customer = con.prepareStatement("SELECT address, name FROM customer WHERE acc_ID = (select acc_ID from credit where card_number = " + card_number + ")");
                if(card_number.compareToIgnoreCase("return") == 0) return;
                ResultSet rs2 = get_customer.executeQuery();
                while (rs2.next()) {
                    res2.add(new RowData(-1, rs2.getString("address"), rs2.getString("name"), null, -1, -1, false, false, -1, -1));
                }
                rs2.close();
                break;
            } catch (SQLException e) {//if invalid try again
                System.out.println("Invalid input please try again.");
                card_number = scan.next();
            }
        }

        //if mulitple people tied to an account, select one
        String name = "";
        String address = res2.get(0).c_address;
        if(res2.size() > 1) {
            System.out.println("There are multiple customers for this account, please indicate who you are by name");
            for(int i = 0; i < res2.size(); i++) {
                System.out.println(res2.get(i).x_address);
            }
            boolean check = false;
            name = scan.next();
            if(name.compareToIgnoreCase("return") == 0) return;
            for(int i = 0; i < res2.size(); i++) {
                if(name.compareToIgnoreCase(res2.get(i).x_address) == 0) {
                    check = true;
                    address = res2.get(i).c_address;
                    break;
                }
            }
            while(!check) {
                System.out.println("Invalid input please try again.");
                name = scan.next();
                if(name.compareToIgnoreCase("return") == 0) return;
                for(int i = 0; i < res2.size(); i++) {
                    if(name.compareToIgnoreCase(res2.get(i).x_address) == 0) {
                        check = true;
                        address = res2.get(i).c_address;
                        break;
                    }
                }
            }
        }



        int rs5 = 0;
        try {
            System.out.println(address +", " + x_address + ", " + amount);
            PreparedStatement stmt = con.prepareStatement("insert into transaction values(?, ?, ?, ?, ?, CURRENT_TIMESTAMP)");
            stmt.setString(1, address);
            stmt.setString(2, x_address);
            stmt.setString(3, "credit_purchase");
            stmt.setInt(4, 3);
            stmt.setDouble(5, amount);
            rs5 = stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("invalid input");
        }
        if(rs5 == 0) {
            System.out.println("error inserting transaction");
        }

        double new_balance = -1;
        res3 = new ArrayList<RowData>();
        try {
            PreparedStatement get_new_balance = con.prepareStatement("SELECT running_balance FROM credit WHERE card_number = " + card_number);
            ResultSet rs3 = get_new_balance.executeQuery();
            while (rs3.next()) {
                res3.add(new RowData(-1, null, null, null, -1, rs3.getDouble("running_balance"), false, false, -1, -1));
            }
            rs3.close();
            new_balance = res3.get(0).amount;
        } catch (SQLException e) {
            System.out.println("invalid card number");
        }
        System.out.println("You spent $" + amount + " your new running balance is $" + Math.round(new_balance * 100.00) / 100.00);
        return;
    }

    /*
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     */
    public static void debit_purchase(Connection con, String x_address, double amount) {
        Scanner scan = new Scanner(System.in);
        scan.useDelimiter(System.lineSeparator());
        System.out.println("now please input your debit card number");
        String card_num = scan.next();
        ArrayList<RowData> res2 = new ArrayList<RowData>();
        String acc_ID = "";
        while (true) {
            try {
                PreparedStatement get_customer = con.prepareStatement("select acc_ID, address, name from customer where acc_ID = (select checking_ID from debit where card_number = " + card_num + ")");
                if(acc_ID.compareToIgnoreCase("return") == 0) return;
                ResultSet rs2 = get_customer.executeQuery();
                while (rs2.next()) {
                    res2.add(new RowData(rs2.getInt("acc_ID"), rs2.getString("address"), rs2.getString("name"), null, -1, -1, false, false, -1, -1));
                }
                rs2.close();
                if(res2.size() <= 0) {
                    System.out.println("invalid card number, try again");
                    card_num = scan.next();
                    continue;
                }
                acc_ID = Integer.toString(res2.get(0).acc_id);
                break;
            } catch (SQLException e) {
                System.out.println("Invalid input please try again. If you dont have a debit card you can't withdraw here(type return).");
                card_num = scan.next();
            }
        }

        //if mulitple people tied to an account, select one
        String name = "";
        String address = res2.get(0).c_address;
        if(res2.size() > 1) {
            System.out.println("There are multiple owners for this debit card, please indicate who you are by signing your name");
            for(int i = 0; i < res2.size(); i++) {
                System.out.println(res2.get(i).x_address);
            }
            boolean check = false;
            name = scan.next();
            if(name.compareToIgnoreCase("return") == 0) return;
            for(int i = 0; i < res2.size(); i++) {
                if(name.compareToIgnoreCase(res2.get(i).x_address) == 0) {
                    check = true;
                    address = res2.get(i).c_address;
                    break;
                }
            }
            while(!check) {
                System.out.println("Invalid input please try again.");
                name = scan.next();
                if(name.compareToIgnoreCase("return") == 0) return;
                for(int i = 0; i < res2.size(); i++) {
                    if(name.compareToIgnoreCase(res2.get(i).x_address) == 0) {
                        check = true;
                        address = res2.get(i).c_address;
                        break;
                    }
                }
            }
        }
        ArrayList<RowData> res3 = new ArrayList<RowData>();
        try {
            PreparedStatement check_balance = con.prepareStatement("SELECT balance FROM checking WHERE checking_ID = " + acc_ID);
            ResultSet rs3 = check_balance.executeQuery();
            while (rs3.next()) {
                res3.add(new RowData(-1, null, null, null, -1, rs3.getDouble("balance"), false, false, -1, -1));
            }
            rs3.close();
        } catch (SQLException e) {
            System.out.println("invalid account id");
        }
        double balance = res3.get(0).amount;

        if(balance - amount < 0) {
            System.out.println("you cannot afford this purchase, your checking account cannot go below 0.");
            return;
        }
        int rs5 = 0;
        try {
            PreparedStatement stmt = con.prepareStatement("insert into transaction values(?, ?, ?, ?, ?, CURRENT_TIMESTAMP)");
            stmt.setString(1, address);
            stmt.setString(2, x_address);
            stmt.setString(3, "debit");
            stmt.setInt(4, 0);
            stmt.setDouble(5, amount);
            rs5 = stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("invalid input");
        }
        if(rs5 == 0) {
            System.out.println("error inserting transaction");
        }
        double new_balance = get_balance("checking", con, acc_ID);
        System.out.println("You spent $" + amount + " your new checking account balance is $" + Math.round(new_balance * 100.00) / 100.00);
        return;
    }

    /*
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     */
    public static double get_balance(String account, Connection con, String acc_ID) {
        ArrayList<RowData> res3 = new ArrayList<RowData>();
        if(account.compareToIgnoreCase("saving") == 0)
        {
            try {
                PreparedStatement check_balance = con.prepareStatement("SELECT balance FROM saving WHERE saving_ID = " + acc_ID);
                ResultSet rs3 = check_balance.executeQuery();
                while (rs3.next()) {
                    res3.add(new RowData(-1, null, null, null, -1, rs3.getDouble("balance"), false, false, -1, -1));
                }
                rs3.close();
            } catch (SQLException e) {
                System.out.println("invalid account id");
            }
            return res3.get(0).amount;

        } else {
            try {
                PreparedStatement check_balance = con.prepareStatement("SELECT balance FROM checking WHERE checking_ID = " + acc_ID);
                ResultSet rs3 = check_balance.executeQuery();
                while (rs3.next()) {
                    res3.add(new RowData(-1, null, null, null, -1, rs3.getDouble("balance"), false, false, -1, -1));
                }
                rs3.close();
            } catch (SQLException e) {
                System.out.println("invalid account id");
            }
            return res3.get(0).amount;
        }
    }
}