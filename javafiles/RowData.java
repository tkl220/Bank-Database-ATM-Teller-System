public class RowData {
    int acc_id;
    String c_address;
    String x_address;
    String type;
    int id;
    double amount;
    boolean atm;
    boolean teller;
    double limit;
    double penalty;

    public RowData(int acc_id, String c_address, String x_address, String type, int id, double amount, boolean atm, boolean teller, double limit, double penalty) {
        this.acc_id = acc_id;
        this.c_address = c_address;
        this.x_address = x_address;
        this.type = type;
        this.id = id;
        this.amount = amount;
        this.atm = atm;
        this.teller = teller;
        this.limit = limit;
        this.penalty = penalty;
    }
}