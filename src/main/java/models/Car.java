package models;

/**
 * Created by Siarhei Baltrukevich on 26.06.2016.
 */
public class Car {
    private int id, year, price, odo, view;
    private String brand, model, transmition, color, frame, engine, agregate;
    private String img1, img2, img3;
    private boolean conditioner, skin, castDisk;

    public Car() {
    }

    public Car(int id, int year, int price, int odo, int view, String brand, String model, String transmition,
               String color, String frame, String engine, String agregate, String img1, String img2, String img3,
               boolean conditioner, boolean skin, boolean castDisk) {
        this.id = id;
        this.year = year;
        this.price = price;
        this.odo = odo;
        this.view = view;
        this.brand = brand;
        this.model = model;
        this.transmition = transmition;
        this.color = color;
        this.frame = frame;
        this.engine = engine;
        this.agregate = agregate;
        this.img1 = img1;
        this.img2 = img2;
        this.img3 = img3;
        this.conditioner = conditioner;
        this.skin = skin;
        this.castDisk = castDisk;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getOdo() {
        return odo;
    }

    public void setOdo(int odo) {
        this.odo = odo;
    }

    public int getView() {
        return view;
    }

    public void setView(int view) {
        this.view = view;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getTransmition() {
        return transmition;
    }

    public void setTransmition(String transmition) {
        this.transmition = transmition;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getFrame() {
        return frame;
    }

    public void setFrame(String frame) {
        this.frame = frame;
    }

    public String getEngine() {
        return engine;
    }

    public void setEngine(String engine) {
        this.engine = engine;
    }

    public String getAgregate() {
        return agregate;
    }

    public void setAgregate(String agregate) {
        this.agregate = agregate;
    }

    public String getImg1() {
        return img1;
    }

    public void setImg1(String img1) {
        this.img1 = img1;
    }

    public String getImg2() {
        return img2;
    }

    public void setImg2(String img2) {
        this.img2 = img2;
    }

    public String getImg3() {
        return img3;
    }

    public void setImg3(String img3) {
        this.img3 = img3;
    }

    public boolean hasConditioner() {
        return conditioner;
    }

    public void setConditioner(boolean conditioner) {
        this.conditioner = conditioner;
    }

    public boolean hasSkin() {
        return skin;
    }

    public void setSkin(boolean skin) {
        this.skin = skin;
    }

    public boolean hasCastDisk() {
        return castDisk;
    }

    public void setCastDisk(boolean castDisk) {
        this.castDisk = castDisk;
    }

    @Override
    public String toString() {
        return "Car{" +
                "id=" + id +
                ", year=" + year +
                ", price=" + price +
                ", odo=" + odo +
                ", view=" + view +
                ", brand='" + brand + '\'' +
                ", model='" + model + '\'' +
                ", transmition='" + transmition + '\'' +
                ", color='" + color + '\'' +
                ", frame='" + frame + '\'' +
                ", engine='" + engine + '\'' +
                ", agregate='" + agregate + '\'' +
                ", img1='" + img1 + '\'' +
                ", img2='" + img2 + '\'' +
                ", img3='" + img3 + '\'' +
                ", conditioner=" + conditioner +
                ", skin=" + skin +
                ", castDisk=" + castDisk +
                '}';
    }
}
