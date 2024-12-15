from fastapi import FastAPI, Depends
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy.orm import Session
from database import SessionLocal
from database import Base, engine
import models
from models import Player, Team, Division
from pydantic import BaseModel

# Create tables
## models.Base.metadata.create_all(bind=engine)
Base.metadata.create_all(bind=engine)

app = FastAPI()

# Allow CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=[
         "http://localhost:5173",  # For local development
        "https://sffs-tt.netlify.app",  # For deployed frontend on Netlify
        ],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


# Dependency to get a database session
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/")
def read_root():
    return {"message": "Welcome to Table Tennis Manager"}


@app.get("/db-test/")
def test_database(db: Session = Depends(get_db)):
    return {"success": "Database connection is working!"}

## GET players, teams, divisions

@app.get("/players/")
def get_players(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    players = db.query(Player).offset(skip).limit(limit).all()
    return [
        {
           "id": player.id,
            "first_name": player.first_name,
            "last_name": player.last_name,
            "license_number": player.license_number,
            "email": player.email,
            "phone1": player.phone1,
            "phone2": player.phone2,
            "classification": player.classification,
            "ELO_points": player.ELO_points,
            "team": player.team.name if player.team else "N/A",
        }
        for player in players
    ]

@app.get("/teams/")
def get_teams(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    teams = db.query(Team).offset(skip).limit(limit).all()
    return [
        {
            "id": team.id,
            "name": team.name,
            "team_number": team.team_number,
            "division": team.division.name if team.division else None,
            "capitain": f"{team.capitain.first_name} {team.capitain.last_name}" if team.capitain else None,
        }
        for team in teams
    ]

@app.get("/divisions/")
def get_divisions(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    divisions = db.query(Division).offset(skip).limit(limit).all()
    return [
        {
            "id": division.id,
            "name": division.name,
            "teams": [team.name for team in division.teams],
        }
        for division in divisions
    ]

## CRUD for players
# Define a schema for the incoming Player data
class PlayerCreate(BaseModel):
    first_name: str
    last_name: str
    license_number: str
    email: str | None = None
    phone1: str | None = None
    phone2: str | None = None
    team_id: int | None = None
    classification: str | None = None
    ELO_points: float = 1200.0

@app.post("/players/")
def create_player(player: PlayerCreate, db: Session = Depends(get_db)):
    new_player = Player(**player.dict())
    db.add(new_player)
    db.commit()
    db.refresh(new_player)
    return new_player

# Schema for updating a player
class PlayerUpdate(BaseModel):
    first_name: str
    last_name: str
    license_number: str
    email: str | None = None
    phone1: str | None = None
    phone2: str | None = None
    team_id: int | None = None
    classification: str | None = None
    ELO_points: float | None = None

@app.put("/players/{player_id}/")
def update_player(player_id: int, player: PlayerUpdate, db: Session = Depends(get_db)):
    existing_player = db.query(Player).filter(Player.id == player_id).first()
    if not existing_player:
        return {"error": "Player not found"}
    
    for key, value in player.dict(exclude_unset=True).items():
        setattr(existing_player, key, value)

    db.commit()
    db.refresh(existing_player)
    return existing_player

@app.delete("/players/{player_id}/")
def delete_player(player_id: int, db: Session = Depends(get_db)):
    existing_player = db.query(Player).filter(Player.id == player_id).first()
    if not existing_player:
        return {"error": "Player not found"}
    
    db.delete(existing_player)
    db.commit()
    return {"message": "Player deleted successfully"}

## CRUD for teams
# Define a schema for the incoming Team data
class TeamCreate(BaseModel):
    name: str
    team_number: str
    division_id: int | None = None
    capitain_id: int | None = None

@app.post("/teams/")
def create_team(team: TeamCreate, db: Session = Depends(get_db)):
    new_team = Team(**team.dict())
    db.add(new_team)
    db.commit()
    db.refresh(new_team)
    return new_team

# Schema for updating a team
class TeamUpdate(BaseModel):
    name: str
    team_number: str
    division_id: int | None = None
    capitain_id: int | None = None

@app.put("/teams/{team_id}/")
def update_team(team_id: int, team: TeamUpdate, db: Session = Depends(get_db)):
    existing_team = db.query(Team).filter(Team.id == team_id).first()
    if not existing_team:
        return {"error": "Team not found"}
    
    for key, value in team.dict(exclude_unset=True).items():
        setattr(existing_team, key, value)

    db.commit()
    db.refresh(existing_team)
    return existing_team

@app.delete("/teams/{team_id}/")
def delete_team(team_id: int, db: Session = Depends(get_db)):
    existing_team = db.query(Team).filter(Team.id == team_id).first()
    if not existing_team:
        return {"error": "Team not found"}
    
    db.delete(existing_team)
    db.commit()
    return {"message": "Team deleted successfully"}

## CRUD for divisions
# Define a schema for the incoming Divisions data
class DivisionCreate(BaseModel):
    name: str

@app.post("/divisions/")
def create_division(division: DivisionCreate, db: Session = Depends(get_db)):
    new_division = Division(**division.dict())
    db.add(new_division)
    db.commit()
    db.refresh(new_division)
    return new_division

# Schema for updating a division
class DivisionUpdate(BaseModel):
    name: str
    
@app.put("/divisions/{division_id}/")
def update_divisions(division_id: int, division: DivisionUpdate, db: Session = Depends(get_db)):
    existing_division = db.query(Division).filter(Division.id == division_id).first()
    if not existing_division:
        return {"error": "Division not found"}
    
    for key, value in division.dict(exclude_unset=True).items():
        setattr(existing_division, key, value)

    db.commit()
    db.refresh(existing_division)
    return existing_division

@app.delete("/divisions/{division_id}/")
def delete_division(division_id: int, db: Session = Depends(get_db)):
    existing_division = db.query(Division).filter(Division.id == division_id).first()
    if not existing_division:
        return {"error": "Division not found"}
    
    db.delete(existing_division)
    db.commit()
    return {"message": "Division deleted successfully"}