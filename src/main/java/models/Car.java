package models;

/**
 * Created by NotePad on 23.06.2016.
 */
public class Car {
    private int id;
    private String firstName, lastName;

    public Car(int id, String firstName, String lastName) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    @Override
    public String toString() {
        return String.format(
                "Customer[id=%d, firstName='%s', lastName='%s']",
                id, firstName, lastName);
    }
}
