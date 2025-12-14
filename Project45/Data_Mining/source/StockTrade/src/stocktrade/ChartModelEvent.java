package stocktrade;

import java.util.EventObject;

public class ChartModelEvent extends EventObject
{

    public ChartModelEvent(Object source)
    {
        super(source);
        type = -12;
        firstSample = 0;
        lastSample = 0;
        series = -21;
    }

    public ChartModelEvent(Object source, int sample)
    {
        super(source);
        type = -12;
        firstSample = sample;
        lastSample = sample;
        series = -21;
    }

    public ChartModelEvent(Object source, int firstSample, int lastSample)
    {
        super(source);
        type = -12;
        this.firstSample = firstSample;
        this.lastSample = lastSample;
        series = -21;
    }

    public ChartModelEvent(Object source, int firstSample, int lastSample, int series)
    {
        super(source);
        type = -12;
        this.firstSample = firstSample;
        this.lastSample = lastSample;
        this.series = series;
    }

    public ChartModelEvent(Object source, int firstSample, int lastSample, int series, int type)
    {
        super(source);
        this.type = type;
        this.firstSample = firstSample;
        this.lastSample = lastSample;
        this.series = series;
    }

    public static final int INSERT = -11;
    public static final int UPDATE = -12;
    public static final int DELETE = -13;
    public static final int ALL_SERIES = -21;
    protected int type;
    protected int firstSample;
    protected int lastSample;
    protected int series;

}