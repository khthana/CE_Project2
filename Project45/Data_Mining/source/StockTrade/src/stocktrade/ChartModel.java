package stocktrade;

import java.util.Vector;

// Referenced classes of package com.settrade.chart:
//            ChartModelListener

public interface ChartModel
{

    public abstract void addChartModelListener(ChartModelListener chartmodellistener);

    public abstract void removeChartModelListener(ChartModelListener chartmodellistener);

    public abstract Number getValueAt(int i, int j);

    public abstract void setValueAt(Number number, int i, int j);

    public abstract int getSampleCount();

    public abstract int getSeriesCount();

    public abstract Class getSeriesClass(int i);

    public abstract String getSeriesName(int i);

    public abstract Object getCategoryAt(int i);

    public abstract void setCategories(Vector vector);

    public abstract int getCategoryScaleType();

    public abstract void setCategoryScaleType(int i);

    public static final int AUTO_SCALE = 0;
    public static final int CATEGORY_SCALE = 1;
    public static final int TIME_SCALE = 2;

}