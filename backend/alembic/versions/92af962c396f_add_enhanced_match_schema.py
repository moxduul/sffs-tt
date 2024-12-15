"""Add enhanced match schema

Revision ID: 92af962c396f
Revises: f1f644a7a91e
Create Date: 2024-12-08 21:45:37.195337

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '92af962c396f'
down_revision: Union[str, None] = 'f1f644a7a91e'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    # Add new tables
    op.create_table(
        'team_matches',
        sa.Column('id', sa.Integer(), nullable=False),
        sa.Column('home_team_id', sa.Integer(), nullable=False),
        sa.Column('guest_team_id', sa.Integer(), nullable=False),
        sa.Column('division_id', sa.Integer(), nullable=False),
        sa.Column('match_date', sa.Date(), nullable=False),
        sa.Column('season', sa.Integer(), nullable=False),
        sa.Column('home_score', sa.Float(), nullable=False),
        sa.Column('guest_score', sa.Float(), nullable=False),
        sa.ForeignKeyConstraint(['home_team_id'], ['teams.id']),
        sa.ForeignKeyConstraint(['guest_team_id'], ['teams.id']),
        sa.ForeignKeyConstraint(['division_id'], ['divisions.id']),
        sa.PrimaryKeyConstraint('id')
    )

    op.create_table(
        'games',
        sa.Column('id', sa.Integer(), nullable=False),
        sa.Column('team_match_id', sa.Integer(), nullable=False),
        sa.Column('is_double', sa.Boolean(), nullable=False, default=False),
        sa.Column('winning_player_id', sa.Integer(), nullable=True),
        sa.Column('winning_team_id', sa.Integer(), nullable=True),
        sa.ForeignKeyConstraint(['team_match_id'], ['team_matches.id']),
        sa.ForeignKeyConstraint(['winning_player_id'], ['players.id']),
        sa.ForeignKeyConstraint(['winning_team_id'], ['teams.id']),
        sa.PrimaryKeyConstraint('id')
    )

    op.create_table(
        'game_players',
        sa.Column('id', sa.Integer(), nullable=False),
        sa.Column('game_id', sa.Integer(), nullable=False),
        sa.Column('player_id', sa.Integer(), nullable=False),
        sa.Column('is_home_team', sa.Boolean(), nullable=False),
        sa.Column('is_replacement', sa.Boolean(), nullable=False, default=False),
        sa.Column('elo_at_time', sa.Float(), nullable=False),
        sa.ForeignKeyConstraint(['game_id'], ['games.id']),
        sa.ForeignKeyConstraint(['player_id'], ['players.id']),
        sa.PrimaryKeyConstraint('id')
    )

    op.create_table(
        'sets',
        sa.Column('id', sa.Integer(), nullable=False),
        sa.Column('game_id', sa.Integer(), nullable=False),
        sa.Column('set_number', sa.Integer(), nullable=False),
        sa.Column('home_player_points', sa.Integer(), nullable=False),
        sa.Column('guest_player_points', sa.Integer(), nullable=False),
        sa.ForeignKeyConstraint(['game_id'], ['games.id']),
        sa.PrimaryKeyConstraint('id')
    )

    op.create_table(
        'team_memberships',
        sa.Column('id', sa.Integer(), nullable=False),
        sa.Column('player_id', sa.Integer(), nullable=False),
        sa.Column('team_id', sa.Integer(), nullable=False),
        sa.Column('start_date', sa.Date(), nullable=False),
        sa.Column('end_date', sa.Date(), nullable=True),
        sa.ForeignKeyConstraint(['player_id'], ['players.id']),
        sa.ForeignKeyConstraint(['team_id'], ['teams.id']),
        sa.PrimaryKeyConstraint('id')
    )



def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('teams',
    sa.Column('id', sa.INTEGER(), server_default=sa.text("nextval('teams_id_seq'::regclass)"), autoincrement=True, nullable=False),
    sa.Column('name', sa.VARCHAR(), autoincrement=False, nullable=False),
    sa.Column('team_number', sa.VARCHAR(), autoincrement=False, nullable=False),
    sa.Column('division_id', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('capitain_id', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.ForeignKeyConstraint(['capitain_id'], ['players.id'], name='teams_capitain_id_fkey'),
    sa.ForeignKeyConstraint(['division_id'], ['divisions.id'], name='teams_division_id_fkey'),
    sa.PrimaryKeyConstraint('id', name='teams_pkey'),
    sa.UniqueConstraint('team_number', name='teams_team_number_key'),
    postgresql_ignore_search_path=False
    )
    op.create_index('ix_teams_id', 'teams', ['id'], unique=False)
    op.create_table('players',
    sa.Column('id', sa.INTEGER(), autoincrement=True, nullable=False),
    sa.Column('first_name', sa.VARCHAR(), autoincrement=False, nullable=False),
    sa.Column('last_name', sa.VARCHAR(), autoincrement=False, nullable=False),
    sa.Column('license_number', sa.VARCHAR(), autoincrement=False, nullable=False),
    sa.Column('email', sa.VARCHAR(), autoincrement=False, nullable=True),
    sa.Column('phone1', sa.VARCHAR(), autoincrement=False, nullable=True),
    sa.Column('phone2', sa.VARCHAR(), autoincrement=False, nullable=True),
    sa.Column('team_id', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('classification', sa.VARCHAR(), autoincrement=False, nullable=True),
    sa.Column('ELO_points', sa.DOUBLE_PRECISION(precision=53), autoincrement=False, nullable=True),
    sa.ForeignKeyConstraint(['team_id'], ['teams.id'], name='players_team_id_fkey'),
    sa.PrimaryKeyConstraint('id', name='players_pkey'),
    sa.UniqueConstraint('email', name='players_email_key'),
    sa.UniqueConstraint('license_number', name='players_license_number_key')
    )
    op.create_index('ix_players_id', 'players', ['id'], unique=False)
    op.create_table('divisions',
    sa.Column('id', sa.INTEGER(), autoincrement=True, nullable=False),
    sa.Column('name', sa.VARCHAR(), autoincrement=False, nullable=False),
    sa.PrimaryKeyConstraint('id', name='divisions_pkey'),
    sa.UniqueConstraint('name', name='divisions_name_key')
    )
    op.create_index('ix_divisions_id', 'divisions', ['id'], unique=False)
    # ### end Alembic commands ###
