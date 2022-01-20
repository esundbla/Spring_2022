package filters;

import imagelab.ImgProvider;

public class Color_Isolation {
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
        return "Color_Isolation";
    } //getMenuLabel
}
