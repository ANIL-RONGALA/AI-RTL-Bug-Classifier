# src/utils.py

import glob
import os
import json
import numpy as np
from typing import List, Tuple, Dict

DATASET_DIR = "dataset"


def load_dataset(dataset_dir: str = DATASET_DIR) -> Tuple[List[str], List[str]]:
    """
    Load (code + log) text and labels from the dataset directory.

    Returns:
        texts: list of combined code + log strings
        labels: list of label strings
    """
    texts = []
    labels = []

    # dataset/sample_001, dataset/sample_002, ...
    pattern = os.path.join(dataset_dir, "sample_*")
    for folder in glob.glob(pattern):
        code_path = os.path.join(folder, "code.v")
        log_path = os.path.join(folder, "log.txt")
        label_path = os.path.join(folder, "label.txt")

        if not (os.path.exists(code_path) and os.path.exists(log_path) and os.path.exists(label_path)):
            continue

        with open(code_path, "r") as f_code, open(log_path, "r") as f_log:
            combined = f_code.read() + "\n" + f_log.read()

        with open(label_path, "r") as f_label:
            label = f_label.read().strip()

        texts.append(combined)
        labels.append(label)

    return texts, labels


def build_label_maps(labels: List[str]) -> Tuple[Dict[str, int], Dict[int, str], np.ndarray]:
    """
    Build mapping dictionaries for label <-> id.

    Returns:
        label_to_id: dict mapping label string to integer ID
        id_to_label: dict mapping integer ID to label string
        y: numpy array of integer labels
    """
    unique_labels = sorted(list(set(labels)))
    label_to_id = {lbl: i for i, lbl in enumerate(unique_labels)}
    id_to_label = {i: lbl for lbl, i in label_to_id.items()}
    y = np.array([label_to_id[lbl] for lbl in labels])

    return label_to_id, id_to_label, y


def save_class_map(id_to_label: Dict[int, str], path: str = "src/class_map.json") -> None:
    """
    Save id_to_label mapping as JSON.
    Keys are converted to strings to be JSON serializable.
    """
    serializable = {str(k): v for k, v in id_to_label.items()}
    with open(path, "w") as f:
        json.dump(serializable, f, indent=4)
