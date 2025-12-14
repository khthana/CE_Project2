package stocktrade;

import java.awt.*;

class HeaderChart extends Component
{

    HeaderChart(int i, int j, Image image, String s)
    {
        img = null;
        title = "";
        dPrefer = new Dimension(i, j);
        img = image;
        title = s;
    }

    public Dimension getMinimumSize()
    {
        return dPrefer;
    }

    public Dimension getPreferredSize()
    {
        return dPrefer;
    }

    public Dimension getMaximumSize()
    {
        return dPrefer;
    }

    public void paint(Graphics g)
    {
        g.drawImage(img, 0, 0, dPrefer.width, dPrefer.height, this);
        g.setColor(Color.white);
        g.setFont(getFont());
        g.drawString(title, 31, 15);
    }

    Image img;
    String title;
    Dimension dPrefer;
}