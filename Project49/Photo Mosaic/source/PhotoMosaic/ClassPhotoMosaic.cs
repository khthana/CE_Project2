using System;
using System.Collections.Generic;
using System.Text;
using System.Drawing;
using System.Collections;
using System.Windows.Forms;

namespace PhotoMosaic
{
    class ClassPhotoMosaic {
        public void InitialArrayValue(Double[,] array, int value)
        {
            for (int i = 0; i < array.GetLength(0); i++)
                for (int j = 0; j < array.GetLength(1); j++)
                {
                    array[i, j] = value;
                }
        }
        public void InitialArrayValueInt(int[,] array, int value)
        {
            for (int i = 0; i < array.GetLength(0); i++)
                for (int j = 0; j < array.GetLength(1); j++)
                {
                    array[i, j] = value;
                }
        }
        //function for find best cell photo in same vecter in RGB
        //return array [bestCellPhoto, diffR, diffG, diffB]
        //or -1 of cell photo if there are no match
        public int[] ChangeColorSameVector(Bitmap picMain, ArrayList picElement, int inScope, int outScope)
        {
            if (inScope == 5)
            {
                int[] results = FindBestCell(picMain, picElement);
                return results;
            }
            int diffR = outScope + 1, diffG = outScope + 1, diffB = outScope + 1;
            int bestCell = -1;
            double minDistance = 0;
            for (int i = 0; i < picElement.Count; i++)
            {
                if (picElement[i] != null)
                {
                    int[, ,] arrDiff = new int[2, 2, 3]; // x, y , RGB
                    double sumDistance = 0;
                    for (int m = 0; m < 2; m++)
                        for (int n = 0; n < 2; n++)
                        {
                            Color colPicMain = picMain.GetPixel(m, n);
                            Color colPicElement = ((Bitmap)picElement[i]).GetPixel(m, n);
                            double diff = 0;
                            double distance = 0;
                            diff = arrDiff[m, n, 0] = colPicMain.R - colPicElement.R;
                            distance = Math.Pow(diff, 2);
                            diff = arrDiff[m, n, 1] = colPicMain.G - colPicElement.G;
                            distance += Math.Pow(diff, 2);
                            diff = arrDiff[m, n, 2] = colPicMain.B - colPicElement.B;
                            distance += Math.Pow(diff, 2);
                            distance = Math.Sqrt(distance);
                            sumDistance += distance;
                        }
                    if (bestCell == -1 || sumDistance < minDistance)
                    {
                        bool paint = true;
                        for (int m = 0; m < 2; m++)
                            for (int n = 0; n < 2; n++)
                                for (int o = 0; o < 3; o++)
                                {
                                    if (arrDiff[m, n, o] > inScope || arrDiff[m, n, o] < -inScope)
                                        paint = false;
                                }
                        if (paint) //picture in scope
                        {
                            minDistance = sumDistance;
                            bestCell = i;
                            diffR = diffG = diffB = 0;
                        }
                        else // pic out of scope
                        {
                            paint = true;
                            bool plus = true;
                            for (int o = 0; o < 3; o++)
                                for (int m = 0; m < 2; m++)
                                    for (int n = 0; n < 2; n++)
                                    {
                                        if (arrDiff[m, n, o] <= outScope && arrDiff[m, n, o] >= -outScope)
                                        {
                                            if (m == 0 && n == 0) //เอาแค่ช่องแรกมากำหนด
                                            {
                                                if (arrDiff[m, n, o] >= 0)
                                                    plus = true;
                                                else
                                                    plus = false;
                                            }
                                            else if (plus != (arrDiff[m, n, o] >= 0)) //ดูว่าช่องอื่นตรงกับช่องแรกรึเปล่า
                                                paint = false;
                                        }
                                        else //ไม่อยู่ใน scope ที่กำหนดเรย
                                            paint = false;
                                    }
                            if (paint)
                            {
                                diffR = diffG = diffB = outScope + 1;
                                minDistance = sumDistance;
                                bestCell = i;
                                for (int m = 0; m < 2; m++)
                                    for (int n = 0; n < 2; n++)
                                    {
                                        if (Math.Abs(arrDiff[m, n, 0]) < Math.Abs(diffR))
                                            diffR = arrDiff[m, n, 0];
                                        if (Math.Abs(arrDiff[m, n, 1]) < Math.Abs(diffG))
                                            diffG = arrDiff[m, n, 1];
                                        if (Math.Abs(arrDiff[m, n, 2]) < Math.Abs(diffB))
                                            diffB = arrDiff[m, n, 2];
                                    }
                            }
                        }
                    }
                }
            }
            int[] result = new int[] { bestCell, diffR, diffG, diffB };
            return result;
        }
        //find best cell photo by using vector of total of tiles RGB 
        public int[] FindBestCell(Bitmap picMain, ArrayList picElement)
        {
            int bestCell = -1;
            Double minDistance = 0;
            for (int i = 0; i < picElement.Count; i++)
            {
                if (picElement[i] != null)
                {
                    double sumDistance = 0;
                    for (int m = 0; m < 2; m++)
                        for (int n = 0; n < 2; n++)
                        {
                            Color colPicMain = picMain.GetPixel(m, n);
                            Color colPicElement = ((Bitmap)picElement[i]).GetPixel(m, n);
                            double diff = 0;
                            double distance = 0;
                            diff = colPicMain.R - colPicElement.R;
                            distance = Math.Pow(diff, 2);
                            diff = colPicMain.G - colPicElement.G;
                            distance += Math.Pow(diff, 2);
                            diff = colPicMain.B - colPicElement.B;
                            distance += Math.Pow(diff, 2);
                            distance = Math.Sqrt(distance);
                            sumDistance += distance;
                        }
                    if (bestCell == -1 || sumDistance < minDistance)
                    {
                        bestCell = i;
                        minDistance = sumDistance;
                    }
                }
            }
            int[] result = new int[] { bestCell, 0, 0, 0 };
            return result;
        }
        //find best cell by same vector
        public int[] FindBestCellSameVector(Bitmap picMain, ArrayList picElement)
        {
            int diffR = 256, diffG = 256, diffB = 256;
            int bestCell = -1;
            double minDistance = 0;
            for (int i = 0; i < picElement.Count; i++)
            {
                if (picElement[i] != null)
                {
                    int[, ,] arrDiff = new int[2, 2, 3]; // x, y , RGB
                    double sumDistance = 0;
                    for (int m = 0; m < 2; m++)
                        for (int n = 0; n < 2; n++)
                        {
                            Color colPicMain = picMain.GetPixel(m, n);
                            Color colPicElement = ((Bitmap)picElement[i]).GetPixel(m, n);
                            double diff = 0;
                            double distance = 0;
                            diff = arrDiff[m, n, 0] = colPicMain.R - colPicElement.R;
                            distance = Math.Pow(diff, 2);
                            diff = arrDiff[m, n, 1] = colPicMain.G - colPicElement.G;
                            distance += Math.Pow(diff, 2);
                            diff = arrDiff[m, n, 2] = colPicMain.B - colPicElement.B;
                            distance += Math.Pow(diff, 2);
                            distance = Math.Sqrt(distance);
                            sumDistance += distance;
                        }
                    if (bestCell == -1 || sumDistance < minDistance)
                    {
                        //bool paint = true;
                        //for (int m = 0; m < 2; m++)
                        //    for (int n = 0; n < 2; n++)
                        //        for (int o = 0; o < 3; o++)
                        //        {
                        //            if (arrDiff[m, n, o] > inScope || arrDiff[m, n, o] < -inScope)
                        //                paint = false;
                        //        }
                        //if (paint) //picture in scope
                        //{
                        //    minDistance = sumDistance;
                        //    bestCell = i;
                        //    diffR = diffG = diffB = 0;
                        //}
                        //else // pic out of scope
                        //{
                        bool paint = true;
                        bool plus = true;
                        for (int o = 0; o < 3; o++)
                            for (int m = 0; m < 2; m++)
                                for (int n = 0; n < 2; n++)
                                {
                                    //if (arrDiff[m, n, o] <= outScope && arrDiff[m, n, o] >= -outScope)
                                    //{
                                    if (m == 0 && n == 0) //เอาแค่ช่องแรกมากำหนด
                                    {
                                        if (arrDiff[m, n, o] >= 0)
                                            plus = true;
                                        else
                                            plus = false;
                                    }
                                    else if (plus != (arrDiff[m, n, o] >= 0)) //ดูว่าช่องอื่นตรงกับช่องแรกรึเปล่า
                                        paint = false;
                                    //}
                                    //else //ไม่อยู่ใน scope ที่กำหนดเรย
                                    //    paint = false;
                                }
                        if (paint)
                        {
                            diffR = diffG = diffB = 256;
                            minDistance = sumDistance;
                            bestCell = i;
                            for (int m = 0; m < 2; m++)
                                for (int n = 0; n < 2; n++)
                                {
                                    if (Math.Abs(arrDiff[m, n, 0]) < Math.Abs(diffR))
                                        diffR = arrDiff[m, n, 0];
                                    if (Math.Abs(arrDiff[m, n, 1]) < Math.Abs(diffG))
                                        diffG = arrDiff[m, n, 1];
                                    if (Math.Abs(arrDiff[m, n, 2]) < Math.Abs(diffB))
                                        diffB = arrDiff[m, n, 2];
                                }
                        }

                        //}
                    }
                }
            }
            if (bestCell == -1)
            {
                // DialogResult b = MessageBox.Show("The Cell Photos doesn't enough for create this Photo Do you want to Add more photo", "Warning", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
                //if (b == DialogResult.OK)
                //{ }
                //else
                //{
                return FindBestCell(picMain, picElement);
                // }
            }
            int[] result = new int[] { bestCell, diffR, diffG, diffB };
            return result;
        }
        //find best cell photo by rotate cell photo
        public void AddRotateCell(ArrayList picElement)
        {
            int length = picElement.Count;
            for (int i = 0; i < 3 * length; i++)
            {
                Bitmap bitElement = (Bitmap)picElement[i];
                Bitmap b = new Bitmap(2, 2);
                Color col = bitElement.GetPixel(0, 0);
                b.SetPixel(0, 1, col);
                col = bitElement.GetPixel(0, 1);
                b.SetPixel(1, 1, col);
                col = bitElement.GetPixel(1, 0);
                b.SetPixel(0, 0, col);
                col = bitElement.GetPixel(1, 1);
                b.SetPixel(1, 0, col);
                picElement.Add(b);
            }
        }
        public void AddMirror(ArrayList picElement)
        {
            int length = picElement.Count;
            for (int i = 0; i < length; i++)
            {
                Bitmap bitElement = (Bitmap)picElement[i];
                Bitmap b = new Bitmap(2, 2);
                Color col = bitElement.GetPixel(0, 0);
                b.SetPixel(0, 1, col);
                col = bitElement.GetPixel(1, 0);
                b.SetPixel(1, 1, col);
                col = bitElement.GetPixel(0, 1);
                b.SetPixel(0, 0, col);
                col = bitElement.GetPixel(1, 1);
                b.SetPixel(1, 0, col);
                picElement.Add(b);
            }
        }
        //if don't want to change which color (RGB) insert powerLaw = 1
        public Bitmap PowerLaw(Bitmap bmp, double powerLawR, double powerLawG, double powerLawB)
        {
            for (int i = 0; i < bmp.Height; i++)
                for (int j = 0; j < bmp.Width; j++)
                {
                    double r = bmp.GetPixel(j, i).R;
                    double g = bmp.GetPixel(j, i).G;
                    double b = bmp.GetPixel(j, i).B;
                    r = (double)Decimal.Divide((decimal)r, 256);
                    r = Math.Pow(r, powerLawR);
                    r *= 256;
                    g = (double)Decimal.Divide((decimal)g, 256);
                    g = Math.Pow(g, powerLawG);
                    g *= 256;
                    b = (double)Decimal.Divide((decimal)b, 256);
                    b = Math.Pow(b, powerLawB);
                    b *= 256;
                    bmp.SetPixel(j, i, Color.FromArgb((int)r, (int)g, (int)b));
                }
            return bmp;
        }
        public Bitmap CutImage(Bitmap bitMain, int x, int y, int width, int height)
        {
            Bitmap bmp = new Bitmap(width, height);
            for (int i = 0; i < bmp.Height; i++)
                for (int j = 0; j < bmp.Width; j++)
                {
                    Color col = bitMain.GetPixel(x + j, y + i);
                    bmp.SetPixel(j, i, col);
                }
            return bmp;
        }
        public Bitmap MixImage(Bitmap bmp1, Bitmap bmp2, int w1, int w2)
        {
            bmp2 = new Bitmap(bmp2, bmp1.Width, bmp1.Height);
            for (int i = 0; i < bmp1.Height; i++)
                for (int j = 0; j < bmp1.Width; j++)
                {
                    int r_ = ((w1 * bmp1.GetPixel(j, i).R) + (w2 * bmp2.GetPixel(j, i).R)) / (w1 + w2);
                    int g_ = ((w1 * bmp1.GetPixel(j, i).G) + (w2 * bmp2.GetPixel(j, i).G)) / (w1 + w2);
                    int b_ = ((w1 * bmp1.GetPixel(j, i).B) + (w2 * bmp2.GetPixel(j, i).B)) / (w1 + w2);
                    bmp1.SetPixel(j, i, Color.FromArgb(r_, g_, b_));
                }
            return bmp1;
        }
        public Bitmap BlurImage(Bitmap bmpMain, int[] lineWidth, int[] lineHeight, int widthBlur)
        {
            Bitmap bmpSec = new Bitmap(bmpMain);
            for (int c = 0; c < lineHeight.Length - 1; c++)
            {
                for (int l = lineHeight[c] - widthBlur / 2; l <= lineHeight[c] + widthBlur / 2 - 1; l++)
                    for (int i = 1; i < bmpMain.Width - 1; i++)
                    {
                        int R = 0;
                        int G = 0;
                        int B = 0;
                        for (int j = l - 1; j <= l + 1; j++)
                            for (int k = i - 1; k <= i + 1; k++)
                            {
                                Color col = bmpSec.GetPixel(k, j);
                                R += col.R;
                                G += col.G;
                                B += col.B;
                            }
                        R /= 9;
                        G /= 9;
                        B /= 9;
                        bmpMain.SetPixel(i, l, Color.FromArgb(R, G, B));
                    }
            }
            for (int c = 0; c < lineWidth.Length - 1; c++)
            {
                for (int l = lineWidth[c] - widthBlur / 2; l < lineWidth[c] + widthBlur / 2 - 1; l++)
                    for (int i = 1; i < bmpMain.Height - 1; i++)
                    {
                        int R = 0;
                        int G = 0;
                        int B = 0;
                        for (int j = l - 1; j <= l + 1; j++)
                            for (int k = i - 1; k <= i + 1; k++)
                            {
                                Color col = bmpSec.GetPixel(j, k);
                                R += col.R;
                                G += col.G;
                                B += col.B;
                            }
                        R /= 9;
                        G /= 9;
                        B /= 9;
                        bmpMain.SetPixel(l, i, Color.FromArgb(R, G, B));
                    }
            }
            return bmpMain;
        }
        public Bitmap SeperateImage(Bitmap bmpMain, int[] lineWidth, int[] lineHeight, int widthBlur)
        {
            Bitmap bmpSec = new Bitmap(bmpMain);
            for (int c = 0; c < lineHeight.Length - 1; c++)
            {
                for (int l = lineHeight[c] - widthBlur / 2; l <= lineHeight[c] + widthBlur / 2 - 1; l++)
                {
                    for (int i = 1; i < bmpMain.Width - 1; i++)
                    {
                        bmpMain.SetPixel(i, l, Color.Black);
                    }
                }
            }
            for (int c = 0; c < lineWidth.Length - 1; c++)
            {
                for (int l = lineWidth[c] - widthBlur / 2; l < lineWidth[c] + widthBlur / 2 - 1; l++)
                    for (int i = 1; i < bmpMain.Height - 1; i++)
                    {
                        bmpMain.SetPixel(l, i, Color.Black);
                    }
            }
            return bmpMain;
        }
        public ArrayList CloneArrayInArrayList(ArrayList arraylist1)
        {	//Design for Copy array in arraylist (different pointer) 
            ArrayList arraylist2 = new ArrayList();
            for (int i = 0; i < arraylist1.Count; i++)
            {
                arraylist2.Add(arraylist1[i]);
            }
            return arraylist2;
        }
        public ArrayList BlindPicElement(ArrayList picElement, bool isRotate, bool isMirror, int[, ,] pointPicElement, int i, int j)
        {
            int distance = Option.distanceCellPhoto;
            int length = picElement.Count;
            if (isRotate) length /= 4;
            if (isMirror) length /= 2;
            if (distance == 0)
            {
                return picElement;
            }
            ArrayList newPicElement = CloneArrayInArrayList(picElement);
            int beginI = i - distance;
            int beginJ = j - distance;
            if (beginI < 0) beginI = 0;
            if (beginJ < 0) beginJ = 0;
            //int endI = i+distance;
            int endJ = j + distance;
            //if(endI >= pointPicElement.GetLength(0)) endI = pointPicElement.GetLength(0)-1;
            if (endJ >= pointPicElement.GetLength(0)) endJ = pointPicElement.GetLength(0) - 1;
            //i = แนวตั้ง  j= แนวนอน
            for (int k = beginI; k <= i; k++)
                for (int l = beginJ; l <= endJ; l++)
                {
                    if (k == i && l >= j)
                        break;
                    for (int m = 0; m < 4; m++)
                    {
                        int n = pointPicElement[l, k, m];
                        if (n != -1)
                        {
                            for (int p = n; n < picElement.Count; n += length)
                                newPicElement[n] = null;
                        }
                    }
                }
            return newPicElement;
        }

      
       
        }
    }



