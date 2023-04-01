/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author user
 */
public class Genre {
    private int GenreID;
    private String GenreName;

    public Genre(int GenreID, String GenreName) {
        this.GenreID = GenreID;
        this.GenreName = GenreName;
    }

    public Genre() {
    }
    

    public int getGenreID() {
        return GenreID;
    }

    public void setGenreID(int GenreID) {
        this.GenreID = GenreID;
    }

    public String getGenreName() {
        return GenreName;
    }

    public void setGenreName(String GenreName) {
        this.GenreName = GenreName;
    }

    @Override
    public String toString() {
        return "Genre{" + "GenreID=" + GenreID + ", GenreName=" + GenreName + '}';
    }
    
    
}
