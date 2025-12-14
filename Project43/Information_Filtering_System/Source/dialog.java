import java.awt.*;
import java.awt.Button;

	public class dialog extends Dialog
	{
		protected Button OKBT;
		protected static Frame createdFrame;
		public dialog(Frame parent,String message)
		{
			super(parent,true);
			setFont(new Font("TimesRoman",0,14));			
			
			GridBagLayout gridbag = new GridBagLayout();
			GridBagConstraints constraints = new GridBagConstraints();

			OKBT = new Button("OK");
			Label messageLabel = new Label(message);

			setLayout(gridbag);

			constraints.fill = GridBagConstraints.NONE;
			constraints.anchor = GridBagConstraints.CENTER;
			constraints.ipadx = 20;
			constraints.ipady = 20;
			constraints.weightx = 1.0;
			constraints.weighty = 1.0;
			constraints.gridwidth = GridBagConstraints.REMAINDER;
			constraints.gridheight = GridBagConstraints.RELATIVE;

			gridbag.setConstraints(messageLabel,constraints);
			add(messageLabel);

			constraints.ipadx = 0;
			constraints.ipady = 0;
			constraints.weightx = 0.0;
			constraints.weighty = 0.0;
			constraints.gridwidth = 1;
			constraints.gridheight = GridBagConstraints.REMAINDER;

			gridbag.setConstraints(OKBT,constraints);
			add(OKBT);

			pack();
		}
		public boolean action(Event evt, Object whatAction)
		{
			if (evt.target == OKBT)
			{
				hide();
				if (createdFrame != null)
				{
					createdFrame.hide();
				}
			}
			return true;
		}
		public static void createDialog(String dialogString)
		{
			if (createdFrame == null)
			{
				createdFrame = new Frame("Dialog");
			}
			dialog D = new dialog(createdFrame,dialogString);
			createdFrame.setSize(D.size().width,D.size().height);
			D.show();
		}
	}