package stocktrade;

import java.util.EventListener;

// Referenced classes of package com.settrade.chart:
//            ChartModelEvent

public interface ChartModelListener
    extends EventListener
{

    public abstract void chartChanged(ChartModelEvent chartmodelevent);
}