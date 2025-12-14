// Neural Network Java classes
//
// Copyright 1996, Mark Watson.  All rights reserved.

//package mwa.ai.neural;

//import java.awt.*;
//import java.applet.Applet;
import java.lang.*;
import java.util.*;

//import mwa.gui.GUI;
//import mwa.data.*;

class NeuralNetwork extends Object {

   // For debug output:
  // GUI MyGUI = null;

   protected int NumInputs;
   protected int NumHidden;
   protected int NumOutputs;

   protected int NumTraining;
   protected int WeightsFlag;
   protected int SpecialFlag;

   public float Inputs[];
   protected float Hidden[];
   public float Outputs[];

   protected float W1[][];
   protected float W2[][];

   protected float output_errors[];
   protected float hidden_errors[];

   protected float InputTraining[];
   protected float OutputTraining[];

   // mask of training examples to ignore (true -> ignore):
   public boolean IgnoreTraining[] = null;
   // mask of Input neurons to ignore:
   public boolean IgnoreInput[] = null;

   NeuralNetwork() {
    NumInputs = NumHidden = NumOutputs = 0;
   }
   public NNfile NeuralFile=null;

   NeuralNetwork(String file_name) {
     NeuralFile = new NNfile(file_name);
     NumInputs = NeuralFile.NumInput;
     NumHidden = NeuralFile.NumHidden;
     NumOutputs = NeuralFile.NumOutput;
     NumTraining= NeuralFile.NumTraining;
     WeightsFlag= NeuralFile.WeightFlag;
     SpecialFlag= NeuralFile.SpecialFlag;

     Inputs = new float[NumInputs];
     Hidden = new float[NumHidden];
     Outputs = new float[NumOutputs];
     W1 = new float[NumInputs][NumHidden];
     W2 = new float[NumHidden][NumOutputs];
     // Retrieve the weight values from the NNfile object:
     if (WeightsFlag!=0) {
       for (int i=0; i<NumInputs; i++) {
          for (int h=0; h<NumHidden; h++) {
            W1[i][h] = NeuralFile.GetW1(i, h);
          }
       }
       for (int h=0; h<NumHidden; h++) {
          for (int o=0; o<NumOutputs; o++) {
            W2[h][o] = NeuralFile.GetW2(h, o);
          }
       }
     } else {
        randomizeWeights();
     }

     output_errors = new float[NumOutputs];
     hidden_errors = new float[NumHidden];

     // Get the training cases (if any) from the training file:
     LoadTrainingCases();

   }

   public void LoadTrainingCases() {
     NumTraining = NeuralFile.NumTraining;
     if (NumTraining > 0) {
        InputTraining  = new float[NumTraining * NumInputs];
        OutputTraining = new float[NumTraining * NumOutputs];
     }
     int ic=0, oc=0;

     for (int k=0; k<NumTraining; k++) {
        for (int i=0; i<NumInputs; i++)
            InputTraining[ic++] = NeuralFile.GetInput(k, i);
        for (int o=0; o<NumOutputs; o++)
            OutputTraining[oc++] = NeuralFile.GetOutput(k, o);
     }
   }

   NeuralNetwork(int i, int h, int o) {
     System.out.println("In BackProp constructor");
     Inputs = new float[i];
     Hidden = new float[h];
     Outputs = new float[o];
     W1 = new float[i][h];
     W2 = new float[h][o];
     NumInputs = i;
     NumHidden = h;
     NumOutputs = o;
     output_errors = new float[NumOutputs];
     hidden_errors = new float[NumHidden];

     // Randomize weights here:
     randomizeWeights();
   }

   void Save(String output_file) {
     if (NeuralFile==null) {
        System.out.println("Error: no NeuralFile object in Neual::Save");
     } else {
        for (int i=0; i<NumInputs; i++) {
          for (int h=0; h<NumHidden; h++) {
            NeuralFile.SetW1(i, h, W1[i][h]);
          }
        }
        for (int h=0; h<NumHidden; h++) {
          for (int o=0; o<NumOutputs; o++) {
            NeuralFile.SetW2(h, o, W2[h][o]);
          }
        }
        NeuralFile.Save(output_file);
     }
   }

   public void randomizeWeights() {
    // Randomize weights here:
     for (int ii=0; ii<NumInputs; ii++)
        for (int hh=0; hh<NumHidden; hh++)
           W1[ii][hh] =
              0.1f * (float)Math.random() - 0.05f;
     for (int hh=0; hh<NumHidden; hh++)
        for (int oo=0; oo<NumOutputs; oo++)
           W2[hh][oo] =
              0.1f * (float)Math.random() - 0.05f;
	}

