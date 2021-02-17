import java.io.*;
import java.sql.*;
import java.util.*;
// This example is bad.  It uses outdated style. but you"ll see this so I cover it.
// exceptions not handled
// no try-with-resources
class DataGen {

  public static void main (String[] arg) {

    //perm[] c = {new perm("pop", 0, (new int[]{534})), new perm("pip", 1, (new int[]{9202, 203}))};

    perm[] c_address = {new perm("123 Packer avenue, Bethlehem, PA 18015", 0, new int[]{43456, 85918}), new perm("234 Birkel avenue, Bethlehem, PA 18015", 1, new int[]{78465}), new perm("464 Packer avenue, Bethlehem, PA 18015", 0, new int[]{83928}),
            new perm("375 Carlton avenue, Bethlehem, PA 18015", 2, new int[]{43456}), new perm("987 Birkel avenue, Bethlehem, PA 18015", 3, new int[]{50839}), new perm("834 Packer avenue, Bethlehem, PA 18015", 3, new int[]{14829}),
                    new perm("324 Birkel avenue, Bethlehem, PA 18015", 2, new int[]{43456}), new perm("616 Carlton avenue, Bethlehem, PA 18015", 2, new int[]{43456}), new perm("365 4th street, Bethlehem, PA 18015", 4, new int[]{75820}),
                            new perm("122 Packer avenue, Bethlehem, PA 18015", 5, new int[]{43456}), new perm("111 East 5th street, Bethlehem, PA 18015", 2, new int[]{43456}), new perm("402 4th street, Bethlehem, PA 18015", 6, new int[]{43456}),
                                    new perm("406 Packer avenue, Bethlehem, PA 18015", 4, new int[]{70925}), new perm("604 Birkel avenue, Bethlehem, PA 18015", 4, new int[]{85820}), new perm("207 Carlton avenue, Bethlehem, PA 18015", 0, new int[]{50381}),
                                            new perm("123 Packer avenue, Bethlehem, PA 18015 #2", 0, new int[]{43456, 85918}), new perm("123 Packer avenue, Bethlehem, PA 18015 #3", 0, new int[]{43456, 85918}), new perm("365 4th street, Bethlehem, PA 18015 #2", 4, new int[]{75820}),
                                                    new perm("406 Packer avenue, Bethlehem, PA 18015 #2", 4, new int[]{70925}), new perm("604 Birkel avenue, Bethlehem, PA 18015 #2", 4, new int[]{85820})};

    String[] b_address = {"47 3rd Street, Bethlehem, PA 18015", "1034 Tribe Lane, Bethlehem, PA 18015", "22 5th Street, Bethlehem, PA 18015", "45 Packer Avenue, Bethlehem, PA 18015",
            "23 Summit Street, Bethlehem, PA 18015", "11 Memorial Drive, Bethlehem, PA 18015"};

    String[] type0 = {"withdraw", "debit", "loan_payment", "take_loan", "deposit", "transfer"};//6
    String[] type1 = {"withdraw", "credit_purchase", "loan_payment", "take_loan", "deposit", "transfer", "credit_payment"};//7
    String[] type2 = {"withdraw", "debit", "credit_purchase", "take_loan", "deposit", "transfer", "credit_payment"};//7
    String[] type3 = {"withdraw", "loan_payment", "take_loan", "deposit", "transfer"};//5
    String[] type4 = {"withdraw", "debit", "credit_purchase", "loan_payment", "take_loan", "deposit", "transfer", "credit_payment"};//8
    String[] type5 = {"withdraw", "take_loan", "deposit", "transfer"};//4
    String[] type6 = {"withdraw", "credit_purchase", "take_loan", "deposit", "transfer", "credit_payment"};//6


    int[] loan_id = {43456, 78465, 83928, 85918, 14829, 50839, 75820, 70925, 85820, 50381};
    int r = (int)(Math.random()*20);
    boolean limit = true;
    String hopeful = "";
    for (int i = 0; i < 100; i++) {
      String stm = "into transaction(c_address, b_address, type, id, amount, time_of) values (";
      r = (int)(Math.random()*20);
      stm += "\'" + c_address[r].address + "\', ";
      int prm = c_address[r].permissions;
      int lid = c_address[r].loan_id[0];
      r = (int)(Math.random()*5);
      stm += "\'" + b_address[r] + "\', ";
      if(r < 4)
        limit = false;
      else
        limit = true;
      if(limit) {
        r = 0;
        stm += "\'" + type4[0] + "\', ";
      } else if (prm == 0) {
        r = (int)(Math.random()*6);
        stm += "\'" + type0[r] + "\', ";
      } else if (prm == 1) {
        r = (int)(Math.random()*7);
        stm += "\'" + type1[r] + "\', ";
      } else if (prm == 2) {
        r = (int)(Math.random()*7);
        stm += "\'" + type2[r] + "\', ";
      } else if (prm == 3) {
        r = (int)(Math.random()*5);
        stm += "\'" + type3[r] + "\', ";
      } else if (prm == 4) {
        r = (int)(Math.random()*8);
        stm += "\'" + type4[r] + "\', ";
      } else if (prm == 5) {
        r = (int)(Math.random()*4);
        stm += "\'" + type5[r] + "\', ";
      } else if (prm == 6) {
        r = (int)(Math.random()*6);
        stm += "\'" + type6[r] + "\', ";
      }
      if(stm.contains("loan_payment"))
        stm += lid + ", ";
      else
        stm += "null, ";
      stm += (int)(Math.random()*420) + ", CURRENT_TIMESTAMP)\n";

      hopeful += stm;
    }

    System.out.println(hopeful);
  }
}
