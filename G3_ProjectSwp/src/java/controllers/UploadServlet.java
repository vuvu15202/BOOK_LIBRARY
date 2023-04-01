
package controllers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@MultipartConfig
@WebServlet(name = "UploadServlet", urlPatterns = {"/UploadServlet"})
public class UploadServlet extends HttpServlet {

     private static final long serialVersionUID = 1L;
    
    private static final String UPLOAD_DIR = "uploads";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //fetch form data
            
            Part filePart  = request.getPart("file");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        
        // Set the destination directory for the uploaded file
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        
        // Copy the file to the destination directory
        InputStream inputStream = filePart.getInputStream();
            Files.copy(inputStream, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);
        
        // Show a message to the user
        response.getWriter().println("Image uploaded successfully!");
            
           
        }
    }
    
    public boolean uploadFile(InputStream is, String path){
        boolean test = false;
        try{
            byte[] byt = new byte[is.available()];
            is.read();
            
            FileOutputStream fops = new FileOutputStream(path);
            fops.write(byt);
            fops.flush();
            fops.close();
            
            test = true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return test;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    // </editor-fold>

}
