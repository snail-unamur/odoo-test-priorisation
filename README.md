# Replication package — Priorisation des tests Odoo 19.0

Ce dossier contient les scripts, données, modèles et artefacts expérimentaux utilisés pour l’évaluation du mémoire :

**Priorisation et sélection par apprentissage automatique des tests pour Odoo, un ERP open source**

L’objectif de ce package est de permettre la vérification du protocole expérimental : collecte des données, construction du dataset, extraction des features, entraînement des modèles de ranking, validation croisée Leave-One-Commit-Out et validation complémentaire par injection de mutations.

---

## 1. Structure du package

```text
package_evaluation/
│
├── README.md
├── commands/
│   ├── collect_commits_01_30.ps1
│   └── inject_mutations.ps1
│
├── data/
│   ├── final_data/
│   └── mutations/
│
├── artifacts/
│   ├── commits.pkl
│   ├── dataset.pkl
│   ├── dataset_features.pkl
│   ├── dataset_scored.pkl
│   ├── embeddings_sbert.pkl
│   ├── idf.pkl
│   ├── reverse_deps.pkl
│   ├── v5_3models_comparison.png
│   ├── v5_cost_gain.png
│   ├── v5_feature_importance.png
│   ├── v5_fold_analysis.png
│   ├── v5_rankers_comparison.png
│   ├── v5_ranknet_architectures.png
│   ├── v5_resultats_finaux.png
│   └── ndcg_at_k.png
│
├── models/
│   ├── feature_list.pkl
│   ├── xgboost_ranker.pkl
│   ├── lightgbm_ranker.pkl
│   ├── ranker_full.pkl
│   ├── ranknet_model.pt
│   └── ranknet_scaler.pkl
│
└── scripts/
    ├── 01_data_preparation.ipynb
    ├── 02_feature_engineering.ipynb
    ├── 03_model_training.ipynb
    ├── 04_validation.ipynb
    └── 05_mutation_testing.ipynb
```

---

## 2. Description des dossiers

### `commands/`

Ce dossier contient les scripts PowerShell utilisés pour reproduire la collecte initiale des données et l’injection des mutations.

- `collect_commits_01_30.ps1`  
  Script de collecte des 30 commits étudiés. Il extrait les diffs Git et exécute les tests Odoo pour les modules sélectionnés. Les logs et diffs générés sont stockés dans `data/final_data/`.

- `inject_mutations.ps1`  
  Script utilisé pour injecter les mutations artificielles dans les modules étudiés et exécuter les tests correspondants. Les logs de mutations sont stockés dans `data/mutations/`.

Ces scripts supposent un environnement Windows avec PowerShell, PostgreSQL et une installation locale fonctionnelle d’Odoo 19.0.

---

### `data/`

Ce dossier contient les données brutes issues de l’exécution des commandes.

- `final_data/`  
  Contient les fichiers de logs et de diffs associés aux 30 commits correctifs étudiés. Chaque commit possède un fichier de diff et un fichier de log de tests.

- `mutations/`  
  Contient les logs produits après injection des mutations artificielles. Ces logs permettent d’identifier les tests effectivement cassés par chaque mutation.

---

### `artifacts/`

Ce dossier contient les artefacts intermédiaires et finaux produits par les notebooks.

Principaux fichiers :

- `commits.pkl`  
  Liste structurée des commits étudiés, avec leurs métadonnées principales.

- `dataset.pkl`  
  Dataset initial construit à partir des couples commit-test.

- `dataset_features.pkl`  
  Dataset enrichi avec les features structurelles, textuelles, sémantiques et historiques.

- `dataset_scored.pkl`  
  Dataset final avec les scores de pertinence utilisés pour l’apprentissage et l’évaluation.

- `embeddings_sbert.pkl`  
  Embeddings SBERT calculés pour les diffs et les noms de tests.

- `idf.pkl`  
  Pondérations IDF utilisées pour les features TF-IDF.

- `reverse_deps.pkl`  
  Informations de dépendances inverses entre modules Odoo.

- `v5_feature_importance.png`  
  Figure d’importance des features calculée avec XGBoost Ranker.

- `v5_ranknet_architectures.png`  
  Comparaison des architectures RankNet évaluées.

- `v5_resultats_finaux.png`  
  Figure de synthèse des résultats expérimentaux.

Les fichiers `.pkl` permettent de reprendre directement l’analyse sans devoir relancer toute la collecte des logs Odoo, qui est coûteuse en temps.

---

### `models/`

Ce dossier contient les modèles entraînés et les objets nécessaires à leur réutilisation.

- `xgboost_ranker.pkl`  
  Modèle XGBoost Ranker entraîné.

- `lightgbm_ranker.pkl`  
  Modèle LightGBM Ranker entraîné.

- `ranker_full.pkl`  
  Modèle de ranking complet utilisé dans certaines évaluations.

- `ranknet_model.pt`  
  Modèle RankNet entraîné au format PyTorch.

- `ranknet_scaler.pkl`  
  Scaler utilisé pour normaliser les features avant l’utilisation de RankNet.

