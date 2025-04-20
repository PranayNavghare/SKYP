package skyp.billing.model;

import java.sql.Timestamp;

public class Billing {
    private int id;
    private int userId;
    private String planName;
    private double amount;
    private Timestamp billingDate;
    private Timestamp nextBillingDate;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getPlanName() {
        return planName;
    }

    public void setPlanName(String planName) {
        this.planName = planName;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Timestamp getBillingDate() {
        return billingDate;
    }

    public void setBillingDate(Timestamp billingDate) {
        this.billingDate = billingDate;
    }

    public Timestamp getNextBillingDate() {
        return nextBillingDate;
    }

    public void setNextBillingDate(Timestamp nextBillingDate) {
        this.nextBillingDate = nextBillingDate;
    }
}