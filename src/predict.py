# src/predict.py

import sys
import joblib
import json
import os

def main():
    if len(sys.argv) != 3:
        print("Usage: python src/predict.py <path_to_code.v> <path_to_log.txt>")
        sys.exit(1)

    code_path = sys.argv[1]
    log_path = sys.argv[2]

    if not os.path.exists(code_path) or not os.path.exists(log_path):
        print("Error: code or log file not found.")
        sys.exit(1)

    # Load artefacts
    model = joblib.load("src/model.pkl")
    vectorizer = joblib.load("src/vectorizer.pkl")

    with open("src/class_map.json") as f:
        id_to_label = json.load(f)   # keys are strings

    with open(code_path) as f_code, open(log_path) as f_log:
        text = f_code.read() + "\n" + f_log.read()

    X = vectorizer.transform([text])
    pred_id = model.predict(X)[0]

    label = id_to_label[str(pred_id)]

    print("Predicted Bug Class:", label)


if __name__ == "__main__":
    main()
