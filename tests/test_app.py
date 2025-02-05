import pytest
from app import app

@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client


def test_index(client):
    """Test the index route"""
    rv = client.get('/')
    assert rv.status_code == 200
    # Добавьте другие проверки по мере необходимости


