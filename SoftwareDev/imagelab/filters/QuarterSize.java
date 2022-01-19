package filters;
import imagelab.*;
/**
 * An imageLab filter that shrinks the image.
 * @author Dr. Jody Paul
 */
public class QuarterSize implements ImageFilter {
    
    ImgProvider filteredImage;
    
    /**
     * The filter itself.
     * @param ip the image to be filtered.
     */
    public void filter (ImgProvider ip) {
        int tmp;
        short[][] red = ip.getRed();     // Red plane
        short[][] green = ip.getGreen(); // Green plane
        short[][] blue = ip.getBlue();   // Blue plane
        short[][] alpha = ip.getAlpha(); // Alpha channel
    
        int height = red.length;
        int width  = red[0].length;

        if (height < 2 || width < 2) {
            filteredImage = new ImgProvider();
            filteredImage.setColors(red, green, blue, alpha);
            filteredImage.showPix("1 Pixel - Can go no smaller!");
            return;
        }

        int newHeight = height / 2;
        int newWidth  = width / 2;
    
        short[][] newRed = new short[newHeight][newWidth];     // Red plane
        short[][] newGreen = new short[newHeight][newWidth]; // Green plane
        short[][] newBlue = new short[newHeight][newWidth];   // Blue plane
        short[][] newAlpha = new short[newHeight][newWidth]; // Alpha channel
    
    
       //System.out.println("Filtering image number " + ip.getid());
        
        for (int row = 0; row < newHeight; row++) {
            for (int column=0; column < newWidth; column++) {
                tmp =   (red[row*2][column*2]
                        +red[row*2+1][column*2]
                        +red[row*2][column*2+1]
                        +red[row*2+1][column*2+1])/4;
                newRed[row][column] = (short)tmp;
                tmp =   (green[row*2][column*2]
                        +green[row*2+1][column*2]
                        +green[row*2][column*2+1]
                        +green[row*2+1][column*2+1])/4;
                newGreen[row][column] = (short)tmp;
                tmp =   (blue[row*2][column*2]
                        +blue[row*2+1][column*2]
                        +blue[row*2][column*2+1]
                        +blue[row*2+1][column*2+1])/4;
                newBlue[row][column] = (short)tmp;
                tmp =   (alpha[row*2][column*2]
                        +alpha[row*2+1][column*2]
                        +alpha[row*2][column*2+1]
                        +alpha[row*2+1][column*2+1])/4;
                newAlpha[row][column] = (short)tmp;
            }//for column
        }//for row
    
        filteredImage = new ImgProvider();
        filteredImage.setColors(newRed, newGreen, newBlue, newAlpha);
        filteredImage.showPix("QuarterSize");
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
        return "QuarterSize";
    } //getMenuLabel
    
}