- `feature_list.pkl`  
  Liste des features utilisées par les modèles.

---

### `scripts/`

Ce dossier contient les notebooks principaux du pipeline expérimental.

L’ordre recommandé d’exécution est le suivant :

1. `01_data_preparation.ipynb`  
   Prépare les données à partir des diffs et logs de tests. Construit les premières paires commit-test.

2. `02_feature_engineering.ipynb`  
   Calcule les features utilisées par les modèles : features structurelles, TF-IDF, similarité SBERT, historique de pertinence, etc.

3. `03_model_training.ipynb`  
   Entraîne les modèles de ranking : XGBoost Ranker, LightGBM Ranker et RankNet. Compare également différentes architectures RankNet.

4. `04_validation.ipynb`  
   Exécute la validation Leave-One-Commit-Out Cross-Validation et calcule les métriques APFD, NDCG@20, NDCG@$n_{pert}$ et NDCG complet.

5. `05_mutation_testing.ipynb`  
   Analyse les résultats de validation par injection de mutations et compare les modèles sur les tests effectivement cassés.

---

## 3. Environnement requis

Le package a été préparé et exécuté dans un environnement Python local. Les principales dépendances sont :

```text
python >= 3.10
pandas
numpy
scikit-learn
xgboost
lightgbm
torch
sentence-transformers
matplotlib
seaborn
jupyter
```

Pour installer les dépendances dans un nouvel environnement virtuel :

```bash
python -m venv venv
venv\Scripts\activate
pip install pandas numpy scikit-learn xgboost lightgbm torch sentence-transformers matplotlib seaborn jupyter
```

---

## 4. Reproduction de l’expérience

### Option A — Reproduire à partir des artefacts déjà fournis

C’est l’option recommandée pour vérifier rapidement les résultats sans relancer la collecte complète des tests Odoo.

1. Ouvrir les notebooks dans `scripts/`.
2. Vérifier que les chemins vers `artifacts/`, `data/` et `models/` sont corrects.
3. Exécuter dans l’ordre :
   - `02_feature_engineering.ipynb`, si nécessaire ;
   - `03_model_training.ipynb` ;
   - `04_validation.ipynb` ;
   - `05_mutation_testing.ipynb`.

Les fichiers `.pkl` fournis permettent de reprendre l’expérience à partir des datasets déjà construits.

### Option B — Reproduire depuis les logs et diffs

1. Utiliser les fichiers présents dans `data/final_data/`.
2. Exécuter `01_data_preparation.ipynb`.
3. Exécuter ensuite les notebooks suivants dans l’ordre :
   - `02_feature_engineering.ipynb`
   - `03_model_training.ipynb`
   - `04_validation.ipynb`
   - `05_mutation_testing.ipynb`

### Option C — Reproduire depuis le dépôt Odoo

Cette option est plus coûteuse en temps. Elle nécessite :

- le dépôt Odoo 19.0 cloné localement ;
- PostgreSQL configuré ;
- un utilisateur PostgreSQL compatible avec les scripts ;
- les dépendances Python d’Odoo installées ;
- PowerShell sous Windows.

Les scripts à utiliser sont :

```powershell
commands\collect_commits_01_30.ps1
commands\inject_mutations.ps1
```

Ces scripts génèrent les logs et diffs utilisés ensuite par les notebooks.

---

## 5. Résultats principaux

### Validation Leave-One-Commit-Out

La validation principale est réalisée par Leave-One-Commit-Out Cross-Validation sur 30 commits correctifs. Cinq commits ne présentant pas de labels mixtes sont exclus de l’agrégation finale, ce qui donne 25 folds exploitables.

Résultats principaux du ranker hybride XGBoost par rapport aux baselines :

```text
Aléatoire        APFD = 0.5054   NDCG@20 = 0.0457
Module seul      APFD = 0.9151   NDCG@20 = 0.5920
SBERT seul       APFD = 0.7738   NDCG@20 = 0.3509
XGBoost Ranker   APFD = 0.9443   NDCG@20 = 0.8966
```

### Comparaison des modèles de ranking

```text
RankNet          APFD = 0.9509   NDCG@20 = 0.9292
LightGBM Ranker  APFD = 0.9520   NDCG@20 = 0.8993
XGBoost Ranker   APFD = 0.9443   NDCG@20 = 0.8966
```

XGBoost est retenu comme modèle principal dans le mémoire en raison de son compromis entre performance et interprétabilité. RankNet obtient les meilleurs résultats sur le NDCG@20, mais il est moins directement interprétable.

### Validation par injection de mutations

Quatre mutations sont évaluées sur les modules `account`, `stock`, `sale` et `purchase`.

```text
APFD moyen mutations :
XGBoost   = 0.8083
LightGBM  = 0.8029
RankNet   = 0.8514
```

La validation par mutations est utilisée comme évaluation complémentaire. Elle ne constitue pas une campagne exhaustive de mutation testing, mais permet de vérifier si les modèles placent tôt dans le classement des tests effectivement cassés.

---


