from sqlalchemy import Column, Integer, String, Boolean, Float, ForeignKey, Date
from sqlalchemy.orm import relationship
from database import Base

## Structure with players, teams, divisions

class Player(Base):
    __tablename__ = "players"

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    first_name = Column(String, nullable=False)
    last_name = Column(String, nullable=False)
    license_number = Column(String, unique=True, nullable=False)
    email = Column(String, unique=True, nullable=True)
    phone1 = Column(String, nullable=True)
    phone2 = Column(String, nullable=True)
    team_id = Column(Integer, ForeignKey("teams.id"), nullable=True)
    classification = Column(String, nullable=True)  # Old classification system
    ELO_points = Column(Float, default=1200.0)  # Default ELO score

    # Relationships
    team = relationship("Team", back_populates="players", foreign_keys=[team_id])
    memberships = relationship("TeamMembership", back_populates="player")  # Add this line

class Team(Base):
    __tablename__ = "teams"

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    name = Column(String, nullable=False)
    team_number = Column(String, unique=True, nullable=False)  # Unique team number
    division_id = Column(Integer, ForeignKey("divisions.id"), nullable=True)
    capitain_id = Column(Integer, ForeignKey("players.id"), nullable=True)

    # Relationships
    players = relationship("Player", back_populates="team", foreign_keys=[Player.team_id])
    capitain = relationship("Player", foreign_keys=[capitain_id])  # Explicitly define captain relationship
    division = relationship("Division", back_populates="teams")
    memberships = relationship("TeamMembership", back_populates="team")  # Add this line

class Division(Base):
    __tablename__ = "divisions"

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    name = Column(String, nullable=False, unique=True)

    # Relationships
    teams = relationship("Team", back_populates="division")

## Structure for match management

class TeamMatch(Base):
    __tablename__ = "team_matches"

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    home_team_id = Column(Integer, ForeignKey("teams.id"), nullable=False)
    guest_team_id = Column(Integer, ForeignKey("teams.id"), nullable=False)
    division_id = Column(Integer, ForeignKey("divisions.id"), nullable=False)
    match_date = Column(Date, nullable=False)
    season = Column(Integer, nullable=False)  # Track seasons
    home_score = Column(Float, nullable=False)
    guest_score = Column(Float, nullable=False)

    # Relationships
    home_team = relationship("Team", foreign_keys=[home_team_id])
    guest_team = relationship("Team", foreign_keys=[guest_team_id])
    division = relationship("Division")
    games = relationship("Game", back_populates="team_match")

class Game(Base):
    __tablename__ = "games"

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    team_match_id = Column(Integer, ForeignKey("team_matches.id"), nullable=False)
    is_double = Column(Boolean, nullable=False, default=False)
    winning_player_id = Column(Integer, ForeignKey("players.id"), nullable=True)
    winning_team_id = Column(Integer, ForeignKey("teams.id"), nullable=True)

    # Relationships
    team_match = relationship("TeamMatch", back_populates="games")
    players = relationship("GamePlayer", back_populates="game")
    sets = relationship("Set", back_populates="game")
    winning_player = relationship("Player", foreign_keys=[winning_player_id])
    winning_team = relationship("Team", foreign_keys=[winning_team_id])

class GamePlayer(Base):
    __tablename__ = "game_players"

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    game_id = Column(Integer, ForeignKey("games.id"), nullable=False)
    player_id = Column(Integer, ForeignKey("players.id"), nullable=False)
    is_home_team = Column(Boolean, nullable=False)
    is_replacement = Column(Boolean, nullable=False, default=False)
    elo_at_time = Column(Float, nullable=False)

    # Relationships
    game = relationship("Game", back_populates="players")
    player = relationship("Player")

class Set(Base):
    __tablename__ = "sets"

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    game_id = Column(Integer, ForeignKey("games.id"), nullable=False)
    set_number = Column(Integer, nullable=False)
    home_player_points = Column(Integer, nullable=False)
    guest_player_points = Column(Integer, nullable=False)

    # Relationships
    game = relationship("Game", back_populates="sets")

class TeamMembership(Base):
    __tablename__ = "team_memberships"

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    player_id = Column(Integer, ForeignKey("players.id"), nullable=False)
    team_id = Column(Integer, ForeignKey("teams.id"), nullable=False)
    start_date = Column(Date, nullable=False)
    end_date = Column(Date, nullable=True)  # Null means currently active

    # Relationships
    player = relationship("Player", back_populates="memberships")
    team = relationship("Team", back_populates="memberships")