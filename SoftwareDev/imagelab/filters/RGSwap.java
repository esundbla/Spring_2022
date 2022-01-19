package filters;
import imagelab.*;
/**
 * An imageLab filter that swaps the red and green values of each pixel.
 */
public class RGSwap implements ImageFilter {

	ImgProvider filteredImage;
    
    /**
     * The filter itself.
     * @param ip the image to be filtered.
     */
    public void filter (ImgProvider ip) {
    	short[][] red = ip.getRed();
    	short[][] green = ip.getGreen();
    
    	filteredImage = new ImgProvider();
    	filteredImage.setColors(green, red, ip.getBlue(), ip.getAlpha());
    	filteredImage.showPix("Red <=> Green");
    }//filter
    
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
    	return "Red-Green Swap";
    } //getMenuLabel

}
