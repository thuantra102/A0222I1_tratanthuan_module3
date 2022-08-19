package Model;

public class Customer {
    private String name;
    private String birthDay;
    private String address;
    private String image;

    public Customer() {
    }

    public Customer(String name, String birthDay, String address, String image) {
        this.name = name;
        this.birthDay = birthDay;
        this.address = address;
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(String birthDay) {
        this.birthDay = birthDay;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
