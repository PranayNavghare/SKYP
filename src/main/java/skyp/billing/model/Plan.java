package skyp.billing.model;

public class Plan {
    private int id;
    private String name;
    private double price;
    private int storageLimit; // in MB
    private int websiteLimit;
    private String description;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStorageLimit() {
        return storageLimit;
    }

    public void setStorageLimit(int storageLimit) {
        this.storageLimit = storageLimit;
    }

    public int getWebsiteLimit() {
        return websiteLimit;
    }

    public void setWebsiteLimit(int websiteLimit) {
        this.websiteLimit = websiteLimit;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}