from flask import Flask, request, jsonify
import jwt

app = Flask(__name__)
SECRET = "mysecret"

@app.route("/", methods=["POST"])
def check_auth():
    auth = request.headers.get("authorization")
    if not auth or not auth.startswith("Bearer "):
        return jsonify({"error": "missing token"}), 401

    token = auth.split(" ")[1]
    try:
        decoded = jwt.decode(token, SECRET, algorithms=["HS256"])
        return jsonify({"result": "allow", "sub": decoded.get("sub")})
    except Exception as e:
        return jsonify({"error": str(e)}), 401

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
