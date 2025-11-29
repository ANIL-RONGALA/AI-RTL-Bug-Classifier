## AI-RTL-Bug-Classifier

A lightweight AI-EDA prototype that uses Verilog code and simulator logs to automatically find and fix common RTL design bugs.
This project looks at how machine learning can help with early hardware verification by finding patterns in RTL bugs that happen over and over again.

---
## 🔍 Summary

Debugging RTL is one of the steps in the design flow that takes the most time. A lot of bugs follow patterns that are easy to spot, like latch inference, width mismatches, and missing defaults.
This project shows a small-scale, learning-based way to sort bugs right from:

Code in Verilog (code.v)

Logs of tool errors and warnings (log.txt)

The model uses TF-IDF features and Logistic Regression to guess what type of bug it is.

-----

## 🧩 Types of Bugs

There are 8 common types of RTL bugs in the dataset:

Bug Type: Syntax ErrorMissing symbols and wrong keywords
latch_inferenceCombinational logic that doesn't have any else paths width_mismatchGiving bits with different widths
blocking_misuseUsing = inside sequential logic unused_signalMissing wires/regs that have been declared but not useddefault case without a default branch
multi-driverMultiple tasks for the same net comb_loopIn continuous assigns, there are circular dependencies Structure of the Project

---
```
AI-RTL-Bug-Classifier/
│
├── dataset/                 # 300 generated RTL bug samples
│   ├── sample_001/
│   │   ├── code.v
│   │   ├── log.txt
│   │   └── label.txt
│
├── src/
│   ├── dataset_generator.py  # Synthetic dataset generator
│   ├── train.py              # Training script (TF-IDF + Logistic Regression)
│   ├── predict.py            # Predict on new code/log
│   ├── utils.py              # Dataset loading + label maps
│   ├── model.pkl             # Saved model (generated after training)
│   ├── vectorizer.pkl        # TF-IDF vectorizer (generated)
│   └── class_map.json        # id → label mapping (generated)
│
├── notebooks/
│   └── AI_EDA_RTL_Bug_Classifier.ipynb   # Experiment notebook
│
├── requirements.txt
└── README.md

```

### Results of the training

The model does a great job on the structured synthetic dataset:

Precision, Recall, and F1: 1.00 Accuracy: 100%

The notebook has a confusion matrix that you can use to look at the data.

-------

## 🚀 How to Run 
1️⃣ Install dependencies pip install -r requirements.txt

2. Create a dataset with python src/dataset_generator.py

3. Train the model with the command python src/train.py

4. Make predictions on new RTL files
python src/predict.py path/to/code.v path/to/log.txt

## 📘 Jupyter Notebook

### The notebook (notebooks/AI_EDA_RTL_Bug_Classifier.ipynb) has:

Checking out the dataset

Analysis of TF-IDF

Pipeline for training

Metrics for evaluation

A way to see a confusion matrix

This gives a clear picture of how the experiment works.

## 🔮 Work in the Future

This prototype can be developed into a more sophisticated AI-EDA research trajectory:

Use dataflow graphs or Verilog AST

Add LLM-based embeddings like CodeBERT and GPT-FPGA.

Put in place suggestions for automatic fixes

Use actual logs from Verilator, Questa, or VCS.

Add more types of bugs, like FSM issues, resets, and CDC problems.

## 👤 Writer

Anil Rongala
AI-EDA, Smart Verification, and Hardware-AI Co-Design
