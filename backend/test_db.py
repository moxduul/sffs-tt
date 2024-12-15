from sqlalchemy import create_engine

DATABASE_URL = "postgresql://postgres:postgres@localhost/sffs_tt_db"

try:
    engine = create_engine(DATABASE_URL)
    connection = engine.connect()
    print("Database connection successful!")
    connection.close()
except Exception as e:
    print("Database connection failed:", e)
