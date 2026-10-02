import pandas as pd

def findHeavyAnimals(animals: pd.DataFrame) -> pd.DataFrame:
    result = animals[animals["weight"] > 100]
    result = result.sort_values(by="weight", ascending=False)
    result = result[["name"]]

    return result