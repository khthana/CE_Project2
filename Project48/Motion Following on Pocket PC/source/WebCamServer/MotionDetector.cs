// Motion Detector
//
//
namespace WebCamServer
{
	using System;
	using System.Drawing;

	using AForge.Imaging;
	using AForge.Imaging.Filters;

	/// <summary>
	/// MotionDetector1
	/// </summary>
	public class MotionDetector
	{
		private IFilter	grayscaleFilter = new GrayscaleBT709();
		private Difference differenceFilter = new Difference();
		private IFilter thresholdFilter = new Threshold(15, 255);

		private IFilter edgeFilter = new Edges();

		private IFilter erosionFilter = new Erosion();

		private FiltersSequence	processingFilter = new FiltersSequence();

		private Bitmap	backgroundFrame;

		private int fixWin = 0;
		private int fixWout = 0;
		private bool move = false;
		private bool isExit = true;

		private int oldMid = 0;
		private int checkTime = -1;

		// Constructor
		public MotionDetector()
		{
			processingFilter.Add(differenceFilter);
			processingFilter.Add(thresholdFilter);
			processingFilter.Add(erosionFilter);
			processingFilter.Add(edgeFilter);
		}

		// Reset detector to initial state
		public void Reset()
		{
			if (backgroundFrame != null)
			{
				backgroundFrame.Dispose();
				backgroundFrame = null;
			}
		}

		// Process new frame
		public void ProcessFrame(ref Bitmap image,ref int x, ref int y, ref int w, ref int h, ref bool newRect)
		{
			RectangleF cloneRect = new RectangleF(x, y, w, h);
			Bitmap cloneImage = image.Clone(cloneRect, image.PixelFormat);
			if(backgroundFrame == null || newRect)
			{
				fixWin = (3 * w) / 2;
				fixWout = (9 * w) / 5;

				move = false;
				isExit = true;

				oldMid = x + (w / 2);

				newRect = false;
				// create initial background image
				backgroundFrame = grayscaleFilter.Apply(cloneImage);
				cloneImage.Dispose();

				//just return for the first time
				return;
			}
			Bitmap tmpImage;

			// apply the grayscale file
			tmpImage = grayscaleFilter.Apply(cloneImage);

			// set background frame as an overlay for difference filter
			differenceFilter.OverlayImage = backgroundFrame;

			// apply the filters sequence
			Bitmap tmpImage2 = processingFilter.Apply(tmpImage);

			// dispose old background
			backgroundFrame.Dispose();

			cloneImage.Dispose();

			Color color;
			int top = 240;
			int bottom = 0;
			int left = 320;
			int right = 0;

			for (int i = 0; i < tmpImage2.Height; i++)
			{
				for (int j = 0; j < tmpImage2.Width; j++)
				{
					color = tmpImage2.GetPixel(j, i);
					if (color.G == 255 && color.R == 255 && color.B == 255)
					{
						if (i < top)
							top = i;
						if (i > bottom)
							bottom = i;
						if (j < left)
							left = j;
						if (j > right)
							right = j;
					}
				}
			}

			if ((top >= bottom) || (left >= right))
			{}
			else
			{
				int mid;

				x = x + left - 10;
				y = y + top - 10;
				w = right - left + 20;
				h = bottom - top + 20;

				if(x < 0)
					x = 0;
				if(y < 0)
					y = 0;

				if(w > (320 - x))
					w = 320 - x;
				if(h > (240 - y))
					h = 240 - y;

				mid = x + (w / 2);
				if ((oldMid > mid+10) && (w <= fixWin) && isExit)
				{
					move = false;							// <-
					oldMid = mid;
				}
				else if ((oldMid < mid-10) && (w <= fixWin) && isExit)
				{
					move = true;							// ->
					oldMid = mid;
				}

				if (w > fixWout)
				{
					w = fixWout;
					isExit = true;
					if (move)
					{
						x =  mid + (w / 6);
						w = fixWout / 3;
					}
				}
				else if (w > fixWin)
				{
					isExit = false;
					if (checkTime == -1)
						checkTime = DateTime.Now.Second;
				}

				if(checkTime == 57 && DateTime.Now.Second >= 0)
				{
					checkTime = -1;
					isExit = true;
					w = fixWout / 2;
				}
				else if(checkTime == 58 && DateTime.Now.Second >= 1)
				{
					checkTime = -1;
					isExit = true;
					w = fixWout / 2;
				}
				else if(checkTime == 59 && DateTime.Now.Second >= 2)
				{
					checkTime = -1;
					isExit = true;
					w = fixWout / 2;
				}
				else if (checkTime != -1 && (DateTime.Now.Second - checkTime) >= 3)
				{
					checkTime = -1;
					isExit = true;
					w = fixWout / 2;
				}

				if(w > (320 - x))
					w = 320 - x;
			}

			// set backgound to current
			cloneRect = new RectangleF(x, y, w, h);
			cloneImage = image.Clone(cloneRect, image.PixelFormat);
			tmpImage = grayscaleFilter.Apply(cloneImage);
			backgroundFrame = tmpImage;
			cloneImage.Dispose();

			Rectangle rc = new Rectangle(x, y, w, h);

			// create graphics object from initial image
			Graphics g = Graphics.FromImage(image);

			Color pColor = Color.LightGreen;
			using (Pen pen = new Pen(pColor, 5))
			{
				g.DrawRectangle(pen, rc);
			}
			g.Dispose();
		}
	}
}
