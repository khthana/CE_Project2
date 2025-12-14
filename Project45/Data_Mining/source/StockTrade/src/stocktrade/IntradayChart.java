package stocktrade;

import java.awt.*;
import java.awt.event.*;
import java.text.NumberFormat;
import java.util.Vector;

// Referenced classes of package com.settrade.chart:
//            ToolTipLabel, DefaultChartModel, DefaultChartSeriesModel, ChartModelListener,
//            ChartModel, ChartModelEvent, ChartSeriesModel

public class IntradayChart extends Container
    implements ChartModelListener, MouseListener, MouseMotionListener {

    private static final double arrPrice[] = {
        20D, 50D, 100D, 200D, 700D, 800D, 900D, 1000D, 2000D, 2500D
    };
    private static final double arrRange[] = {
        0.40000000000000002D, 1.0D, 2D, 4D, 8D, 16D, 24D, 40D, 80D, 100D
    };
    private static final double arrGap[] = {
        0.10000000000000001D, 0.25D, 0.5D, 1.0D, 2D, 4D, 6D, 10D, 20D, 25D
    };
    public static final int AUTO_RESIZE_OFF = 0;
    public static final int AUTO_RESIZE_X_AXIS = 1;
    public static final int AUTO_RESIZE_Y_AXIS = 2;
    public static final int AUTO_RESIZE_BOTH = 3;
    public static final int OVERLAY_MODE = 0;
    public static final int SEPERATED_MODE = 1;
    public static final int INDEX = 0;
    public static final int STOCK = 1;
    protected ChartModel dataModel;
    protected int chartType;
    protected int autoResizeMode;
    protected int drawMode;
    private boolean bBackgroundImage;
    private Image backgroundImage;
    private double prevClose;
    private double lastLow;
    private double lastHigh;
    private double lastMin;
    private double lastMax;
    private double lastRange;
    private double lastGap;
    private double lastPrice;
    private int volumeMax;
    private int volume;
    private int drawWidth;
    private int drawHeight;
    private Image img;
    private int topMargin;
    private int leftMargin;
    private int rightMargin;
    private int bottomMargin;
    private double priceRatio;
    private double volumeRatio;
    private Color borderDrawAreaColor;
    private Color backgroundDrawAreaColor;
    private Color gridColor;
    private Color prevCloseColor;
    private Color priceColor;
    private Color volumeColor;
    private Color labelColor;
    private FontMetrics fmLabel;
    private NumberFormat nfPrice;
    private int volumeWidth;
    private Dimension dPrefer;
    ToolTipLabel pLabel;

    public IntradayChart() {
        this(320, 200);
    }

    public IntradayChart(int w, int h) {
        dataModel = null;
        chartType = 0;
        autoResizeMode = 3;
        drawMode = 0;
        bBackgroundImage = false;
        backgroundImage = null;
        prevClose = 0.0D;
        lastLow = 1.7976931348623157E+308D;
        lastHigh = Double.MIN_VALUE;
        lastMin = 1.7976931348623157E+308D;
        lastMax = Double.MIN_VALUE;
        lastRange = 0.0D;
        lastGap = 0.0D;
        lastPrice = 0.0D;
        volumeMax = 0;
        volume = 0;
        drawWidth = 320;
        drawHeight = 200;
        img = null;
        topMargin = 10;
        leftMargin = 40;
        rightMargin = 40;
        bottomMargin = 20;
        priceRatio = 1.0D;
        volumeRatio = 0.25D;
        borderDrawAreaColor = Color.blue;
        backgroundDrawAreaColor = new Color(225, 225, 225);
        gridColor = Color.lightGray;
        prevCloseColor = Color.red.darker();
        priceColor = Color.red;
        volumeColor = Color.green;
        labelColor = Color.black;
        nfPrice = NumberFormat.getInstance();
        volumeWidth = 1;
        pLabel = new ToolTipLabel();
        dPrefer = new Dimension(w, h);
        setLayout(null);
        pLabel.setSize(110, 20);
        pLabel.setVisible(false);
        pLabel.setBackground(Color.white);
        add(pLabel);
        addMouseMotionListener(this);
        addMouseListener(this);
    }

    public Dimension getPreferredSize() {
        return dPrefer;
    }

    public void setAutoResizeMode(int mode) {
        autoResizeMode = mode;
    }

    public int getAutoResizeMode() {
        return autoResizeMode;
    }

    public void setDrawMode(int mode) {
        drawMode = mode;
    }

    public int getDrawMode() {
        return drawMode;
    }

    public void setBackgroundImage(Image bgImage) {
        bBackgroundImage = true;
        backgroundImage = bgImage;
    }

    public void setChartType(int type) {
        chartType = type;
        if(type == 1)
            pLabel.setSize(130, 20);
    }

    public Color getBackgroundDrawAreaColor() {
        return backgroundDrawAreaColor;
    }

    public void setBackgroundDrawAreaColor(Color BackgroundDrawAreaColor) {
        backgroundDrawAreaColor = BackgroundDrawAreaColor;
    }

    public Color getBorderDrawAreaColor() {
        return borderDrawAreaColor;
    }

    public void setBorderDrawAreaColor(Color borderDrawAreaColor) {
        this.borderDrawAreaColor = borderDrawAreaColor;
    }

    public Color getGridColor() {
        return gridColor;
    }

    public void setGridColor(Color gridColor) {
        this.gridColor = gridColor;
    }

    public Color getLabelColor() {
        return labelColor;
    }

    public void setLabelColor(Color labelColor) {
        this.labelColor = labelColor;
    }

    public Color getPrevCloseColor() {
        return prevCloseColor;
    }

    public void setPrevCloseColor(Color prevCloseColor) {
        this.prevCloseColor = prevCloseColor;
    }

    public Color getPriceColor() {
        return priceColor;
    }

    public void setPriceColor(Color priceColor) {
        this.priceColor = priceColor;
    }

    public Color getVolumeColor() {
        return volumeColor;
    }

    public void setVolumeColor(Color volumeColor) {
        this.volumeColor = volumeColor;
    }

    public int getTopMargin() {
        return topMargin;
    }

    public void setTopMargin(int topMargin) {
        this.topMargin = topMargin;
    }

    public int getBottomMargin() {
        return bottomMargin;
    }

    public void setBottomMargin(int bottomMargin) {
        this.bottomMargin = bottomMargin;
    }

    public int getLeftMargin() {
        return leftMargin;
    }

    public void setLeftMargin(int leftMargin) {
        this.leftMargin = leftMargin;
    }

    public int getRightMargin() {
        return rightMargin;
    }

    public void setRightMargin(int rightMargin) {
        this.rightMargin = rightMargin;
    }

    public int getVolumeWidth() {
        return volumeWidth;
    }

    public void setVolumeWidth(int volumeWidth) {
        this.volumeWidth = volumeWidth;
    }

    public double getVolumeRatio() {
        return volumeRatio;
    }

    public void setVolumeRatio(double ratio) {
        volumeRatio = ratio;
        priceRatio = (double)1 - volumeRatio;
    }

    private void getHighLow(int first, int last) {
        if(first == 0) {
            try {
                prevClose = dataModel.getValueAt(0, 0).doubleValue();
            }
            catch(Exception e) {
                prevClose = 0.0D;
            }
            lastLow = 1.7976931348623157E+308D;
            lastHigh = Double.MIN_VALUE;
            volumeMax = 0;
        }
        int stopPos = last != 0 ? last : dataModel.getSampleCount();
        for(int i = first; i < stopPos; i++) {
            try {
                lastPrice = dataModel.getValueAt(i, 1).doubleValue();
                if(lastPrice < lastLow)
                    lastLow = lastPrice;
                if(lastPrice > lastHigh)
                    lastHigh = lastPrice;
            }
            catch(Exception exception) { }
            try {
                volume = dataModel.getValueAt(i, 2).intValue();
                if(volume > volumeMax)
                    volumeMax = volume;
            }
            catch(Exception exception1) { }
        }

    }

    private void calculateRange() {
        if(volumeMax != 0) {
            int tmpVM = (int)Math.pow(10D, Integer.toString(volumeMax).length() - 1);
            volumeMax = (volumeMax / tmpVM + 1) * tmpVM;
        }
        lastHigh = Math.max(lastHigh, prevClose);
        lastLow = Math.min(lastLow, prevClose);
        if(lastHigh < lastLow) {
            lastMin = 0.0D;
            lastMax = 100D;
            lastGap = 25D;
            lastRange = 100D;
        } else
        if(lastHigh == lastLow) {
            try {
                int indexTmp;
                for(indexTmp = 0; lastHigh > arrPrice[indexTmp]; indexTmp++);
                lastRange = arrRange[indexTmp];
                lastGap = arrGap[indexTmp];
            }
            catch(ArrayIndexOutOfBoundsException e) {
                lastRange = arrRange[arrRange.length - 1];
                lastGap = arrGap[arrGap.length - 1];
            }
            lastMin = lastLow - lastGap - lastGap - lastLow % lastGap;
            lastMax = lastMin + lastRange;
        } else {
            int indexTmp = 0;
            try {
                do {
                    lastRange = arrRange[indexTmp];
                    lastGap = arrGap[indexTmp];
                    lastMax = (lastHigh + lastGap) - lastHigh % lastGap;
                    if(lastMax == lastHigh)
                        lastMax = lastMax + lastGap;
                    lastMin = lastMax - lastRange;
                    indexTmp++;
                } while(lastMin > lastLow);
            }
            catch(ArrayIndexOutOfBoundsException e) {
                lastRange = lastHigh - lastLow;
                lastGap = lastRange / (double)4;
                lastMax = lastHigh;
                lastMin = lastLow;
            }
        }
        if(lastMin < (double)0) {
            lastMax = lastMax - lastMin;
            lastMin = 0.0D;
        }
    }

    int sampleIndexToX(int sampleIndex, int width) {
        int partStartSampleArr[] = {
            0, 60, 210, 330, 480
        };
        int partSampleCountArr[] = {
            60, 150, 120, 150, 60
        };
        int partSizeArr[] = {
            3, 25, 2, 25, 5
        };
        int partStartSizeArr[] = {
            0, 3, 28, 30, 55
        };
        int numPart = 5;
        int totalPartSize = 60;
        int part = numPart;
        try {
            while(sampleIndex < partStartSampleArr[--part]) ;
        }
        catch(ArrayIndexOutOfBoundsException e) {
            part = 0;
        }
        double x = sampleIndex - partStartSampleArr[part];
        x *= partSizeArr[part];
        x /= partSampleCountArr[part];
        x += partStartSizeArr[part];
        x /= totalPartSize;
        x *= width;
        int x2 = (int)x;
        return x2;
    }

    int xToSampleIndex(int x, int width) {
        int partStartSampleArr[] = {
            0, 60, 210, 330, 480
        };
        int partSampleCountArr[] = {
            60, 150, 120, 150, 60
        };
        int partSizeArr[] = {
            3, 25, 2, 25, 5
        };
        int partStartSizeArr[] = {
            0, 3, 28, 30, 55
        };
        int numPart = 5;
        int totalPartSize = 60;
        int s = 0;
        double position = (x * totalPartSize) / width;
        int part = numPart;
        try {
            while(position < (double)partStartSizeArr[--part]) ;
        }
        catch(ArrayIndexOutOfBoundsException e) {
            part = 0;
        }
        position -= partStartSizeArr[part];
        position *= partSampleCountArr[part];
        position /= partSizeArr[part];
        position += partStartSampleArr[part];
        s = (int)position;
        return s;
    }

    public void paint(Graphics g) {
        if(img == null) {
            getHighLow(0, dataModel.getSampleCount());
            calculateRange();
            drawChartImage();
        } else
        if(drawWidth != getBounds().width || drawHeight != getBounds().height)
            drawChartImage();
        g.drawImage(img, 0, 0, this);
    }

    public Image getChartImage() {
        if(img == null) {
            getHighLow(0, dataModel.getSampleCount());
            calculateRange();
            drawChartImage();
        }
        return img;
    }

    public void drawChartImage() {
        int w = getBounds().width;
        int h = getBounds().height;
        drawWidth = w;
        drawHeight = h;
        if(w == 0 || h == 0) {
            w = 320;
            h = 200;
        }
        img = createImage(w, h);
        Graphics g = img.getGraphics();
        fmLabel = getFontMetrics(getFont());
        int wa = w - leftMargin - rightMargin;
        int ha = h - topMargin - bottomMargin;
        int hb = (int)((double)(h - topMargin - bottomMargin) * volumeRatio);
        if(drawMode == 1)
            ha = (int)((double)ha * priceRatio);
        if(w <= 0 || h <= 0)
            return;
        g.setColor(getBackground());
        g.fillRect(0, 0, w - 1, h - 1);
        g.setColor(getForeground());
//        g.drawRect(0, 0, w - 1, h - 1);
        if(wa <= 0 || ha <= 0)
            return;
        if(bBackgroundImage) {
            g.drawImage(backgroundImage, leftMargin, topMargin, wa - 1, ha - 1, this);
        } else {
            g.setColor(backgroundDrawAreaColor);
            g.fillRect(leftMargin, topMargin, wa - 1, ha - 1);
        }
        g.setColor(borderDrawAreaColor);
        g.drawRect(leftMargin, topMargin, wa - 1, ha - 1);
        g.setColor(gridColor);
        g.drawLine(leftMargin + 1, topMargin + ha / 4, w - 1 - rightMargin - 1, topMargin + ha / 4);
        g.drawLine(leftMargin + 1, topMargin + ha / 2, w - 1 - rightMargin - 1, topMargin + ha / 2);
        g.drawLine(leftMargin + 1, topMargin + (3 * ha) / 4, w - 1 - rightMargin - 1, topMargin + (3 * ha) / 4);
        g.drawLine(leftMargin + (3 * wa) / 60, topMargin + 1, leftMargin + (3 * wa) / 60, h - 1 - bottomMargin - 1);
        g.drawLine(leftMargin + (13 * wa) / 60, topMargin + 1, leftMargin + (13 * wa) / 60, h - 1 - bottomMargin - 1);
        g.drawLine(leftMargin + (23 * wa) / 60, topMargin + 1, leftMargin + (23 * wa) / 60, h - 1 - bottomMargin - 1);
        g.drawLine(leftMargin + (28 * wa) / 60, topMargin + 1, leftMargin + (28 * wa) / 60, h - 1 - bottomMargin - 1);
        g.drawLine(leftMargin + (30 * wa) / 60, topMargin + 1, leftMargin + (30 * wa) / 60, h - 1 - bottomMargin - 1);
        g.drawLine(leftMargin + (35 * wa) / 60, topMargin + 1, leftMargin + (35 * wa) / 60, h - 1 - bottomMargin - 1);
        g.drawLine(leftMargin + (45 * wa) / 60, topMargin + 1, leftMargin + (45 * wa) / 60, h - 1 - bottomMargin - 1);
        g.drawLine(leftMargin + (55 * wa) / 60, topMargin + 1, leftMargin + (55 * wa) / 60, h - 1 - bottomMargin - 1);
        g.setColor(labelColor);
        g.setFont(getFont());
        int wl = fmLabel.stringWidth("10:00");
        int hl = fmLabel.getAscent();
                g.drawString("Price (Bht.)", 5, topMargin - 4);
                g.drawString("Volume", wa - 9, topMargin - 4);
        g.drawString("10:00", (leftMargin + (3 * wa) / 60) - wl / 2, ((h - 1 - bottomMargin) + hl) - 1);
        g.drawString("11:00", (leftMargin + (13 * wa) / 60) - wl / 2, ((h - 1 - bottomMargin) + hl) - 1);
        g.drawString("12:00", (leftMargin + (23 * wa) / 60) - wl / 2, ((h - 1 - bottomMargin) + hl) - 1);
        g.drawString("15:00", (leftMargin + (35 * wa) / 60) - wl / 2, ((h - 1 - bottomMargin) + hl) - 1);
        g.drawString("16:00", (leftMargin + (45 * wa) / 60) - wl / 2, ((h - 1 - bottomMargin) + hl) - 1);
        g.drawString("17:00", (leftMargin + (55 * wa) / 60) - wl / 2, ((h - 1 - bottomMargin) + hl) - 1);
        int nDigits = lastGap >= (double)1 ? 0 : 2;
        nfPrice.setMinimumFractionDigits(nDigits);
        nfPrice.setMaximumFractionDigits(nDigits);
        wl = fmLabel.stringWidth(nfPrice.format(lastMax));
        g.drawString(nfPrice.format(lastMax), leftMargin - wl - 1, (topMargin + hl) - 2);
        g.drawString(nfPrice.format(lastMax - lastGap), leftMargin - wl - 1, (topMargin + ha / 4 + hl / 2) - 1);
        g.drawString(nfPrice.format(lastMin + lastGap * (double)2), leftMargin - wl - 1, (topMargin + (2 * ha) / 4 + hl / 2) - 1);
        g.drawString(nfPrice.format(lastMin + lastGap), leftMargin - wl - 1, (topMargin + (3 * ha) / 4 + hl / 2) - 1);
        g.drawString(nfPrice.format(lastMin), leftMargin - wl - 1, (topMargin + ha) - 1);
        if(volumeMax != 0) {
            String strVolume = "";
            if(volumeMax >= 0xf4240)
                strVolume = String.valueOf(String.valueOf(Integer.toString(volumeMax / 0xf4240))).concat("M");
            else
            if(volumeMax >= 1000)
                strVolume = String.valueOf(String.valueOf(Integer.toString(volumeMax / 1000))).concat("k");
            else
                strVolume = Integer.toString(volumeMax);
            g.drawString(strVolume, (w - rightMargin) + 1, (((topMargin + ha) - (int)(volumeRatio * (double)ha)) + hl / 2) - 1);
        }
        if(drawMode == 0)
            volumeMax = (int)((double)volumeMax / volumeRatio);
        int prevY = 0;
        if(prevClose > (double)0) {
            g.setColor(prevCloseColor);
            Double tmpD = new Double(((lastMax - prevClose) * (double)ha) / lastRange);
            prevY = topMargin + tmpD.intValue();
            int prevX = leftMargin + 1;
            int prevX2 = prevX + 5;
            for(int endPoint = w - 1 - rightMargin - 1 - (wa * 5) / 60; prevX < endPoint;) {
                if(prevX2 > endPoint)
                    prevX2 = endPoint;
                g.drawLine(prevX, prevY, prevX2, prevY);
                prevX += 8;
                prevX2 = prevX + 5;
            }

        }
        int posX = leftMargin;
        int posY = bottomMargin;
        int posX2 = leftMargin;
        int posY2 = bottomMargin;
        if(volumeMax != 0) {
            g.setColor(volumeColor);
            for(int i = 0; i < dataModel.getSampleCount(); i++) {
                posX = leftMargin + sampleIndexToX(i, wa);
                try {
                    int iV = dataModel.getValueAt(i, 2).intValue();
                    double tmpVY = iV;
                    tmpVY /= volumeMax;
                    tmpVY *= ha;
                    int volumeY = (int)tmpVY;
                    g.fillRect(posX, h - bottomMargin - 1 - volumeY, volumeWidth, volumeY);
                }
                catch(NullPointerException nullpointerexception) { }
            }

        }
        g.setColor(priceColor);
        int lastX = leftMargin;
        int lastY = prevY;
        for(int i = 0; i < dataModel.getSampleCount(); i++) {
            posX = leftMargin + sampleIndexToX(i, wa);
            try {
                double dL = dataModel.getValueAt(i, 1).doubleValue();
                Double tmpD = new Double(((lastMax - dL) * (double)ha) / lastRange);
                posY = topMargin + tmpD.intValue();
                g.drawLine(lastX, lastY, posX, posY);
                lastX = posX;
                lastY = posY;
            }
            catch(NullPointerException nullpointerexception1) { }
        }

    }

    public void resizeToFit(int i) {
    }

    protected void resizeAndRepaint() {
    }

    public void setModel(ChartModel dataModel) {
        try {
            this.dataModel.removeChartModelListener(this);
        }
        catch(NullPointerException nullpointerexception) { }
        this.dataModel = dataModel;
        this.dataModel.addChartModelListener(this);
    }

    public ChartModel getModel() {
        return dataModel;
    }

 //   protected ChartModel createDefaultDataModel() {
 //       return new DefaultChartModel();
 //   }

 //   protected ChartSeriesModel createDefaultSeriesModel() {
 //       return new DefaultChartSeriesModel();
 //   }

    public void chartChanged(ChartModelEvent e) {
        getHighLow(e.firstSample, e.lastSample);
        calculateRange();
        drawChartImage();
        repaint();
    }

    public void processMouseMotionEvent(MouseEvent evt) {
        if(evt.getID() == 503)
            try {
                int x = evt.getX();
                int y = evt.getY();
                int wa = getBounds().width - leftMargin - rightMargin;
                int sampleIndex = xToSampleIndex(x - leftMargin, wa);
                boolean bFound = false;
                Vector vT = new Vector();
                NumberFormat dF = NumberFormat.getInstance();
                dF.setMinimumIntegerDigits(2);
                NumberFormat pF = NumberFormat.getInstance();
                pF.setMaximumFractionDigits(2);
                pF.setMinimumFractionDigits(2);
                Vector vC = new Vector();
                do {
                    if(bFound)
                        break;
                    vT.removeAllElements();
                    vC.removeAllElements();
                    try {
                        String strDate = String.valueOf(String.valueOf((new StringBuffer(String.valueOf(String.valueOf(sampleIndex / 60 + 9)))).append(":").append(dF.format(sampleIndex % 60))));
                        vT.addElement(strDate);
                        vC.addElement(Color.black);
                        double p1 = dataModel.getValueAt(sampleIndex, 1).doubleValue();
                        double p2 = p1 - dataModel.getValueAt(0, 0).doubleValue();
                        String strP = pF.format(p1);
                        vT.addElement(strP);
                        vC.addElement(getPriceColor());
                        if(p2 > (double)0) {
                            String strC = "+".concat(String.valueOf(String.valueOf(pF.format(p2))));
                            vT.addElement(strC);
                            vC.addElement(Color.green);
                        } else
                        if(p2 == (double)0) {
                            String strC = pF.format(p2);
                            vT.addElement(strC);
                            vC.addElement(Color.orange.darker());
                        } else {
                            String strC = pF.format(p2);
                            vT.addElement(strC);
                            vC.addElement(Color.red);
                        }
                        if(chartType == 1) {
                            int v1 = 0;
                            for(int tmpSI = sampleIndex; (v1 = dataModel.getValueAt(tmpSI, 2).intValue()) == 0 && tmpSI != 0; tmpSI--);
                            String sV = "";
                            if(v1 > 0x989680)
                                sV = String.valueOf(String.valueOf(Integer.toString((v1 + 0x7a120) / 0xf4240))).concat("M");
                            else
                            if(v1 > 10000)
                                sV = String.valueOf(String.valueOf(Integer.toString((v1 + 500) / 1000))).concat("k");
                            else
                                sV = Integer.toString(v1);
                            vT.addElement(sV);
                            vC.addElement(getVolumeColor().darker());
                        }
                        pLabel.setTexts(vT, vC);
                        bFound = true;
                        continue;
                    }
                    catch(Exception ex) {
                        sampleIndex--;
                    }
                    if(sampleIndex >= 0)
                        continue;
                    vT.removeAllElements();
                    vC.removeAllElements();
                    String strDate = "Prv Cls";
                    vT.addElement(strDate);
                    vC.addElement(Color.black);
                    double p1 = dataModel.getValueAt(0, 0).doubleValue();
                    String strP = pF.format(p1);
                    vT.addElement(strP);
                    vC.addElement(getPrevCloseColor());
                    String strC = "(0.00)";
                    pLabel.setTexts(vT, vC);
                    break;
                } while(true);
                int ppx = x + 5;
                int ppy = y - 30;
                if(ppx < leftMargin)
                    ppx = leftMargin;
                if(ppy < topMargin)
                    ppy = topMargin;
                if(ppy > drawHeight - bottomMargin - pLabel.getBounds().height)
                    ppy = drawHeight - bottomMargin - pLabel.getBounds().height;
                if(ppx > drawWidth - rightMargin - pLabel.getBounds().width)
                    ppx = drawWidth - rightMargin - pLabel.getBounds().width;
                pLabel.setLocation(ppx, ppy);
            }
            catch(Exception exception) { }
    }

    public void mouseMoved(MouseEvent mouseevent) {
    }

    public void mouseDragged(MouseEvent mouseevent) {
    }

    public void mouseClicked(MouseEvent mouseevent) {
    }

    public void mouseEntered(MouseEvent evt) {
        if(!pLabel.isVisible())
            pLabel.setVisible(true);
    }

    public void mouseExited(MouseEvent evt) {
        if(pLabel.isVisible())
            pLabel.setVisible(false);
    }

    public void mousePressed(MouseEvent mouseevent) {
    }

    public void mouseReleased(MouseEvent mouseevent) {
    }

//    static  {
//        AUTO_RESIZE_OFF = 0;
//        AUTO_RESIZE_X_AXIS = 1;
//        AUTO_RESIZE_Y_AXIS = 2;
//        AUTO_RESIZE_BOTH = 3;
//        OVERLAY_MODE = 0;
//        SEPERATED_MODE = 1;
//        INDEX = 0;
//        STOCK = 1;
//    }
}
