# src/train.py
import os
import json
import joblib
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import classification_report

from utils import build_label_maps, save_class_map

DATASET_JSONL = os.path.join("dataset", "dataset.jsonl")

def load_jsonl(mode: str):
    texts, labels, template_ids = [], [], []
    with open(DATASET_JSONL, "r", encoding="utf-8") as f:
        for line in f:
            obj = json.loads(line)
            code = obj["code"]
            log = obj["log"]
            if mode == "log":
                combined = log
            elif mode == "code":
                combined = code
            else:
                combined = code + "\n" + log

            texts.append(combined)
            labels.append(obj["label"])
            template_ids.append(obj["template_id"])
    return texts, labels, template_ids

def template_holdout_split(texts, y, template_ids, test_frac=0.2, seed=42):
    # Hold out entire template_ids (so train never sees those patterns)
    rnd = __import__("random")
    rnd.seed(seed)
    uniq = sorted(list(set(template_ids)))
    rnd.shuffle(uniq)
    n_test = max(1, int(len(uniq) * test_frac))
    test_templates = set(uniq[:n_test])

    tr_idx, te_idx = [], []
    for i, tid in enumerate(template_ids):
        (te_idx if tid in test_templates else tr_idx).append(i)

    return tr_idx, te_idx, test_templates

def main():
    mode = os.environ.get("MODE", "both").lower()       # both|log|code
    split = os.environ.get("SPLIT", "random").lower()   # random|template

    if not os.path.exists(DATASET_JSONL):
        raise RuntimeError("dataset/dataset.jsonl not found. Run: python src/dataset_generator.py")

    texts, labels, template_ids = load_jsonl(mode)
    if not texts:
        raise RuntimeError("No samples loaded from dataset.jsonl")

    label_to_id, id_to_label, y = build_label_maps(labels)

    vectorizer = TfidfVectorizer(max_features=6000)
    X = vectorizer.fit_transform(texts)

    if split == "template":
        tr_idx, te_idx, test_templates = template_holdout_split(texts, y, template_ids, test_frac=0.2, seed=42)
        X_tr, X_te = X[tr_idx], X[te_idx]
        y_tr, y_te = y[tr_idx], y[te_idx]
        print(f"[Split=template] held out {len(test_templates)} template_ids")
    else:
        X_tr, X_te, y_tr, y_te = train_test_split(X, y, test_size=0.2, random_state=42, stratify=y)
        print("[Split=random] stratified random split")

    clf = LogisticRegression(max_iter=2000)
    clf.fit(X_tr, y_tr)

    y_pred = clf.predict(X_te)
    inverse_labels = [id_to_label[i] for i in sorted(id_to_label.keys())]

    print(f"\n=== MODE={mode} SPLIT={split} ===")
    print(classification_report(y_te, y_pred, target_names=inverse_labels, zero_division=0))

    joblib.dump(clf, "src/model.pkl")
    joblib.dump(vectorizer, "src/vectorizer.pkl")
    save_class_map(id_to_label, "src/class_map.json")

    print("Training complete. Model saved to src/model.pkl, vectorizer.pkl, and class_map.json")

if __name__ == "__main__":
    main()
