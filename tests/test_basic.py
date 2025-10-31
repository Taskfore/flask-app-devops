import pytest
from app import app, db, User


@pytest.fixture
def client():
    app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///:memory:"
    app.config["TESTING"] = True

    with app.app_context():
        db.create_all()
        yield app.test_client()
        db.session.remove()
        db.drop_all()


def test_create_and_get_user(client):
    resp = client.post("/users", json={"name": "Alice", "email": "alice@example.com"})
    assert resp.status_code == 201
    data = resp.get_json()
    assert data["name"] == "Alice"

    resp = client.get("/users")
    assert resp.status_code == 200
    users = resp.get_json()
    assert len(users) == 1
    assert users[0]["email"] == "alice@example.com"
