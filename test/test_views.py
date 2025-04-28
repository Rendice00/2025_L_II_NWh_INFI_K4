import unittest
import json
from hello_world import app
from hello_world.formater import SUPPORTED


class FlaskrTestCase(unittest.TestCase):
    def setUp(self):
        app.config['TESTING'] = True
        self.app = app.test_client()

    def test_outputs(self):
        rv = self.app.get('/outputs')
        s = rv.data.decode('utf-8')  # Decode the bytes to string
        self.assertIn(', '.join(SUPPORTED), s)  # Adjusted for spacing

    def test_msg_with_output(self):
        rv = self.app.get('/?output=json')
        data = json.loads(rv.data)
        self.assertEqual(data, {"imie": "Remigiusz", "msg": "Hello World!"})
