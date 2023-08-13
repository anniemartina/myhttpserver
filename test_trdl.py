"""
Unittests for trdl flask application
"""
import pytest

import trdl

@pytest.fixture
def app():
    """
    Setup
    """
    app = trdl.app_obj()
    app.debug = True
    return app.test_client()

def test_trdl(app):
    """
    Test response status code and response data for GET
    """
    res = app.get("/")
    assert res.status_code == 200
    assert b"42" in res.data
