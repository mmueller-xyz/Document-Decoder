import os
from flask import Flask, flash, request, redirect, jsonify, url_for, send_from_directory
from werkzeug.utils import secure_filename
import base64

UPLOAD_FOLDER = '/files'
ALLOWED_EXTENSIONS = {'txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'}

app = Flask('__name__')
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['MAX_CONTENT_LENGTH'] = 16 * 1024 * 1024

@app.route('/base64/<filename>', methods=['POST'])
def upload_file(filename):
    filename = secure_filename(filename)
    fileFullPath = os.path.join(app.config['UPLOAD_FOLDER'], filename)

    with open(fileFullPath, 'wb') as f:
        f.write(base64.b64decode(request.data))

    return jsonify({'filename': filename})

app.run(host='0.0.0.0')