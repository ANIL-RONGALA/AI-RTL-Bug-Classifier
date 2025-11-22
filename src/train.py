# src/train.py

import joblib
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import classification_report

from utils import load_dataset, build_label_maps, save_class_map

def main():
    # 1. Load dataset
    texts, labels = load_dataset("dataset")
    if not texts:
        raise RuntimeError("No dataset found. Run 'python src/dataset_generator.py' first.")

    # 2. Label mapping
    label_to_id, id_to_label, y = build_label_maps(labels)

    # 3. Features
    vectorizer = TfidfVectorizer(max_features=6000)
    X = vectorizer.fit_transform(texts)

    # 4. Train/Val Split
    X_tr, X_te, y_tr, y_te = train_test_split(
        X, y, test_size=0.2, random_state=42, stratify=y
    )

    # 5. Model
    clf = LogisticRegression(max_iter=2000)
    clf.fit(X_tr, y_tr)

    # 6. Evaluation
    y_pred = clf.predict(X_te)
    # build inverse label list for readable report
    inverse_labels = [id_to_label[i] for i in sorted(id_to_label.keys())]
    print(classification_report(y_te, y_pred, target_names=inverse_labels))

    # 7. Save artefacts
    joblib.dump(clf, "src/model.pkl")
    joblib.dump(vectorizer, "src/vectorizer.pkl")
    save_class_map(id_to_label, "src/class_map.json")

    print("Training complete. Model saved to src/model.pkl, vectorizer.pkl, and class_map.json")


if __name__ == "__main__":
    main()
