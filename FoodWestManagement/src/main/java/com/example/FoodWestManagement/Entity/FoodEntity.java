package com.example.FoodWestManagement.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.JoinColumn;

@Entity
public class FoodEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;  // FoodEntity's unique id

    private String food_item;  // Name or type of food item

    private String Description;  // Description of the food item

    private String address;  // Address related to the food item

    private String name;  // Name related to the food item (e.g., restaurant or food service name)

    private String mobileno;  // Mobile number for contact

    private String photo;  // Photo URL or path

    private String date;  // Date related to the food item (e.g., availability date)

    // ManyToOne relationship with DonerEntity
    @ManyToOne
    @JoinColumn(name = "doner_id", referencedColumnName = "id")  // Explicitly define foreign key column (doner_id)
    private DonerEntity donerEntity;  // Reference to the associated DonerEntity

    // Getters and Setters for all fields

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFood_item() {
        return food_item;
    }

    public void setFood_item(String food_item) {
        this.food_item = food_item;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMobileno() {
        return mobileno;
    }

    public void setMobileno(String mobileno) {
        this.mobileno = mobileno;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public DonerEntity getDonerEntity() {
        return donerEntity;
    }

    public void setDonerEntity(DonerEntity donerEntity) {
        this.donerEntity = donerEntity;
    }

    @Override
    public String toString() {
        return "FoodEntity [id=" + id + ", food_item=" + food_item + ", Description=" + Description + ", address="
                + address + ", name=" + name + ", mobileno=" + mobileno + ", photo=" + photo + ", date=" + date
                + ", donerEntity=" + donerEntity + "]";
    }

    // Default constructor
    public FoodEntity() {
        super();
    }
}
