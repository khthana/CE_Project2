
namespace W
{
    #region Flags
    public enum QueryPluginsFlags
    {
        Single,
        All,
    }

    public enum UnPluginsFlags
    {
        Single,
        All,
    }
 
    
    #endregion
    #region Drawing
    public enum UpDowns : byte
    {
        Neutral,
        Up,
        Down,
    }
    public enum States : uint
    {
        First,
        Start,
        One,
        Two,     
        Three,
        Four,
        Five,
        Six,
        Seven,
        Eight,
        Nine,
        Final,
        Extra,
        Skip,
    }
    enum Basic2DObjects : int
    {
        None = 0,
        Point = 1,
        Line = 2,
        Polygon = 3,
        Rectangle = 4,
        Circle = 5,
        Rubber = 7,
        Text = 6,
        Image = 8,
    }
    public enum LineModes: byte
    {
        Normal,
        Curve,
    }
    public enum DrawModes : byte
    {
        Fill,
        Draw,
    }
    #endregion
    #region Networking
    enum PTYPE : byte
    {
        Normal = 129,
        Begin = 111,
        End = 222,
        Alive = 88,
        Update = 77,
        Nothing = 202,
        Quit = 200,
    }
    public enum FTYPE : byte
    {
        PTYPE = 24,
        DRAW = 8,
        PLUGIN = 33,
    }
    public enum CMD : byte
    {
        Circle,
        Rectangle,
        Line,
        Text,
        Point,
        Polygon,
        Others,
        Rubber,
        Image,
    }
    enum NW : byte
    {
        id = 0xbe,
        pad = 0xcc,
        end = 0xed,
    }
    #endregion
}
