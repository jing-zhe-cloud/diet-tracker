import threading
import webbrowser
import time

from app import app, init_db


def open_browser():
    time.sleep(1.5)
    webbrowser.open('http://127.0.0.1:8080')


if __name__ == '__main__':
    init_db()
    threading.Thread(target=open_browser, daemon=True).start()
    app.run(host='127.0.0.1', port=8080, debug=False)
