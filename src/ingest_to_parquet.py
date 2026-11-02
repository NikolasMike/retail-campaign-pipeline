"""Convert the raw dunnhumby CSV files to Parquet, all columns as text."""
from pathlib import Path

import polars as pl

RAW_DIR = Path("data/raw")
OUT_DIR = Path("data/parquet")


def count_csv_rows(csv_path: Path) -> int:
    """Count data rows by counting lines (minus the header), without using polars."""
    with open(csv_path, "rb") as f:
        return sum(1 for _ in f) - 1


def convert(csv_path: Path) -> None:
    out_path = OUT_DIR / f"{csv_path.stem}.parquet"
    # Lazy scan + sink: streams the file in chunks instead of loading it all in memory.
    # infer_schema=False keeps every column as text (raw layer = faithful copy).
    pl.scan_csv(csv_path, infer_schema=False).sink_parquet(out_path)

    rows_csv = count_csv_rows(csv_path)
    rows_parquet = pl.scan_parquet(out_path).select(pl.len()).collect().item()
    if rows_csv != rows_parquet:
        raise ValueError(
            f"{csv_path.name}: {rows_csv} CSV rows vs {rows_parquet} Parquet rows"
        )
    print(f"{csv_path.name}: {rows_parquet:,} rows OK")


def main() -> None:
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    for csv_path in sorted(RAW_DIR.glob("*.csv")):
        convert(csv_path)


if __name__ == "__main__":
    main()
