/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class Product {
    private int ProductID;
    private String ProductName;
    private int CategoryID;
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
    private String Image;
    private Date PublishDate;
    private String PublishingLicense;
    private String Description;
    private boolean Discontinued;
    private double AverageRating;
    private int AvailableInStock;

    public Product() {
    }

    
    public Product(int ProductID, String ProductName, int CategoryID, int GenreID, double CoverPrice, double SalePrice, int AuthorID, String Translator, int PublisherID, int SupplierID, String Language, String Size, double Weight, int NumberOfPage, String Format, String Image, Date PublishDate, String PublishingLicense, String Description, boolean Discontinued) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.CategoryID = CategoryID;
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
    
    public Product(int ProductID, String ProductName, int CategoryID, int GenreID, double CoverPrice, double SalePrice, int AuthorID, String Translator, int PublisherID, int SupplierID, String Language, String Size, double Weight, int NumberOfPage, String Format, String Image, Date PublishDate, String PublishingLicense, String Description, boolean Discontinued, double AverageRating, int AvailableInStock) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.CategoryID = CategoryID;
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
        this.AverageRating = AverageRating;
        this.AvailableInStock = AvailableInStock;
    }

    

    public int getAvailableInStock() {
        return AvailableInStock;
    }

    public void setAvailableInStock(int AvailableInStock) {
        this.AvailableInStock = AvailableInStock;
    }

    

    public double getAverageRating() {
        return AverageRating;
    }

    public void setAverageRating(int Rating) {
        this.AverageRating = Rating;
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

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
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

    public void setSupplierID(int ReleaseCompanyID) {
        this.SupplierID = ReleaseCompanyID;
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

    public void setNumberOfPage(int NumerOfPage) {
        this.NumberOfPage = NumerOfPage;
    }

    public String getFormat() {
        return Format;
    }

    public void setFormat(String Format) {
        this.Format = Format;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
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

    @Override
    public String toString() {
        return "Product{" + "ProductID=" + ProductID + ", ProductName=" + ProductName + ", CategoryID=" + CategoryID + ", GenreID=" + GenreID + ", CoverPrice=" + CoverPrice + ", SalePrice=" + SalePrice + ", AuthorID=" + AuthorID + ", Translator=" + Translator + ", PublisherID=" + PublisherID + ", ReleaseCompanyID=" + SupplierID + ", Language=" + Language + ", Size=" + Size + ", Weight=" + Weight + ", NumerOfPage=" + NumberOfPage + ", Format=" + Format + ", Image=" + Image + ", PublishDate=" + PublishDate + ", PublishingLicense=" + PublishingLicense + ", Description=" + Description + ", Discontinued=" + Discontinued + '}';
    }
    
}
