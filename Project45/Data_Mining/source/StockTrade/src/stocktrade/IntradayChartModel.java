package stocktrade;

import java.util.Calendar;
import java.util.Date;

// Referenced classes of package com.settrade.chart:
//            AbstractChartModel

public class IntradayChartModel extends AbstractChartModel
{

    public IntradayChartModel()
    {
        sampleCount = 480;
        seriesCount = 3;
        categoryLabels = new String[sampleCount];
        lasts = new Double[sampleCount];
        volumes = new Integer[sampleCount];
        prevClose = null;
        for(int i = 0; i < sampleCount; i++)
            categoryLabels[i] = Integer.toString(i);

    }

    public void setPreviousClose(double close)
    {
        prevClose = new Double(close);
        fireChartDataChanged();
    }

    public double getPreviousClose()
    {
        return prevClose.doubleValue();
    }

    public void setPoint(Date dTime, double last, int volume)
    {
        int sampleIndex = 0;
        Calendar cTime = Calendar.getInstance();
        cTime.set(11, 9);
        cTime.set(12, 0);
        cTime.set(13, 0);
        setValueAt(new Double(last), sampleIndex, 1);
        setValueAt(new Integer(volume), sampleIndex, 2);
    }

    public void setPoint(int hour, int minute, double last, int volume)
    {
        int sampleIndex = 0;
        sampleIndex = (hour - 9) * 60 + minute;
        setValueAt(new Double(last), sampleIndex, 1);
        setValueAt(new Integer(volume), sampleIndex, 2);
    }

    public Number getValueAt(int sampleIndex, int seriesIndex)
    {
        try
        {
            if(seriesIndex == 0)
            {
                Double double1 = prevClose;
                return double1;
            }
            if(seriesIndex == 1)
            {
                Double double2 = lasts[sampleIndex];
                return double2;
            }
            if(seriesIndex == 2)
            {
                Integer integer = volumes[sampleIndex];
                return integer;
            } else
            {
                Number number = null;
                return number;
            }
        }
        catch(ArrayIndexOutOfBoundsException e)
        {
            Number number1 = null;
            return number1;
        }
    }

    public void setValueAt(Number aValue, int sampleIndex, int seriesIndex)
    {
        try
        {
            if(seriesIndex == 0)
                prevClose = (Double)aValue;
            else
            if(seriesIndex == 1)
                lasts[sampleIndex] = (Double)aValue;
            else
            if(seriesIndex == 2)
                volumes[sampleIndex] = (Integer)aValue;
        }
        catch(ArrayIndexOutOfBoundsException arrayindexoutofboundsexception) { }
        catch(ClassCastException classcastexception) { }
    }

    public int getSeriesCount()
    {
        return seriesCount;
    }

    public int getSampleCount()
    {
        return sampleCount;
    }

    public static final int START_HOUR = 9;
    public static final int STOP_HOUR = 17;
    private int sampleCount;
    private int seriesCount;
    private String categoryLabels[];
    private Double lasts[];
    private Integer volumes[];
    private Double prevClose;

}