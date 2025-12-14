
package gui;

import java.awt.Component;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Image;

public class Logo extends Component {

    private Image logo;

    public Logo(Image logo) {
	this.logo = logo;
    }

    public void setImage(Image logo) {
	this.logo = logo;
	invalidate();
	repaint();
    }

    public Dimension getMinimumSize() {
	return getPreferredSize();
    }

    public Dimension getPreferredSize() {
	int width  = -1;
	int height = -1;
	boolean ready = false;

	while (!ready) {
	    width  = logo.getWidth(null);
	    height = logo.getHeight(null);
	    if(width != -1 && height != -1) {
		ready = true;
	    }
	    Thread.yield();
	}
	Dimension dim = new Dimension(width, height);

	return dim;
    }

    public void paint(Graphics g) {
	if(logo == null)
	    return;
	Dimension d = getSize();
	g.drawImage(logo, 0, 0, d.width, d.height, this);
    }

}
