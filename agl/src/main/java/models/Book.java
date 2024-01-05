package models;public class Book {
    private int id;
    private String title;
    private int year;
    private String type;
    private String publisher;
    private String author;
    private String shelf;
    private boolean available;

    // Getters and setters

    // Constructor
    public Book(int id, String title, int year, String type, String publisher, String author, String shelf, boolean available) {
        this.id = id;
        this.title = title;
        this.year = year;
        this.type = type;
        this.publisher = publisher;
        this.author = author;
        this.shelf = shelf;
        this.available = available;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getShelf() {
        return shelf;
    }

    public void setShelf(String shelf) {
        this.shelf = shelf;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }
}