	public float[] Forward(float Inp[]) {
    int i, h, o;

	float Hid[] = new float[NumHidden];
	float Out[] = new float[NumOutputs];

    for (h=0; h<NumHidden; h++) {
      Hid[h] = 0.0f;
    }
    for (i=0; i<NumInputs; i++) {
        for (h=0; h<NumHidden; h++) {
             Hid[h] +=
                Inp[i] * W1[i][h];
        }
    }
    for (o=0; o<NumOutputs; o++)
      Out[o] = 0.0f;
    for (h=0; h<NumHidden; h++) {
        for (o=0; o<NumOutputs; o++) {
             Out[o] +=
                Sigmoid(Hid[h]) * W2[h][o];
        }
    }
    for (o=0; o<NumOutputs; o++)
	{
	    Out[o] = Sigmoid(Out[o]);
	}
	return Out;
  }


   public void ForwardPass() {
       int i, h, o;
       for (h=0; h<NumHidden; h++) {
         Hidden[h] = 0.0f;
       }
       for (i=0; i<NumInputs; i++) {
           for (h=0; h<NumHidden; h++) {
                Hidden[h] +=
                   Inputs[i] * W1[i][h];
           }
       }
       for (o=0; o<NumOutputs; o++)
         Outputs[o] = 0.0f;
       for (h=0; h<NumHidden; h++) {
           for (o=0; o<NumOutputs; o++) {
                Outputs[o] +=
                   Sigmoid(Hidden[h]) * W2[h][o];
           }
       }
       for (o=0; o<NumOutputs; o++)
         Outputs[o] = Sigmoid(Outputs[o]);
  }

  public float Train() {
     return Train(InputTraining, OutputTraining, NumTraining);
  }

  public float Train(float ins[],
                     float outs[],
                     int num_cases) {
    int i, h, o;
    int in_count=0, out_count=0;
    float error = 0.0f;
    for (int example=0; example<num_cases; example++) {
      if (IgnoreTraining != null)
         if (IgnoreTraining[example]) continue;  // skip this case
      // zero out error arrays:
      for (h=0; h<NumHidden; h++)
         hidden_errors[h] = 0.0f;
      for (o=0; o<NumOutputs; o++)
         output_errors[o] = 0.0f;
      // copy the input values:
      for (i=0; i<NumInputs; i++) {
         Inputs[i] = ins[in_count++];
      }

      if (IgnoreInput != null) {
        for (int ii=0; ii<NumInputs; ii++) {
           if (IgnoreInput[ii]) {
             for (int hh=0; hh<NumHidden; hh++) {
                W1[ii][hh] = 0;
             }
           }
        }
      }

      // perform a forward pass through the network:

      ForwardPass();

//      if (MyGUI != null)  MyGUI.repaint();
      for (o=0; o<NumOutputs; o++)  {
          output_errors[o] =
            (outs[out_count++] -
             Outputs[o])
            *(SigmoidP(Outputs[o]));
		//  System.out.println("output_errors[" + o + "] is " + output_errors[o] + " & NumOutputs is " + NumOutputs);
      }
      for (h=0; h<NumHidden; h++) {
        hidden_errors[h] = 0.0f;
        for (o=0; o<NumOutputs; o++) {
           hidden_errors[h] +=
               output_errors[o]*W2[h][o];
        }
      }
      for (h=0; h<NumHidden; h++) {
         hidden_errors[h] =
           hidden_errors[h]*(SigmoidP(Hidden[h]));
      }
      // update the hidden to output weights:
      for (o=0; o<NumOutputs; o++) {
         for (h=0; h<NumHidden; h++) {
            W2[h][o] +=
               0.5 * output_errors[o] * Hidden[h];
         }
      }
      // update the input to hidden weights:
      for (h=0; h<NumHidden; h++) {
         for (i=0; i<NumInputs; i++) {
             W1[i][h] +=
                0.5 * hidden_errors[h] * Inputs[i];
         }
      }
      for (o=0; o<NumOutputs; o++)
          error += Math.abs(output_errors[o]);
    }
    return error;
  }

  protected float Sigmoid(float x) {
    return
	(float)(1.0f/(1.0f+Math.exp((double)(-x))));
  }

  protected float SigmoidP(float x) {
    double z = Sigmoid(x);
    return (float)(z * (1.0f - z));
  }

	protected void showNeuralResult()
	{
		System.out.println("this is Array of Output.");
		for (int oo = 0; oo< NumOutputs ; oo++)
		{
			System.out.print(Outputs[oo] + " " );
		}

	}
	public static void main(String argv[])
	{
		int x = 0;
		float error = -9999.9f;
		float Error[] = new float[100];
		NeuralNetwork test = new NeuralNetwork("newTrain.dat");
//		while (x < 100)
//		{
//			test.ForwardPass();
//			Error[x++] = error = test.Train();
//		}

		System.out.println();
		System.out.println("test.NumOutputs is " + test.NumOutputs);
//		test.Save("newtrain.dat");

		float Intemp[] = new float[4];
		float Outtemp[] = new float[14];

		Intemp[0] = 0.0f;
		Intemp[1] = 0.91f;
		Intemp[2] = 0.316f;
		Intemp[3] = 0.714f;

		Outtemp = test.Forward(Intemp);
		for (int o = 0; o<14; o++)
		{
			System.out.println(Outtemp[o] + " and Error is " + Error[o]);
		}
	}
}
