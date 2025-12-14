using System;
using System.Collections.Generic;
using System.Text;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;

namespace Imager
{
    class Imager
    {
        public static Image CreateImage(string fname)
        {
            Image img = Image.FromFile(fname);
            return img;
        }
        public static Image CvByteArrayToImage(Byte[] myByteArray)
        {
            System.Drawing.Image newImage;
            using (MemoryStream ms = new MemoryStream(myByteArray, 0, myByteArray.Length))
            {
                ms.Write(myByteArray, 0, myByteArray.Length);
                newImage = Image.FromStream(ms, true);
            }
            return newImage;
        }
        public static byte[] CvImageToByteArray(System.Drawing.Image imageToConvert)
        {
            byte[] Ret;
            try
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    imageToConvert.Save(ms,ImageFormat.Jpeg);
                    Ret = ms.ToArray();
                }
            }
            catch (Exception)
            {
                throw;
            }
            return Ret;
        }
        
        
        /*public static Image t(Image img)
        {
            byte[] bytes = Imager.ConvertImageToByteArray(img);
            byte[] rbytes = new byte[bytes.Length];
            byte[] data = new byte[64000];
            MemoryStream rm = new MemoryStream(rbytes, true);
            MemoryStream m = new MemoryStream(bytes, false);
            do
            {
                int recv = m.Read(data, 0, 64000);
                rm.Write(data, 0, recv);
            }
            while (m.Length != m.Position);

            return Imager.ConvertByteArrayToImage(rbytes);

        }*/
    }
}
