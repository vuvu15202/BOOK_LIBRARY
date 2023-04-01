/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.sql.Date;

/**
 *
 * @author ASUS
 */
public class Product_Manage {
    private int ProductID;
    private String ProductName;
    private Category category ;
    private int GenreID;
    private double CoverPrice;
    private double SalePrice;
    private int AuthorID;
    private String Translator;
    private int PublisherID;
    private int SupplierID;
    private String Language;
    private String Size;
    private double Weight;
    private int NumberOfPage;
    private String Format;
    private int Image;
    private Date PublishDate;
    private String PublishingLicense;
    private String Description;
    private boolean Discontinued;

    public Product_Manage(int ProductID, String ProductName, Category category, int GenreID, double CoverPrice, double SalePrice, int AuthorID, String Translator, int PublisherID, int SupplierID, String Language, String Size, double Weight, int NumberOfPage, String Format, int Image, Date PublishDate, String PublishingLicense, String Description, boolean Discontinued) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.category = category;
        this.GenreID = GenreID;
        this.CoverPrice = CoverPrice;
        this.SalePrice = SalePrice;
        this.AuthorID = AuthorID;
        this.Translator = Translator;
        this.PublisherID = PublisherID;
        this.SupplierID = SupplierID;
        this.Language = Language;
        this.Size = Size;
        this.Weight = Weight;
        this.NumberOfPage = NumberOfPage;
        this.Format = Format;
        this.Image = Image;
        this.PublishDate = PublishDate;
        this.PublishingLicense = PublishingLicense;
        this.Description = Description;
        this.Discontinued = Discontinued;
    }

    public Product_Manage() {
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public int getGenreID() {
        return GenreID;
    }

    public void setGenreID(int GenreID) {
        this.GenreID = GenreID;
    }

    public double getCoverPrice() {
        return CoverPrice;
    }

    public void setCoverPrice(double CoverPrice) {
        this.CoverPrice = CoverPrice;
    }

    public double getSalePrice() {
        return SalePrice;
    }

    public void setSalePrice(double SalePrice) {
        this.SalePrice = SalePrice;
    }

    public int getAuthorID() {
        return AuthorID;
    }

    public void setAuthorID(int AuthorID) {
        this.AuthorID = AuthorID;
    }

    public String getTranslator() {
        return Translator;
    }

    public void setTranslator(String Translator) {
        this.Translator = Translator;
    }

    public int getPublisherID() {
        return PublisherID;
    }

    public void setPublisherID(int PublisherID) {
        this.PublisherID = PublisherID;
    }

    public int getSupplierID() {
        return SupplierID;
    }

    public void setSupplierID(int SupplierID) {
        this.SupplierID = SupplierID;
    }

    public String getLanguage() {
        return Language;
    }

    public void setLanguage(String Language) {
        this.Language = Language;
    }

    public String getSize() {
        return Size;
    }

    public void setSize(String Size) {
        this.Size = Size;
    }

    public double getWeight() {
        return Weight;
    }

    public void setWeight(double Weight) {
        this.Weight = Weight;
    }

    public int getNumberOfPage() {
        return NumberOfPage;
    }

    public void setNumberOfPage(int NumberOfPage) {
        this.NumberOfPage = NumberOfPage;
    }

    public String getFormat() {
        return Format;
    }

    public void setFormat(String Format) {
        this.Format = Format;
    }

    public int getImage() {
        return Image;
    }

    public void setImage(int Image) {
        this.Image = Image;
    }

    public Date getPublishDate() {
        return PublishDate;
    }

    public void setPublishDate(Date PublishDate) {
        this.PublishDate = PublishDate;
    }

    public String getPublishingLicense() {
        return PublishingLicense;
    }

    public void setPublishingLicense(String PublishingLicense) {
        this.PublishingLicense = PublishingLicense;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public boolean isDiscontinued() {
        return Discontinued;
    }

    public void setDiscontinued(boolean Discontinued) {
        this.Discontinued = Discontinued;
    }
    
   

   
    
}
