using System;
using System.Collections.Generic;
using System.Collections;
using System.Text;

namespace W
{
    public class ObjectFormSetting
    {
        public ArrayList settings;
        public Array a;
        public ObjectFormSetting()
        {
            settings = new ArrayList();
            settings.Add("None");
            settings.Add(new Point.PointSetting());
            settings.Add(new Line.LineSetting());
            settings.Add(new Polygon.PolygonSetting());
            settings.Add(new Rectangle.RectangleSetting());
            settings.Add(new Circle.CircleSetting());
            settings.Add(new Text.TextSetting());
            settings.Add(new Rubber.RubberSetting());
            settings.Add(new Image.ImageSetting());
        }
    }
}
