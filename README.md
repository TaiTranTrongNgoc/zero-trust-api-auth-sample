# Zero Trust API Auth Sample

## Run Demo

```bash
bash infra/certs/gen_certs.sh
docker compose up -d --build
python -c "import jwt; print(jwt.encode({'sub':'user1'}, 'mysecret', algorithm='HS256'))"
bash clients/test_request.sh
```
