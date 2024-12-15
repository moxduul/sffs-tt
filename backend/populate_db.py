import pandas as pd
from sqlalchemy.orm import Session
from sqlalchemy.sql import text
from database import SessionLocal
from models import Division, Team, Player

# Connect to the database
db = SessionLocal()

# Load Excel file
file_path = "local_data.xlsx"  # Replace with your actual file path
excel_data = pd.ExcelFile(file_path)

# Clear existing data
db.execute(text("TRUNCATE TABLE players, teams, divisions RESTART IDENTITY CASCADE"))
db.commit()


# Populate Divisions
divisions_df = pd.read_excel(excel_data, sheet_name="divisions")
for _, row in divisions_df.iterrows():
    division = Division(id=row['id'], name=row['name'])
    db.add(division)
db.commit()

# Populate Teams Without capitain_id
teams_df = pd.read_excel(excel_data, sheet_name="teams")
for _, row in teams_df.iterrows():
    team = Team(
        id=row['id'],
        name=row['name'],
        team_number=row['team_number'],
        division_id=row['division_id'],
        capitain_id=None,  # Temporarily set to None
    )
    db.add(team)
db.commit()

# Populate Players
players_df = pd.read_excel(excel_data, sheet_name="players")
for _, row in players_df.iterrows():
    player = Player(
        id=row['id'],
        first_name=row['first_name'],
        last_name=row['last_name'],
        license_number=row['license_number'],
        email=None if pd.isnull(row['email']) else row['email'],  # Handle missing emails
        phone1=row['phone1'],
        phone2=row['phone2'],
        team_id=row['team_id'],  # Assign the player's team
        classification=row['classification'],
        ELO_points=row['ELO_points'],
    )
    db.add(player)
db.commit()

# Update Teams With capitain_id
for _, row in teams_df.iterrows():
    if not pd.isnull(row['capitain_id']):  # Ensure the captain ID exists
        team = db.query(Team).filter_by(id=row['id']).first()
        team.capitain_id = row['capitain_id']
db.commit()

# Close the session
db.close()

print("Database populated successfully!")