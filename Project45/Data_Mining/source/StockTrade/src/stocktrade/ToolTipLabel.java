package stocktrade;

import java.awt.*;
import java.util.Vector;

public class ToolTipLabel extends Canvas
{

    public ToolTipLabel()
    {
        borderColor = Color.black;
        fontmt = getFontMetrics(new Font("Helvetica", 0, 10));
        toolTipSize = null;
        baseLine = fontmt.getHeight();
        currentPoint = 0;
        text = null;
        listSize = 0;
        image = null;
        iG = null;
    }

    public void paint(Graphics g)
    {
        if(image != null)
            g.drawImage(image, 0, 0, null);
    }

    public void setBorderColor(Color borderColor)
    {
        this.borderColor = borderColor;
    }

    public void setFont(Font font)
    {
        super.setFont(font);
        fontmt = getFontMetrics(font);
        baseLine = fontmt.getHeight();
    }

    public void setTexts(Vector textList, Vector colorList)
    {
        currentPoint = fontmt.stringWidth(" ");
        listSize = textList.size();
        if(listSize > 1)
        {
            toolTipSize = getSize();
            image = createImage(toolTipSize.width, toolTipSize.height);
            iG = image.getGraphics();
            iG.setColor(borderColor);
            iG.drawRect(0, 0, toolTipSize.width - 1, toolTipSize.height - 1);
            text = textList.elementAt(0).toString();
            iG.setColor((Color)colorList.elementAt(0));
            iG.drawString(text, currentPoint, baseLine);
            currentPoint += fontmt.stringWidth(text);
            iG.drawString(": ", currentPoint, baseLine);
            currentPoint += fontmt.stringWidth(": ");
            for(int i = 1; i < listSize; i++)
            {
                text = textList.elementAt(i).toString();
                iG.setColor((Color)colorList.elementAt(i));
                iG.drawString(text, currentPoint, baseLine);
                currentPoint += fontmt.stringWidth(text);
                if(i != listSize - 1)
                {
                    iG.setColor(Color.black);
                    iG.drawString(", ", currentPoint, baseLine);
                    currentPoint += fontmt.stringWidth(", ");
                }
            }

        }
        repaint();
    }

    private Color borderColor;
    private FontMetrics fontmt;
    private Dimension toolTipSize;
    private int baseLine;
    private int currentPoint;
    private String text;
    private int listSize;
    private Image image;
    private Graphics iG;
}