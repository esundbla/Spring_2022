package filters;
import java.util.*;

import imagelab.ImageFilter;
import imagelab.ImgProvider;

public class Color_Isolation implements ImageFilter {
   
    /**
     * The filtered image.
     */
    private ImgProvider filteredImage;

    /**
     * The filter itself.
     *
     * @param ip the image to be filtered.
     */
    public void filter(final ImgProvider ip){
        short[][] red = ip.getRed();
        short[][] green = ip.getGreen();
        short[][] blue = ip.getBlue();
        short[][] blank = blue;
        short zed = 0;

        for(int i =0; i< blank.length; i++){
          for(int r=0; r< blank[i].length; r++){
            blank[i][r] = zed;
          }
        }

        filteredImage.setColors(blank, green, blue, ip.getAlpha());
        filteredImage.showPix("No red");

        filteredImage.setColors(red, blank, blue, ip.getAlpha());
        filteredImage.showPix("No green");

        filteredImage.setColors(red, green, blank, ip.getAlpha());
        filteredImage.showPix("No blue");



    }


    /**
     * Retrieve the filtered image.
     * @return the filtered image.
     */
    public ImgProvider getImgProvider() {
        return filteredImage;
    }//getImgProvider

    /**
     * Retrieve the name of the filter to add to the menu.
     * @return the filter's menu item label
     */
    public String getMenuLabel() {
        return "Color_Iso";
    } //getMenuLabel
}
