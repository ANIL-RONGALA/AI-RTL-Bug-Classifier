An experimental mini-project exploring how machine learning can support RTL-level verification.
The goal is simple: classify common RTL bug types directly from Verilog code + error logs using a lightweight ML model.

This project demonstrates how data-driven learning can assist early-stage debugging—an emerging theme in AI-EDA.

🚀 1. Motivation

Hardware verification remains one of the costliest and slowest steps in the ASIC design flow.
Many RTL bugs fall into recurring patterns—syntax slips, latch inference, missing defaults, width mismatches, and more.

If a model can recognize these patterns automatically, tools could:

Prioritize errors

Suggest likely fixes

Reduce triage time

Enable intelligent verification assistants

This project builds a small-scale prototype to explore that idea.

🧩 2. Problem Definition

Given:

RTL snippet (code.v)

Compiler/simulator error log (log.txt)

Predict:

{ syntax_error, latch_inference, width_mismatch, blocking_misuse,
  unused_signal, missing_default, multi_driver, comb_loop }

📂 3. Repository Structure
AI-RTL-Bug-Classifier/
│
├── dataset/
│   ├── sample_001/
│   │   ├── code.v
│   │   ├── log.txt
│   │   └── label.txt
│   ├── sample_002/
│   └── ...
│
├── notebooks/
│   └── AI_EDA_RTL_Bug_Classifier.ipynb
│
├── src/
│   ├── dataset_generator.py
│   ├── train.py
│   ├── predict.py
│   ├── utils.py
│   └── class_map.json
│
├── requirements.txt
└── README.md

🛠 4. Model Architecture

A simple but effective pipeline:

Verilog + Log  →  TF-IDF vectorizer → Logistic Regression → Bug Class Prediction


Why Logistic Regression?

Fast

Stable for small datasets

Works well with sparse features

Easy to interpret

You can swap in SVM or RandomForest later.

🗃 5. Dataset

300 synthetically generated RTL bug samples.

Bugs covered:

Class	Description
syntax_error	Missing semicolon, wrong keyword
latch_inference	Missing else-causes causing latch
width_mismatch	Assigning N-bit to M-bit
blocking_misuse	Bad mix of = and <=
unused_signal	Signal declared but never used
missing_default	Case statement without default
multi_driver	Multiple assignments to same net
comb_loop	Always @(*) loops
🧪 6. Results
Metric	Score
Accuracy	~90–95%
F1-score	High for structured classes
Confusion matrix	Included in notebook

The model learns patterns from both the RTL and the logs, improving classification accuracy beyond using logs alone.

📈 Confusion Matrix Preview

A confusion matrix is automatically generated in the notebook to visualize error distribution.

📚 7. How to Run
Install Dependencies
pip install -r requirements.txt

Generate Dataset
python src/dataset_generator.py

Train Model
python src/train.py

Predict New Bug
python src/predict.py test/code.v test/log.txt

🔮 8. Future Work

This prototype opens doors to deeper AI-EDA research:

LLM-based Verilog embeddings

Graph Neural Networks on AST/CFG

Auto-fix suggestions

Learning from real simulation logs

Integrating with Verilator/Questa logs

Fine-tuned small LLMs for RTL debugging

📝 9. Citation / Usage

This project may be freely used for education and research.