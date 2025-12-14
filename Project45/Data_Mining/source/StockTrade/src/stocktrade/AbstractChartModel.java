package stocktrade;

import java.util.Enumeration;
import java.util.Vector;

// Referenced classes of package com.settrade.chart:
//            ChartModelEvent, ChartModelListener, ChartModel

public abstract class AbstractChartModel
    implements ChartModel
{

    public AbstractChartModel()
    {
        categoryScaleType = 0;
        vListener = new Vector();
    }

    public void addChartModelListener(ChartModelListener l)
    {
        if(!vListener.contains(l))
            vListener.addElement(l);
    }

    public void removeChartModelListener(ChartModelListener l)
    {
        vListener.remove(l);
    }

    public void fireChartDataChanged()
    {
        ChartModelEvent chartEvent = new ChartModelEvent(this);
        for(Enumeration enum = vListener.elements(); enum.hasMoreElements();)
            try
            {
                ChartModelListener listen = (ChartModelListener)enum.nextElement();
                listen.chartChanged(chartEvent);
            }
            catch(Exception exception) { }

    }

    public void fireChartDataAdded(int sample)
    {
        ChartModelEvent chartEvent = new ChartModelEvent(this, sample);
        for(Enumeration enum = vListener.elements(); enum.hasMoreElements();)
            try
            {
                ChartModelListener listen = (ChartModelListener)enum.nextElement();
                listen.chartChanged(chartEvent);
            }
            catch(Exception exception) { }

    }

    public abstract Number getValueAt(int i, int j);

    public void setValueAt(Number number, int i, int j)
    {
    }

    public abstract int getSeriesCount();

    public abstract int getSampleCount();

    public Class getSeriesClass(int seriesIndex)
    {
        return getValueAt(0, seriesIndex).getClass();
    }

    public String getSeriesName(int seriesIndex)
    {
        return "Series".concat(String.valueOf(String.valueOf(Integer.toString(seriesIndex))));
    }

    public Object getCategoryAt(int sampleIndex)
    {
        return Integer.toString(sampleIndex);
    }

    public void setCategories(Vector vector)
    {
    }

    public int getCategoryScaleType()
    {
        return categoryScaleType;
    }

    public void setCategoryScaleType(int categoryScaleType)
    {
        this.categoryScaleType = categoryScaleType;
    }

    protected int categoryScaleType;
    protected Vector vListener;
}